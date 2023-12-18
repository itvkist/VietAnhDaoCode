import React from "react";
import { motion } from "framer-motion";
import tw from "twin.macro";
import styled from "styled-components";
import { css } from "styled-components/macro"; //eslint-disable-line
import { Container, ContentWithPaddingXl } from "components/misc/Layouts.js";
import { SectionHeading } from "components/misc/Headings.js";
import { ReactComponent as SvgDecoratorBlob1 } from "images/svg-decorator-blob-5.svg";
import { ReactComponent as SvgDecoratorBlob2 } from "images/svg-decorator-blob-7.svg";
import { ReactComponent as Settings } from "feather-icons/dist/icons/settings.svg";
import { ReactComponent as Users } from "feather-icons/dist/icons/users.svg";
import { ReactComponent as Rss } from "feather-icons/dist/icons/rss.svg";
import { ReactComponent as Sliders } from "feather-icons/dist/icons/sliders.svg";
import { ReactComponent as BarChart2 } from "feather-icons/dist/icons/bar-chart-2.svg";
import { ReactComponent as GitBranch } from "feather-icons/dist/icons/git-branch.svg";
import { Link } from "react-router-dom";

const HeaderRow = tw.div`flex justify-between items-center flex-col xl:flex-row`;
const Header = tw(SectionHeading)``;

const TabContent = tw(
  motion.div
)`mt-6 flex flex-wrap sm:-mr-10 md:-mr-6 lg:-mr-12`;
const CardContainer = tw.div`mt-10 w-full sm:w-1/2 md:w-1/3 sm:pr-10 md:pr-6 lg:pr-12`;
const Card = motion(
  tw(Link)`bg-gray-200 rounded-b block max-w-xs mx-auto sm:max-w-none sm:mx-0`
);
const CardImageContainer = styled.div`
  ${(props) =>
    css`
      background-image: url("${props.imageSrc}");
    `}
  ${tw`h-56 xl:h-64 bg-center bg-cover relative rounded-t`}
`;

const CardHoverOverlay = styled(motion.div)`
  ${tw`absolute inset-0 flex justify-center items-center bg-primary-500 rounded-t`}
`;
const CardText = tw.div`p-4 text-gray-900`;
const CardTitle = tw.h5`text-lg font-semibold group-hover:text-primary-500 flex justify-between items-center`;
const CardContentOverlay = tw.p`mt-1 mx-16 text-sm font-medium text-white`;

const DecoratorBlob1 = styled(SvgDecoratorBlob1)`
  ${tw`pointer-events-none -z-20 absolute right-0 top-0 h-64 w-64 opacity-15 transform translate-x-2/3 -translate-y-12 text-pink-400`}
`;
const DecoratorBlob2 = styled(SvgDecoratorBlob2)`
  ${tw`pointer-events-none -z-20 absolute left-0 bottom-0 h-80 w-80 opacity-15 transform -translate-x-2/3 text-primary-500`}
`;

const SettingIcon = tw(Settings)`w-5 h-5`;
const UsersIcon = tw(Users)`w-5 h-5`;
const RssIcon = tw(Rss)`w-5 h-5`;
const SlidersIcon = tw(Sliders)`w-5 h-5`;
const BarChart2Icon = tw(BarChart2)`w-5 h-5`;
const GitBranchIcon = tw(GitBranch)`w-5 h-5`;

