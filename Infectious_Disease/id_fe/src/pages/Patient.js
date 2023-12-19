import React, { useEffect, useState } from "react";
import { css } from "styled-components/macro"; //eslint-disable-line
import AnimationRevealPage from "helpers/AnimationRevealPage.js";
import { Table, Typography, Image, Input, Button, Empty } from "antd";
import { ArrowLeftOutlined, ReloadOutlined } from "@ant-design/icons";
import { Link, useNavigate } from "react-router-dom";
import { getCassavaDetail, getCassavas } from "services/axios/cassava";
import { BASE_URL } from "services/url";
import { compareStringNormal } from "services/helper";
import tw from "twin.macro";
import { HighlightedText1 } from "components/misc/Headings";
import { SectionHeading } from "components/misc/Headings";
import { Subheading } from "components/misc/Headings";


const Heading = tw.h1`font-black text-3xl md:text-5xl leading-snug max-w-3xl`;


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

const detailColumns = [
  { name: "Nhãn", api_name: "label" },
  { name: "Tên gốc", api_name: "original_name" },
  { name: "Tên chủng giống", api_name: "variety_name" },
  { name: "Năm phát hành", api_name: "year_of_release" },
  { name: "Nòi giống", api_name: "pedigree" },
  { name: "Màu sắc lá đỉnh", api_name: "color_of_apical_leaves" },
  { name: "Lông ngắn trên lá đỉnh", api_name: "pubescence_on_apical_leaves" },
  { name: "Hình thái thùy trung tâm", api_name: "shape_of_central_leaflet" },
  { name: "Màu sắc lá", api_name: "leaf_color" },
  { name: "Số lượng thùy lá", api_name: "number_of_leaf_lobes" },
  { name: "Màu sắc gân lá", api_name: "color_of_leaf_vein" },
  { name: "Màu sắc cuống lá", api_name: "petiole_color" },
  {
    name: "Trạng thái cuống lá liên quan đến thân",
    api_name: "orientation_of_petiole",
  },
  { name: "Độ lồi sẹo lá", api_name: "prominence_of_foliar_scars" },
  { name: "Màu sắc lớp biểu bì thân", api_name: "color_of_stem_cortex" },
  {
    name: "Màu sắc lớp bên trong vỏ thân",
    api_name: "color_of_stem_epidermis",
  },
  { name: "Màu sắc lớp bên ngoài vỏ thân", api_name: "color_of_stem_exterior" },
  { name: "Dạng phát triển thân", api_name: "growth_habit_of_stem" },
  { name: "Cấp độ phân cành", api_name: "levels_of_branching" },
  { name: "Hình thái cây", api_name: "shape_of_plant" },
  { name: "Sự hình thành cổ củ", api_name: "extent_of_root_peduncle" },
  { name: "Hình dạng rễ", api_name: "root_shape" },
  { name: "Màu sắc lớp bề mặt củ", api_name: "external_color_of_storage_root" },
  { name: "Màu sắc lớp thịt củ", api_name: "color_of_root_pulp" },
  { name: "Màu sắc vỏ lụa củ", api_name: "color_of_root_cortex" },
];

const mainColumns = [
  {
    title: "STT",
    dataIndex: "key",
    sorter: (a, b) => a.key > b.key,
    render: (_v, _r, index) => {
      return index + 1;
    },
    with: "10%",
  },
  ...detailColumns.slice(0, 5).map((i) => ({
    title: i.name,
    dataIndex: i.api_name,
    sorter: (a, b) =>
      a[i.api_name] && b[i.api_name]
        ? a[i.api_name].localeCompare(b[i.api_name])
        : 0,
    render: (v) => {
      return v ? v : "Chưa có dữ liệu";
    },
    with: "15%",
  })),
  {
    title: "Chi tiết",
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
    with: "15%",
  },
];

