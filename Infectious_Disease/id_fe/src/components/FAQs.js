import React, { useState } from "react";
import tw from "twin.macro"; //eslint-disable-line
import { css } from "styled-components/macro"; //eslint-disable-line
import "./style.css";
import { ContentWithPaddingXl } from "components/misc/Layouts.js";
import { Collapse, Divider, Form, Input, message, Typography } from "antd";
import { PrimaryButton } from "./misc/Buttons";
import { Link } from "react-router-dom";
import { validateEmail } from "services/helper";
import { postFeedback } from "services/axios/feedback";
import { useTranslation } from "react-i18next";

const FAQS = [
  {
    question: "General information about the software",
    answer: () => (
      <>
        Phần mềm được thiết kế, phát triển, hoạt động và duy trì nhờ VKIST và DataStreams.
      </>
    ),
  },
  {
    question: "General information about the project",
    answer: () => (
      <>
        Tổng hợp các thông tin cần thiết liên quan đến bệnh truyền nhiễm.
      </>
    ),
  },
  {
    question: "What is VKIST?",
    answer: () => (
      <>
        VKIST là
      </>
    ),
  },
  {
    question: "What is DataStreams?",
    answer: () => (
      <>
        DataStreams là
      </>
    ),
  },
  {
    question: "How to login?",
    answer: () => (
      <>
        Để tạo tài khoản, khách truy cập trang{" "}
        <Link
          tw="text-blue-500 underline hocus:text-blue-600 hocus:underline"
          to={"/signin"}
        >
          đăng nhập
        </Link>{" "}
        và chọn "Yêu cầu tạo tài khoản". Tài khoản sau khi được tạo thì cần quản
        trị viên kích hoạt.
      </>
    ),
  },
];

export default () => {
  const [activeQuestion, setActiveQuestion] = useState(null);
  const [form] = Form.useForm();
  const onFinish = (values) => {
    postFeedback(values).then((res) => {
      if (res?.status === 204) {
        message.success("Gửi lời nhắn thành công!");
        form.resetFields();
      } else message.error("Gửi lời nhắn thất bại!");
    });
  };
  const {t} = useTranslation();

  return (
    <div className="relative flex justify-center" id="faqs">
      <ContentWithPaddingXl
        tw="border-y-2 border-solid border-blue-400"
        className="mt-16 flex flex-col md:flex-row rounded-xl w-full md:w-4/5 max-md:space-y-4 md:space-x-8 px-4 md:px-8"
      >
        <div style={{ flex: 1 }}>
          <Typography.Title className="pt-4 ">
            {t('faqs.faq')}
          </Typography.Title>
          <Collapse
            style={{
              width: "100%",
              backgroundColor: "transparent",
            }}
            bordered={false}
            activeKey={activeQuestion}
            onChange={(question) => {
              if (question.length === 1) setActiveQuestion(question[0]);
              else if (question[1] !== activeQuestion)
                setActiveQuestion(question[1]);
              else setActiveQuestion(null);
            }}
          >
            {FAQS.map((faq, index) => {
              return (
                <Collapse.Panel
                  header={
                    <span className="font-semibold text-base">
                      {faq.question}
                    </span>
                  }
                  key={index}
                >
                  <span>{faq.answer()}</span>
                </Collapse.Panel>
              );
            })}
          </Collapse>
        </div>
        <Divider
          type="vertical"
          tw="bg-blue-400"
          className="!h-full w-0.5"
        />
        <div style={{ flex: 1 }}>
          <Typography.Title className="md:pt-4">
            {t('faqs.message')}
          </Typography.Title>
          <Form onFinish={onFinish} form={form} layout="vertical">
            <Form.Item
              name="name"
              label={<span className="font-semibold text-base">{t('faqs.name')}</span>}
              rules={[{ required: true, message: "Please insert your full name!" }]}
            >
              <Input placeholder="Ha Nguyen" />
            </Form.Item>
            <Form.Item
              name="email"
              label={<span className="font-semibold text-base">Email</span>}
              rules={[
                { required: true, message: "Please insert your email!" },
                {
                  validator: () => {
                    return !form.getFieldValue("email") ||
                      validateEmail(form.getFieldValue("email"))
                      ? Promise.resolve()
                      : Promise.reject("Your email is incorrect!");
                  },
                },
              ]}
            >
              <Input placeholder="ndha.uet.vnu@gmail.com" />
            </Form.Item>
            <Form.Item
              name="content"
              label={<span className="font-semibold text-base">{t('faqs.message')}</span>}
              rules={[{ required: true, message: "Please insert your message" }]}
            >
              <Input.TextArea placeholder="Some comments or messages" />
            </Form.Item>
            <Form.Item>
              <PrimaryButton htmlType="submit">{t('faqs.send')}</PrimaryButton>
            </Form.Item>
          </Form>
        </div>
      </ContentWithPaddingXl>
    </div>
  );
};