export default ({
  heading = "Các tính năng",
  tabs = {
    Starters: [
      {
        imageSrc:
          "https://seedtracker.org/cassava/wp-content/uploads/2016/11/CA_011.jpg",
        title: "Các giống sắn",
        content:
          "Thông tin về nhiều giống sắn có sẵn để trồng được cập nhật liên tục trên Cassava Seed Tracker ™.",
        url: "/cassavas",
        icon: <SlidersIcon />,
      },
      {
        imageSrc:
          "https://seedtracker.org/cassava/wp-content/uploads/2016/11/Cassava-17.jpg",
        title: "Các bệnh về sắn",
        content:
          "KOICA cung cấp cơ sở dữ liệu trung tâm với nhiều dạng và công cụ kỹ thuật số cho người dùng đã đăng ký để hỗ trợ hoạt động của họ. Nó cung cấp truy cập dữ liệu thời gian thực và phân tích tất cả người dùng đã đăng ký miễn phí.",
        url: "/diseases",
        icon: <SettingIcon />,
      },
      {
        imageSrc:
          "https://seedtracker.org/cassava/wp-content/uploads/2016/11/DSC0283-1.jpg",
        title: "Bản đồ sắn",
        content:
          "Cassava Seed Tracker ™ cung cấp nền tảng kết nối giữa tất cả các bên liên quan đến sắn để trao đổi thông tin, chia sẻ kinh nghiệm, kiến thức, liên hệ vì lợi ích chung.",
        url: "/maps",
        icon: <UsersIcon />,
      },
      {
        imageSrc:
          "https://seedtracker.org/cassava/wp-content/uploads/2016/11/DSC0474.jpg",
        title: "Chuẩn đoán bệnh",
        content:
          "Các công cụ hỗ trợ quyết định có sẵn trên Cassava Seed Tracker ™ để hỗ trợ các nhà sản xuất hạt giống về các chỉ số trồng hạt giống tối ưu.",
        url: "/diagnostics",
        icon: <GitBranchIcon />,
      },
      {
        imageSrc:
          "https://seedtracker.org/cassava/wp-content/uploads/2016/11/Cassava-8.jpg",
        title: "Theo dõi hạt giống",
        content:
          "Hạt giống có thể được theo dõi trong suốt quá trình gieo trồng, quản lý cây trồng, dữ liệu thu hoạch, phân phối, quản lý hàng tồn kho và hơn thế nữa với Cassava SeedTracker ™",
        url: "#",
        icon: <RssIcon />,
        disabled: true,
      },
      {
        imageSrc:
          "https://seedtracker.org/cassava/wp-content/uploads/2016/11/DSC_9116.jpg",
        title: "Thông tin thương mại sắn",
        content:
          "Thông tin thị trường, sự sẵn có của hạt giống, trữ lượng hạt giống, biến động giá cả và các thông tin liên quan đến giao dịch hạt giống sắn khác được tổng hợp.",
        url: "#",
        icon: <BarChart2Icon />,
        disabled: true,
      },
    ],
  },
}) => {
  const tabsKeys = Object.keys(tabs);

  return (
    <Container>
      <ContentWithPaddingXl>
        <HeaderRow>
          <Header>{heading}</Header>
        </HeaderRow>

        {tabsKeys.map((tabKey, index) => (
          <TabContent
            key={index}
            variants={{
              current: {
                opacity: 1,
                scale: 1,
                display: "flex",
              },
              hidden: {
                opacity: 0,
                scale: 0.8,
                display: "none",
              },
            }}
            transition={{ duration: 0.4 }}
            initial={"current"}
            animate={"current"}
          >
            {tabs[tabKey].map((card, index) => (
              <CardContainer key={index}>
                <Card
                  className={
                    "group" + (card.disabled ? " cursor-not-allowed" : "")
                  }
                  to={card.disabled ? null : card.url}
                  initial="rest"
                  whileHover="hover"
                  animate="rest"
                >
                  <CardImageContainer imageSrc={card.imageSrc}>
                    <CardHoverOverlay
                      variants={{
                        hover: {
                          opacity: card.disabled ? 0.75 : 1,
                          height: "auto",
                        },
                        rest: {
                          opacity: card.disabled ? 0.75 : 0,
                          height: card.disabled ? "auto" : 0,
                        },
                      }}
                      transition={{ duration: 0.3 }}
                    >
                      <CardContentOverlay>
                        {!card.disabled && card.content}
                      </CardContentOverlay>
                    </CardHoverOverlay>
                  </CardImageContainer>
                  <CardText>
                    <CardTitle>
                      {card.title}
                      {card.icon}
                    </CardTitle>
                  </CardText>
                </Card>
              </CardContainer>
            ))}
          </TabContent>
        ))}
      </ContentWithPaddingXl>
      <DecoratorBlob1 />
      <DecoratorBlob2 />
    </Container>
  );
};
