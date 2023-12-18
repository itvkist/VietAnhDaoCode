import React, { useEffect, useState } from "react";
import { InboxOutlined } from "@ant-design/icons";
import { Button, Form, Image, message, Table, Typography, Upload } from "antd";
import AnimationRevealPage from "helpers/AnimationRevealPage";
import axiosInstance from "services/axios";
import { BASE_URL } from "services/url";
const { Dragger } = Upload;

const columns = [
  {
    title: "STT",
    dataIndex: "id",
    key: "id",
  },
  {
    title: "Tên bệnh",
    dataIndex: "name",
    key: "name",
  },
  {
    title: "Xác suất",
    dataIndex: "probability",
    key: "probability",
  },
];

export const DiagnosticsDetail = (props) => {
  const [data, setData] = useState(props.data || []);
  const dataSrc = () =>
    data && data.diag
      ? data.diag.map((i, index) => ({
          name: i.label,
          id: index + 1,
          probability: i.probability,
          key: index.toString(),
        }))
      : [];

  useEffect(() => {
    if (data.id) {
      axiosInstance.get("/items/diagnostics/" + data.id).then((res) => {
        const res_data = res?.data?.data;
        axiosInstance
          .get(
            `/items/diagnostics_files?fields[]=directus_files_id.id&fields[]=directus_files_id.type&fields[]=directus_files_id.title&fields[]=directus_files_id.filename_download&fields[]=id&filter[_and][0][diagnostics_id]=${data.id}`
          )
          .then((imagesRes) => {
            if (imagesRes.status === 200)
              setData({ ...res_data, images: [...imagesRes.data.data] });
          });
      });
    }
    // eslint-disable-next-line
  }, [props.id]);

  return (
    <div>
      <div className="flex justify-center w-full px-16 space-x-4">
        {data &&
          data.images &&
          data.images.length > 0 &&
          data.images.map((i, index) =>
            i.directus_files_id ? (
              <Image
                key={index}
                width={180}
                height={180}
                alt={i.directus_files_id.title || "sos"}
                src={BASE_URL + "/assets/" + i.directus_files_id.id || null}
                preview={false}
              />
            ) : (
              <></>
            )
          )}
      </div>
      <div className="flex justify-center w-full px-16 pt-4">
        <Table dataSource={dataSrc()} columns={columns} />
      </div>
    </div>
  );
};

const Diagnostics = () => {
  const [fileList, setFileList] = useState([]);
  const [addingList, setAddingList] = useState(false);
  const [submitList, setSubmitList] = useState([]);
  // eslint-disable-next-line
  const [submittingList, setSubmittingList] = useState(false);
  const [diagnostics, setDiagnostics] = useState(null);
  const resetData = () => {
    setDiagnostics(null);
  };

  const beforeUpload = (file) => {
    if (!["image/jpeg", "image/png"].includes(file.type)) {
      message.error(`${file.name} không phải ảnh.`, 2);
      return null;
    }
    return false;
  };
  function onChange({ fileList }) {
    setFileList(fileList.filter((file) => file.status !== "error"));
  }
  const onRemove = async (file) => {
    const index = fileList.indexOf(file);
    const newFileList = fileList.slice();
    newFileList.splice(index, 1);

    setFileList(newFileList);
  };

  const handleFinish = async () => {
    if (fileList.length < 1) {
      message.error("Không có ảnh!");
      return;
    } else {
      var submittingList = [];
      try {
        setAddingList(true);

        await Promise.all(
          fileList.map(async (file) => {
            const formData = new FormData();
            formData.append("title", file.name);
            formData.append("file", file.originFileObj);
            try {
              await axiosInstance.post("/files", formData).then((res) => {
                if (res && res.status === 200) {
                  const resData = res.data.data;
                  const submitItem = {
                    diagnostics_id: "+",
                    directus_files_id: {
                      id: resData.id,
                    },
                  };
                  submittingList = [...submittingList, { ...submitItem }];
                }
              });
              formData.delete("file");
              formData.append("image", file.originFileObj);
              await axiosInstance
                .post("http://iai.uet.vnu.edu.vn:8001/classify_image", formData)
                .then((res) => {
                  setDiagnostics({
                    ...diagnostics,
                    diag: res.data.data || null,
                  });
                });
            } catch (e) {}
          })
        );

        setFileList([]);
        setSubmitList([...submittingList]);
        message.success(`Thêm ảnh thành công.`, 2);
      } catch (err) {
        message.error(`Thêm ảnh không thành công.`, 2);
      } finally {
        setAddingList(false);
      }
    }
  };

  async function postDiagnostics() {
    try {
      setSubmittingList(true);
      await axiosInstance
        .post("/items/diagnostics", {
          images: {
            create: [...submitList],
            delete: [],
            update: [],
          },
        })
        .then((res) => {
          if (res && res.status === 200) {
            message.success(`Tạo chuẩn đoán mới thành công.`, 2);
            setSubmitList([]);
            const resData = res.data.data;
            setDiagnostics({ ...resData, ...diagnostics });
          }
        });
    } catch (err) {
      message.error(`Tạo chuẩn đoán mới không thành công.`, 2);
    } finally {
      setSubmittingList(false);
    }
  }

  useEffect(() => {
    if (!addingList && submitList.length > 0) {
      postDiagnostics();
    }
    // eslint-disable-next-line
  }, [submitList, addingList]);

  // token : 1972g9KX-DYPlUROjFD8yZuY9FdWFy83
  return (
    <AnimationRevealPage>
      <div className="content-inside overflow-overlay">
        <div className="flex flex-col justify-center items-center">
          <Typography.Title>Chuẩn đoán bệnh</Typography.Title>
        </div>
        {!diagnostics && (
          <div className="flex justify-center p-8">
            <Form onFinish={handleFinish}>
              <div className="uploadContainer">
                <Dragger
                  name="Upload"
                  fileList={[...fileList]}
                  accept="image/*"
                  listType="picture"
                  multiple
                  beforeUpload={beforeUpload}
                  onChange={onChange}
                  onRemove={onRemove}
                  maxCount={1}
                >
                  <p className="ant-upload-drag-icon">
                    <InboxOutlined />
                  </p>
                  <p className="ant-upload-text px-36">
                    Bấm hoặc kéo thả để tải ảnh
                  </p>
                  <p className="ant-upload-hint px-36">
                    Chỉ chấp nhận các file .png, .jpg.
                  </p>
                </Dragger>
              </div>
              <Form.Item className="flex justify-center mt-4">
                <Button shape="round" htmlType="submit" className="mt-4">
                  {addingList ? "Đang đăng ảnh" : "Đăng ảnh"}
                </Button>
              </Form.Item>
            </Form>
          </div>
        )}
        {diagnostics && (
          <div className="flex flex-col w-full justify-center items-center">
            <Button
              shape="round"
              className="my-4 bg-indigo-500 hover:bg-indigo-700"
              onClick={resetData}
            >
              Tạo chuẩn đoán mới
            </Button>
            <DiagnosticsDetail data={diagnostics} />
          </div>
        )}
      </div>
    </AnimationRevealPage>
  );
};
export default Diagnostics;
