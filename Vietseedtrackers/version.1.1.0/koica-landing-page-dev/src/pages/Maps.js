import React, { useContext, useEffect, useState } from "react";
import { css } from "styled-components/macro"; //eslint-disable-line
import AnimationRevealPage from "helpers/AnimationRevealPage.js";
import axios from "axios";
import { BASE_URL } from "services/url";
import { Button, Col, List, Row, Select, Typography } from "antd";
import { MapContainer, Marker, Popup, TileLayer } from "react-leaflet";
import L from "leaflet";
import { convertVNtoEN } from "services/helper";
import Context from "services/context";
import { ReloadOutlined } from "@ant-design/icons";
import { Link } from "react-router-dom";

var iconLibs = [
  { icon: "marker_blue.png", meaning: "Các quận / huyện" },
  { icon: "marker_yellow.png", meaning: "Các phường / xã" },
  { icon: "marker_red.png", meaning: "Nơi có dịch bệnh" },
];

var CustomIcon = (iconName = "marker_blue", degree = 0) => {
  degree *= 4;
  var iconSize = 2 * (16 + degree);
  var shadowSize = 2 * (14 + degree);
  var shadowAnchor = 2 * 5 + degree;
  return new L.Icon({
    iconUrl: require(`../../public/assets/icons/${iconName}.png`),
    shadowUrl: require("../../public/assets/icons/marker_shadow.png"),
    iconSize: [iconSize, iconSize],
    shadowSize: [shadowSize, shadowSize],
    iconAnchor: [iconSize / 2, iconSize],
    shadowAnchor: [shadowAnchor, shadowSize],
    popupAnchor: [0, -iconSize - 2],
  });
};