export const CassavaDetail = (props) => {
  const navigate = useNavigate();
  const [apiData, setApiData] = useState(null);
  const [data, setData] = useState(null);

  useEffect(() => {
    getCassavaDetail(props.id).then((res) => {
      const res_data = res?.data?.data[0];
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
    if (apiData?.images && apiData?.images?.length > 0) {
      const urls = apiData.images.map(
        (i) => BASE_URL + "/assets/" + i?.directus_files_id
      );
      return (
        <div className="img-list">
          {urls.map((i, index) => (
            <Image
              key={index}
              width={300}
              height={300}
              className="object-contain"
              src={i}
              preview={false}
              fallback="https://pqm.vn/wp-content/uploads/2021/02/phuong-phap-trong-va-cham-soc-cay-san-cay-san-cay-khoai-mi-neo-nam-viet-1-768x432.jpg"
            />
          ))}
        </div>
      );
    }
    return null;
  };

  return (
    <AnimationRevealPage>
      {apiData ? (
        <>
          <div className="flex flex-col justify-center items-center h-[140px] text-lg">
            <div className="flex items-center justify-center sm:py-4">
              <Button
                className="absolute !hidden sm:!block"
                style={{ left: "-280px" }}
                size="large"
                shape="circle"
                icon={<ArrowLeftOutlined />}
                onClick={() => navigate(-1)}
              />
              <Typography.Title style={{ margin: 0 }}>
                Giống sắn {apiData?.official_name || apiData?.label}
              </Typography.Title>
            </div>
            <p className="px-4 sm:px-0 text-center">
              Tên gốc: {apiData?.original_name || "Chưa có"} - Tên giống:{" "}
              {apiData?.variety_name || "Chưa có"} - Năm ra mắt:{" "}
              {apiData?.year_of_release || "Chưa có"}
            </p>
          </div>
          <div className="flex flex-col justify-center items-center">
            {data && (
              <div className="w-full flex sm:flex-row flex-col justify-center sm:scroll-data sm:space-x-24">
                <Table
                  columns={mainDetailColumns}
                  dataSource={data}
                  className="sm:w-2/5 w-full overflow-auto h-full overflow-overlay"
                  pagination={{ pageSize: 50, hideOnSinglePage: true }}
                  bordered
                />
                <div className="flex flex-col space-y-1 h-full sm:pr-6 overflow-overlay items-center">
                  <Typography.Title level={3}>Hình ảnh</Typography.Title>
                  {renderImage()}
                  {!apiData?.images && apiData.images?.length < 1 && (
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
  const [cassavaData, setCassavaData] = useState(null);
  const [data, setData] = useState(null);
  const [search, setSearch] = useState("");

  useEffect(() => {
    getCassavas().then((res) => {
      const id_res = res.data.data.map((i) => ({ ...i, key: i.id.toString() }));
      setCassavaData(id_res);
      setData(id_res);
    });
  }, []);

  const onSearch = (v) => {
    const lowerSearch = v.toLowerCase();
    setData(
      [...cassavaData].filter(
        (i) =>
          compareStringNormal(i.official_name || "", lowerSearch) ||
          compareStringNormal(i.label || "", lowerSearch) ||
          compareStringNormal(i.original_name || "", lowerSearch) ||
          compareStringNormal(i.variety_name || "", lowerSearch) ||
          compareStringNormal(i.pedigree || "", lowerSearch)
      )
    );
  };
  const reset = () => {
    setSearch("");
    setData(cassavaData);
  };

  return (
    <AnimationRevealPage>
          <div style={{ marginTop: "20px", marginLeft: "40px" }}>
              <div style={{ position: "relative" }}>
                  <div
                      style={{
                          position: "relative",
                          background: "#0D99FF",
                          padding: "10px",
                          borderRadius: "10px",
                          width: "fit-content",
                      }}
                  >
                      <p style={{ color: "white", fontWeight: "bold", display: "inline" }}>
                          Personal information
                      </p>
                  </div>
                  <div style={{ marginTop: "10px", display: "flex" }}>
                      <div style={{ marginTop: "0px", marginLeft: "20px" }}>
                          <p>Name:</p>
                          <p>Gender:</p>
                          <p>Date of birth:</p>
                          <p>Province/city:</p>
                          <p>District:</p>
                          <p>ID number:</p>
                          <p>Phone number:</p>
                          <p>Email:</p>
                      </div>
                      <div style={{ marginTop: "0px", marginLeft: "60px" }}>
                          <p>Lo Anh Duc</p>
                          <p>Male</p>
                          <p>01/02/1995</p>
                          <p>Hanoi</p>
                          <p>19021243</p>
                          <p>034101007845</p>
                          <p>0328919074</p>
                          <p>ducla@hanoihospital.com</p>
                      </div>
                  </div>

                  <div
                      style={{
                          marginTop: "20px",
                          position: "relative",
                          background: "#0D99FF",
                          padding: "10px",
                          borderRadius: "10px",
                          width: "fit-content",
                      }}
                  >
                      <p
                          style={{ color: "white", fontWeight: "bold", display: "inline" }}
                      >
                          Patient management
                      </p>
                  </div>
                  <div style={{ marginTop: "10px", display: "flex" }}>
                      <div style={{ marginTop: "0px", marginLeft: "20px" }}>
                          <p>Medical history:</p>
                          <p>Drug using history:</p>
                          <p>Family medical history:</p>
                      </div>
                      <div style={{ marginTop: "0px", marginLeft: "60px" }}>
                          <p></p>
                          <p></p>
                          <p></p>
                      </div>
                  </div>
                  <div
                      style={{
                          marginTop: "20px",
                          position: "relative",
                          background: "#0D99FF",
                          padding: "10px",
                          borderRadius: "10px",
                          width: "fit-content",
                      }}
                  >
                      <p
                          style={{ color: "white", fontWeight: "bold", display: "inline" }}
                      >
                          Hospital medical history
                      </p>
                  </div>
                  <div style={{ marginTop: "10px", display: "flex" }}>
                      <div style={{ marginTop: "0px", marginLeft: "20px" }}>
                          <p><strong>No.01</strong></p>
                          <p>Date:</p>
                          <p>Hospital:</p>
                          <p>Doctors:</p>
                          <p>Symptoms:</p>
                          <p>Tests:</p>
                          <p>Diagnose:</p>
                          <p>Drug:</p>
                          <p>Advice:</p>
                          <p>Follow-up appointment:</p>
                      </div>
                      <div style={{ marginTop: "0px", marginLeft: "60px" }}>
                          <p>&nbsp;</p>
                          <p>18/09/2021 </p>
                          <p>Thanh Hoa hospital </p>
                          <p>Ms Nguyen Van A</p>
                          <p>xxx</p>
                          <p>xxx, xxx, xxx</p>
                          <p>xxx </p>
                          <p>Paracetamol xxx</p>
                          <p>xxx</p>
                          <p>xxx</p>
                      </div>
                  </div>
                  <div style={{ marginTop: "10px", display: "flex" }}>
                      <div style={{ marginTop: "0px", marginLeft: "20px" }}>
                          <p><strong>No.02</strong></p>
                          <p>Date:</p>
                          <p>Hospital:</p>
                          <p>Doctors:</p>
                          <p>Symptoms:</p>
                          <p>Tests:</p>
                          <p>Diagnose:</p>
                          <p>Drug:</p>
                          <p>Advice:</p>
                          <p>Follow-up appointment:</p>
                      </div>
                      <div style={{ marginTop: "0px", marginLeft: "60px" }}>
                          <p>&nbsp;</p>
                          <p>21/10/2022 </p>
                          <p>Thanh Hoa hospital </p>
                          <p>Mr Tran Thi B</p>
                          <p>xxx </p>
                          <p>xxx, xxx, xxx</p>
                          <p>xxx </p>
                          <p>Paracetamol xxx</p>
                          <p>xxx</p>
                          <p>xxx</p>
                      </div>
                  </div>
              </div>

              
          </div>  
    </AnimationRevealPage>
  );
};
