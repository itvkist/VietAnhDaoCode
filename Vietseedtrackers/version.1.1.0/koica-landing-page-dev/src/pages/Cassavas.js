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

const mainDetailColumns = [
  {
    title: "STT",
    dataIndex: "key",
    width: "10%",
  },
  {
    title: "Đặc điểm",
    dataIndex: "feature",
    width: "45%",
  },
  {
    title: "Thông tin",
    dataIndex: "info",
    width: "45%",
  },
];

const mainColumns = [
  {
    title: "STT",
    dataIndex: "key",
    width: "4%",
    sorter: (a, b) => a.key > b.key,
  },
  {
    title: "Tên chính thức",
    dataIndex: "official_name",
    width: "10%",
    sorter: (a, b) => a.official_name > b.official_name,
  },
  {
    title: "Tên gốc",
    dataIndex: "original_name",
    width: "10%",
    sorter: (a, b) => a.original_name > b.original_name,
  },
  {
    title: "Tên giống",
    dataIndex: "variety_name",
    width: "8%",
    sorter: (a, b) => a.variety_name > b.variety_name,
  },
  {
    title: "Năm ra mắt",
    dataIndex: "released_year",
    width: "8%",
    sorter: (a, b) => a.released_year > b.released_year,
  },
  {
    title: "Đặc điểm",
    width: "40%",
    dataIndex: "feature",
  },
  {
    title: "Chi tiết",
    width: "8%",
    dataIndex: "info",
    render: (_, record) => {
      return (
        <Link
          to={"/cassavas/" + record.id}
          className="text-indigo-500 underline hover:text-indigo-700 hover:underline"
          rel="noopener noreferrer"
        >
          Xem thêm
        </Link>
      );
    },
  },
];

const detailColumns = [
  {
    name: "Phả hệ",
    api_name: "pedigree",
  },
  {
    name: "Màu lá chưa nở",
    api_name: "unexpanded_leaf_color",
  },
  {
    name: "Màu lá mở rộng hoàn toàn đầu tiên",
    api_name: "1st_fully_expanded_leaf_color",
  },
  {
    name: "Sự phát triển của lá non",
    api_name: "pubescence_of_young_leaf",
  },
  {
    name: "Hình thùy lá trung tâm",
    api_name: "central_leaf_lobe_shape",
  },
  {
    name: "Màu lá cây",
    api_name: "petiole_color",
  },
  {
    name: "Phân bố anthnocyanin trên cuống lá",
    api_name: "anthnocyanin_distribution_on_petiole",
  },
  {
    name: "Thói quen sinh trưởng của thân cây",
    api_name: "rowth_habit_of_stem",
  },
  {
    name: "Màu thân",
    api_name: "stem_color",
  },
  {
    name: "Sự hiện diện của hoa ở Ibadan",
    api_name: "presence_of_flowers_in_ibadan",
  },
  {
    name: "Màu da rễ bên ngoài",
    api_name: "outer_root_skin_color",
  },
  {
    name: "Màu da rễ bên trong",
    api_name: "inner_root_skin_color",
  },
  {
    name: "Màu thịt củ",
    api_name: "root_flesh_color",
  },
  {
    name: "Màu bột",
    api_name: "pulp_color",
  },
  {
    name: "Chiều dài cổ rễ",
    api_name: "root_neck_length",
  },
];