export default () => {
  const default_data = {
    districts: null,
    selectedData: { district: null, ward: null },
  };
  const [data, setData] = useState(default_data);
  const [diseaseData, setDiseaseData] = useState(null);

  const context = useContext(Context);

  const getData = async (type = "district", parent_code = null) => {
    return await axios
      .get(
        BASE_URL +
          "/items/area?fields=id,code,name,lat,lon,type,parent_code&limit=-1" +
          `&filter[type][_eq]=${type}` +
          (parent_code ? `&filter[parent_code][_eq]=${parent_code}` : "")
      )
      .then((response) => {
        return response.status === 200 ? response.data.data : null;
      });
  };

  const getDiseaseData = async () => {
    return await axios
      .get(
        BASE_URL +
          "/items/area_disease?fields=id,id_area,id_disease,lat,lon,degree&limit=-1"
      )
      .then(async (response) => {
        if (response.status !== 200) return null;
        const res_data = response.data.data;
        var disease = null;
        if (!context.disease)
          await axios
            .get(BASE_URL + "/items/disease")
            .then((diseaseResponse) => {
              disease = diseaseResponse.data.data;
              context.setDisease(disease);
              setDiseaseData(disease);
            });
        else {
          setDiseaseData(context.disease);
          disease = context.disease;
        }
        return res_data.map((i) => {
          var finding = disease.find(
            (fruit) => parseInt(fruit.id) === parseInt(i.id_disease)
          );
          return { ...i, ...finding };
        });
      });
  };

  useEffect(() => {
    getDiseaseData().then((res) => {
      res && setDiseaseData(res);
    });
    // eslint-disable-next-line
  }, []);
  
  // set map for diseases
  useEffect(() => {
    if (diseaseData) {
      getData().then(async (districtsRes) => {
        const mergedRes = await Promise.all(
          districtsRes.map(
            async (district) =>
              await getData("ward", district.code).then((wardsRes) =>
                wardsRes ? { ...district, wards: wardsRes } : { ...district }
              )
          )
        );
        setData({ ...data, districts: mergedRes });
        console.log(diseaseData);
      });
    }
    // eslint-disable-next-line
  }, [diseaseData]);

  const reset = () => {
    setData({ ...data, selectedData: { ...default_data.selectedData } });
  };

  const checkDiseaseInArea = (disease_id_area) =>
    data.selectedData.district.wards?.find(
      (i) => Number.parseInt(i.id) === disease_id_area
    )
      ? true
      : false;

  const filteredDiseases = () =>
    data.selectedData.ward
      ? diseaseData.filter(
          (i) =>
            Number.parseInt(i.id_area) ===
            Number.parseInt(data.selectedData.ward.id)
        )
      : data.selectedData.district
      ? diseaseData.filter(
          (i) =>
            Number.parseInt(i.id_area) ===
              Number.parseInt(data.selectedData.district.id) ||
            checkDiseaseInArea(Number.parseInt(i.id_area))
        )
      : diseaseData || [];

  return (
    <AnimationRevealPage>
      <div className="flex flex-col justify-center items-center">
        <Typography.Title>Bản đồ vùng bệnh</Typography.Title>
      </div>
      <div className="flex justify-center items-center pb-4 space-x-4 w-full">
        <div className="w-1/2 flex justify-center flex-col items-center">
          {/* z-index = 400 */}
          <Row gutter={16} className="pb-8">
            {iconLibs.map((i, index) => (
              <Col span={8} key={index}>
                <div className="p-2 border border-solid w-44 flex items-center">
                  <img
                    src={`assets/icons/${i.icon}`}
                    alt={i.icon}
                    className="h-5 w-5"
                  />{" "}
                  : {i.meaning}
                </div>
              </Col>
            ))}
          </Row>
          <MapContainer
            className="h-[600px] w-[800px]"
            center={[11.375, 106.1313]}
            zoom={10}
            //   scrollWheelZoom={false}
          >
            <TileLayer
              attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
              url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
            />
            {data.districts &&
              data.districts.length > 0 &&
              data.districts.map((i) => (
                <Marker
                  key={i.code}
                  position={[i.lat, i.lon]}
                  icon={CustomIcon()}
                >
                  <Popup>{i.name}</Popup>
                </Marker>
              ))}
            {data.selectedData.district &&
              data.selectedData.district.wards &&
              data.selectedData.district.wards.length > 0 &&
              data.selectedData.district.wards.map((i) => (
                <Marker
                  key={i.code}
                  position={[i.lat, i.lon]}
                  icon={CustomIcon("marker_yellow")}
                >
                  <Popup>{i.name}</Popup>
                </Marker>
              ))}
            {filteredDiseases().map((i) => (
              <Marker
                key={i.name}
                position={[i.lat, i.lon]}
                icon={CustomIcon("marker_red", parseInt(i.degree))}
              >
                <Popup>
                  {i.name}
                  <br />
                  Mức độ: {i.degree}
                </Popup>
              </Marker>
            ))}
          </MapContainer>
        </div>
        <div className="w-1/2 flex justify-center">
          <div>
            <List
              header={
                <div className="space-x-4">
                  {
                    <Select
                      className="w-60"
                      showSearch
                      placeholder="Chọn một thành phố / quận"
                      optionFilterProp="children"
                      value={data.selectedData.district?.code}
                      onChange={(value) => {
                        setData({
                          ...data,
                          selectedData: {
                            district: data.districts.find(
                              (i) => i.code === value
                            ),
                            ward: null,
                          },
                        });
                      }}
                      filterOption={(input, option) =>
                        convertVNtoEN(option?.label ?? "")
                          .toLowerCase()
                          .includes(input.toLowerCase())
                      }
                      options={
                        data.districts && data.districts.length > 0
                          ? data.districts.map((i) => ({
                              value: i.code,
                              label: i.name,
                            }))
                          : []
                      }
                    />
                  }
                  {
                    <Select
                      className="w-60"
                      showSearch
                      placeholder="Chọn một huyện / phường"
                      optionFilterProp="children"
                      value={data.selectedData.ward?.code}
                      onChange={(value) => {
                        setData({
                          ...data,
                          selectedData: {
                            district: { ...data.selectedData.district },
                            ward: data.selectedData.district.wards.find(
                              (i) => i.code === value
                            ),
                          },
                        });
                      }}
                      filterOption={(input, option) =>
                        convertVNtoEN(option?.label ?? "")
                          .toLowerCase()
                          .includes(input.toLowerCase())
                      }
                      options={
                        data.selectedData.district &&
                        data.selectedData.district.wards &&
                        data.selectedData.district.wards.length > 0
                          ? data.selectedData.district.wards.map((i) => ({
                              value: i.code,
                              label: i.name,
                            }))
                          : []
                      }
                    />
                  }
                  <Button icon={<ReloadOutlined />} onClick={reset} />
                </div>
              }
              bordered
              dataSource={filteredDiseases()}
              renderItem={(item) => (
                <List.Item>
                  <div className="flex justify-between items-center w-full">
                    <Link
                      to={"/diseases/" + item.id}
                      className="text-indigo-500 underline hover:text-indigo-700 hover:underline"
                    >
                      [{item.vn_name}]
                    </Link>
                    <Typography.Text>Mức độ: {item.degree}</Typography.Text>
                  </div>
                </List.Item>
              )}
            />
          </div>
        </div>
      </div>
    </AnimationRevealPage>
  );
};
