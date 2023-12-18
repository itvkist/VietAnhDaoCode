import React, { useEffect, useState } from "react";
import { css } from "styled-components/macro"; //eslint-disable-line
import AnimationRevealPage from "helpers/AnimationRevealPage.js";
import axios from "axios";
import { BASE_URL } from "services/url";
import {
  Col,
  Modal,
  Row,
  Table,
  Typography,
  Image,
  Input,
  Button,
  Empty,
} from "antd";
import { ReloadOutlined } from "@ant-design/icons";
import { Link } from "react-router-dom";

const cropString = (text) => {
  return text.length > 253 ? text.substring(0, 250) + "..." : text;
};

const mainDetailColumns = [
  {
    title: "STT",
    dataIndex: "key",
    width: "5%",
  },
  {
    title: "Đặc điểm",
    dataIndex: "feature",
    width: "10%",
  },
  {
    title: "Thông tin",
    dataIndex: "info",
    width: "85%",
  },
];

const mainColumns = [
  {
    title: "STT",
    dataIndex: "key",
    name: "STT",
    api_name: "key",
    width: "4%",
    sorter: (a, b) => a.key > b.key,
  },
  {
    title: "Tên",
    dataIndex: "name",
    name: "Tên",
    api_name: "name",
    width: "10%",
    sorter: (a, b) => a.name > b.name,
  },
  {
    title: "Tên tiếng Việt",
    dataIndex: "vn_name",
    name: "Tên tiếng Việt",
    api_name: "vn_name",
    width: "10%",
    sorter: (a, b) => a.vn_name > b.vn_name,
  },
  {
    title: "Đặc điểm",
    dataIndex: "feature",
    name: "Đặc điểm",
    api_name: "feature",
    width: "22%",
    render: (text) => <>{cropString(text)}</>,
  },
  {
    title: "Ảnh hưởng",
    dataIndex: "effect",
    name: "Ảnh hưởng",
    api_name: "effect",
    width: "22%",
    render: (text) => <>{cropString(text)}</>,
  },
  {
    title: "Chữa trị/Phòng tránh",
    dataIndex: "cure",
    name: "Chữa trị/Phòng tránh",
    api_name: "cure",
    width: "22%",
    render: (text) => <>{cropString(text)}</>,
  },
  {
    title: "Chi tiết",
    width: "8%",
    dataIndex: "info",
    render: (_, record) => {
      return (
        <Link
          to={"/diseases/" + record.id}
          className="text-indigo-500 underline hover:text-indigo-700 hover:underline"
          rel="noopener noreferrer"
        >
          <Typography.Link>Xem thêm</Typography.Link>
        </Link>
      );
    },
  },
];

export const DiseaseDetail = (props) => {
  const [apiData, setApiData] = useState(null);
  const [data, setData] = useState(null);

  useEffect(() => {
    axios.get(BASE_URL + "/items/disease/" + props.id).then((res) => {
      const res_data = res?.data?.data;
      setApiData(res_data);
      const applyData = mainColumns
        .filter((e) => res_data[e.api_name])
        .map((i, index) => ({
          feature: i.name,
          info: res_data[i.api_name],
          key: index + 1,
        }));
      setData(applyData);
    });
  }, [props.id]);

  const renderImage = () => {
    return apiData?.image_url ? (
      <Image
        width={200}
        height={200}
        className="object-contain"
        src={apiData?.image_url}
        preview={false}
        fallback="data:image/png;base64,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"
      />
    ) : null;
  };

  return (
    <AnimationRevealPage>
      {apiData ? (
        <>
          <div className="flex flex-col justify-center items-center pt-4">
            <Typography.Title>Loại bệnh {apiData?.vn_name}</Typography.Title>
          </div>
          <div className="flex flex-col justify-center items-center]">
            {data && (
              <div className="w-full flex flex-col items-center space-x-24">
                <div className="flex h-[200px] w-full overflow-overlay justify-center">
                  {renderImage()}
                  {!apiData?.image_url && (
                    <Empty description="Không có hình ảnh" />
                  )}
                </div>
                <Table
                  columns={mainDetailColumns}
                  dataSource={data}
                  className="w-4/5 overflow-auto h-full overflow-overlay"
                  pagination={{ pageSize: 50, hideOnSinglePage: true }}
                />
              </div>
            )}
          </div>
        </>
      ) : (
        <Empty
          className="flex items-center justify-center flex-1 h-full"
          description="Không tìm thấy loại bệnh này"
        />
      )}
    </AnimationRevealPage>
  );
};