export const CassavaDetail = (props) => {
  const [apiData, setApiData] = useState(null);
  const [data, setData] = useState(null);

  useEffect(() => {
    axios.get(BASE_URL + "/items/cassava/" + props.id).then((res) => {
      const res_data = res?.data?.data;
      setApiData(res_data);
      const applyData = detailColumns
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
    if (apiData?.image_url) {
      const image_url = JSON.parse(apiData?.image_url);
      const urls = image_url.array.map(
        (i) => image_url.base + i + "." + image_url.type
      );
      return (
        <>
          {urls.map((i, index) => (
            <Image
              key={index}
              width={300}
              height={300}
              className="object-contain"
              src={i}
              preview={false}
              fallback="data:image/png;base64,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"
            />
          ))}
        </>
      );
    }
    return null;
  };

  return (
    <AnimationRevealPage>
      {apiData ? (
        <>
          <div className="flex flex-col justify-center items-center pb-8 h-[140px] text-lg">
            <Typography.Title>
              Giống sắn {apiData?.official_name}
            </Typography.Title>
            <p>
              Tên gốc: {apiData?.original_name} - Tên giống:{" "}
              {apiData?.variety_name} - Năm ra mắt {apiData?.released_year}
            </p>
            <p>Đặc điểm {apiData?.feature}</p>
          </div>
          <div className="flex flex-col justify-center items-center]">
            {data && (
              <div className="w-full flex justify-center scroll-data space-x-24">
                <Table
                  columns={mainDetailColumns}
                  dataSource={data}
                  className="w-2/5 overflow-auto h-full overflow-overlay"
                  pagination={{ pageSize: 50, hideOnSinglePage: true }}
                  bordered
                />
                <div className="flex flex-col space-y-1 h-full pr-6 overflow-overlay items-center">
                  <Typography.Title level={3}>Hình ảnh</Typography.Title>
                  {renderImage()}
                  {!apiData?.image_url && (
                    <Empty description="Không có hình ảnh" />
                  )}
                </div>
              </div>
            )}
          </div>
        </>
      ) : (
        <Empty
          className="flex items-center justify-center flex-1 h-full"
          description="Không tìm thấy giống sắn này"
        />
      )}
    </AnimationRevealPage>
  );
};

export default () => {
  const defaultModal = { open: false, data: null };

  const [cassavasData, setCassavaData] = useState(null);
  const [data, setData] = useState(null);
  const [modal, setModal] = useState({ ...defaultModal });
  const [search, setSearch] = useState("");

  useEffect(() => {
    axios.get(BASE_URL + "/items/cassava").then((res) => {
      const id_res = res.data.data.map((i) => ({ ...i, key: i.id.toString() }));
      setCassavaData(id_res);
      setData(id_res);
    });
  }, []);

  const onSearch = (v) => {
    setData(
      [...cassavasData].filter(
        (i) =>
          i.official_name.includes(v) ||
          i.original_name.includes(v) ||
          i.variety_name.includes(v)
      )
    );
  };
  const reset = () => {
    setSearch("");
    setData(cassavasData);
  };

  const renderImage = () => {
    if (modal.data?.image_url) {
      const image_url = JSON.parse(modal.data?.image_url);
      const urls = image_url.array.map(
        (i) => image_url.base + i + "." + image_url.type
      );
      return (
        <>
          {urls.map((i, index) => (
            <Image
              key={index}
              width={200}
              height={200}
              className="object-contain"
              src={i}
              preview={false}
              fallback="data:image/png;base64,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"
            />
          ))}
        </>
      );
    }
    return null;
  };

  return (
    <AnimationRevealPage>
      <div className="flex flex-col justify-center items-center">
        <Typography.Title>Danh sách các giống sắn</Typography.Title>
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
          className="w-full h-4/5 overflow-auto px-16"
          // onRow={(record, rowIndex) => {
          //   return {
          //     onClick: (event) => {
          //       console.log(event);
          //       setModal({ open: true, data: record });
          //     },
          //   };
          // }}
        />
      </div>
      <div>
        <Modal
          title={`Thông tin chi tiết ${modal.data?.original_name}`}
          open={modal.open}
          onCancel={() => setModal({ ...defaultModal })}
          footer={false}
          width={1000}
        >
          {modal.data && (
            <>
              <div className="pb-4">
                {detailColumns.map((i, rowIndex) => {
                  if (modal.data[i.api_name])
                    return (
                      <Row key={rowIndex}>
                        <Col span={2}>{rowIndex}</Col>
                        <Col span={12}>{i.name}</Col>
                        <Col span={10}>{modal.data[i.api_name]}</Col>
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