export default () => {
  const defaultModal = { open: false, data: null };

  const [diseaseData, setDiseaseData] = useState(null);
  const [data, setData] = useState(null);
  const [modal, setModal] = useState({ ...defaultModal });
  const [search, setSearch] = useState("");

  useEffect(() => {
    axios.get(BASE_URL + "/items/disease").then((res) => {
      const id_res = res.data.data.map((i) => ({ ...i, key: i.id.toString() }));
      setDiseaseData(id_res);
      setData(id_res);
    });
  }, []);

  const onSearch = (v) => {
    setData(
      [...diseaseData].filter(
        (i) => i.name.includes(v) || i.vn_name.includes(v)
      )
    );
  };
  const reset = () => {
    setSearch("");
    setData(diseaseData);
  };

  const renderImage = () => {
    return modal.data?.image_url ? (
      <Image
        width={200}
        height={200}
        className="object-contain"
        src={modal.data?.image_url}
        preview={false}
        fallback="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMIAAADDCAYAAADQvc6UAAABRWlDQ1BJQ0MgUHJvZmlsZQAAKJFjYGASSSwoyGFhYGDIzSspCnJ3UoiIjFJgf8LAwSDCIMogwMCcmFxc4BgQ4ANUwgCjUcG3awyMIPqyLsis7PPOq3QdDFcvjV3jOD1boQVTPQrgSkktTgbSf4A4LbmgqISBgTEFyFYuLykAsTuAbJEioKOA7DkgdjqEvQHEToKwj4DVhAQ5A9k3gGyB5IxEoBmML4BsnSQk8XQkNtReEOBxcfXxUQg1Mjc0dyHgXNJBSWpFCYh2zi+oLMpMzyhRcASGUqqCZ16yno6CkYGRAQMDKMwhqj/fAIcloxgHQqxAjIHBEugw5sUIsSQpBobtQPdLciLEVJYzMPBHMDBsayhILEqEO4DxG0txmrERhM29nYGBddr//5/DGRjYNRkY/l7////39v///y4Dmn+LgeHANwDrkl1AuO+pmgAAADhlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAqACAAQAAAABAAAAwqADAAQAAAABAAAAwwAAAAD9b/HnAAAHlklEQVR4Ae3dP3PTWBSGcbGzM6GCKqlIBRV0dHRJFarQ0eUT8LH4BnRU0NHR0UEFVdIlFRV7TzRksomPY8uykTk/zewQfKw/9znv4yvJynLv4uLiV2dBoDiBf4qP3/ARuCRABEFAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghggQAQZQKAnYEaQBAQaASKIAQJEkAEEegJmBElAoBEgghgg0Aj8i0JO4OzsrPv69Wv+hi2qPHr0qNvf39+iI97soRIh4f3z58/u7du3SXX7Xt7Z2enevHmzfQe+oSN2apSAPj09TSrb+XKI/f379+08+A0cNRE2ANkupk+ACNPvkSPcAAEibACyXUyfABGm3yNHuAECRNgAZLuYPgEirKlHu7u7XdyytGwHAd8jjNyng4OD7vnz51dbPT8/7z58+NB9+/bt6jU/TI+AGWHEnrx48eJ/EsSmHzx40L18+fLyzxF3ZVMjEyDCiEDjMYZZS5wiPXnyZFbJaxMhQIQRGzHvWR7XCyOCXsOmiDAi1HmPMMQjDpbpEiDCiL358eNHurW/5SnWdIBbXiDCiA38/Pnzrce2YyZ4//59F3ePLNMl4PbpiL2J0L979+7yDtHDhw8vtzzvdGnEXdvUigSIsCLAWavHp/+qM0BcXMd/q25n1vF57TYBp0a3mUzilePj4+7k5KSLb6gt6ydAhPUzXnoPR0dHl79WGTNCfBnn1uvSCJdegQhLI1vvCk+fPu2ePXt2tZOYEV6/fn31dz+shwAR1sP1cqvLntbEN9MxA9xcYjsxS1jWR4AIa2Ibzx0tc44fYX/16lV6NDFLXH+YL32jwiACRBiEbf5KcXoTIsQSpzXx4N28Ja4BQoK7rgXiydbHjx/P25TaQAJEGAguWy0+2Q8PD6/Ki4R8EVl+bzBOnZY95fq9rj9zAkTI2SxdidBHqG9+skdw43borCXO/ZcJdraPWdv22uIEiLA4q7nvvCug8WTqzQveOH26fodo7g6uFe/a17W3+nFBAkRYENRdb1vkkz1CH9cPsVy/jrhr27PqMYvENYNlHAIesRiBYwRy0V+8iXP8+/fvX11Mr7L7ECueb/r48eMqm7FuI2BGWDEG8cm+7G3NEOfmdcTQw4h9/55lhm7DekRYKQPZF2ArbXTAyu4kDYB2YxUzwg0gi/41ztHnfQG26HbGel/crVrm7tNY+/1btkOEAZ2M05r4FB7r9GbAIdxaZYrHdOsgJ/wCEQY0J74TmOKnbxxT9n3FgGGWWsVdowHtjt9Nnvf7yQM2aZU/TIAIAxrw6dOnAWtZZcoEnBpNuTuObWMEiLAx1HY0ZQJEmHJ3HNvGCBBhY6jtaMoEiJB0Z29vL6ls58vxPcO8/zfrdo5qvKO+d3Fx8Wu8zf1dW4p/cPzLly/dtv9Ts/EbcvGAHhHyfBIhZ6NSiIBTo0LNNtScABFyNiqFCBChULMNNSdAhJyNSiECRCjUbEPNCRAhZ6NSiAARCjXbUHMCRMjZqBQiQIRCzTbUnAARcjYqhQgQoVCzDTUnQIScjUohAkQo1GxDzQkQIWejUogAEQo121BzAkTI2agUIkCEQs021JwAEXI2KoUIEKFQsw01J0CEnI1KIQJEKNRsQ80JECFno1KIABEKNdtQcwJEyNmoFCJAhELNNtScABFyNiqFCBChULMNNSdAhJyNSiECRCjUbEPNCRAhZ6NSiAARCjXbUHMCRMjZqBQiQIRCzTbUnAARcjYqhQgQoVCzDTUnQIScjUohAkQo1GxDzQkQIWejUogAEQo121BzAkTI2agUIkCEQs021JwAEXI2KoUIEKFQsw01J0CEnI1KIQJEKNRsQ80JECFno1KIABEKNdtQcwJEyNmoFCJAhELNNtScABFyNiqFCBChULMNNSdAhJyNSiECRCjUbEPNCRAhZ6NSiAARCjXbUHMCRMjZqBQiQIRCzTbUnAARcjYqhQgQoVCzDTUnQIScjUohAkQo1GxDzQkQIWejUogAEQo121BzAkTI2agUIkCEQs021JwAEXI2KoUIEKFQsw01J0CEnI1KIQJEKNRsQ80JECFno1KIABEKNdtQcwJEyNmoFCJAhELNNtScABFyNiqFCBChULMNNSdAhJyNSiEC/wGgKKC4YMA4TAAAAABJRU5ErkJggg=="
      />
    ) : null;
  };

  return (
    <AnimationRevealPage>
      <div className="flex flex-col justify-center items-center">
        <Typography.Title>Danh sách các bệnh trên cây sắn</Typography.Title>
      </div>
      <div className="flex flex-col justify-center items-center">
        <div className="w-96 flex space-x-4 justify-center pb-8">
          <Input.Search
            placeholder="Tìm kiếm theo tên"
            value={search}
            onChange={(v) => setSearch(v.value)}
            onSearch={onSearch}
          />
          <Button icon={<ReloadOutlined />} onClick={reset} />
        </div>
      </div>
      <div className="flex flex-col justify-center items-center">
        <Table
          columns={mainColumns}
          dataSource={data}
          className="w-full h-4/5 px-20 overflow-auto"
          pagination={{ hideOnSinglePage: true }}
          // onRow={(record, rowIndex) => {
          //   return {
          //     onClick: (event) => {
          //       setModal({ open: true, data: record });
          //     },
          //   };
          // }}
        />
      </div>
      <div>
        <Modal
          title={`Thông tin chi tiết ${modal.data?.vn_name}`}
          open={modal.open}
          onCancel={() => setModal({ ...defaultModal })}
          footer={false}
          width={1000}
        >
          {modal.data && (
            <>
              <div className="pb-4">
                {mainColumns.map((i, rowIndex) => {
                  if (modal.data[i.dataIndex] && i.dataIndex !== "key")
                    return (
                      <Row key={rowIndex} className="border-solid border-b">
                        <Col span={24}>
                          <strong>{i.title}:</strong> {modal.data[i.dataIndex]}
                        </Col>
                      </Row>
                    );
                  else return null;
                })}
              </div>
              {modal.data.image_url && (
                <>
                  <Typography.Title level={5}>Hình ảnh</Typography.Title>
                  <div className="w-[952px] h-[200px] overflow-auto flex">
                    {renderImage()}
                  </div>
                </>
              )}
              {!modal.data.image_url && (
                <Typography.Title level={5}>Không có hình ảnh</Typography.Title>
              )}
            </>
          )}
        </Modal>
      </div>
    </AnimationRevealPage>
  );
};
