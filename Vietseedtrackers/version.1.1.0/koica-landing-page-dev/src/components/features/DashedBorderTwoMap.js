import React from "react";
import styled from "styled-components";
import tw from "twin.macro";
//eslint-disable-next-line
import { css } from "styled-components/macro";
import { SectionHeading } from "components/misc/Headings.js";

import defaultCardImage from "images/shield-icon.svg";

import { ReactComponent as SvgDecoratorBlob3 } from "images/svg-decorator-blob-3.svg";

const Container = tw.div`relative`;

const TwoColumnContainer = styled.div`
  ${tw`flex flex-col items-center md:items-stretch md:flex-row flex-wrap md:justify-center`}
`;
const HeaderRow = tw.div`flex justify-center items-center flex-col xl:flex-row w-full`;
const Header = tw(SectionHeading)`flex`;

const Column = styled.div`
  ${tw`md:w-1/2 px-6 flex`}
`;

const Card = styled.div`
  ${tw`flex flex-col mx-auto items-center py-4 border-2 border-dashed border-primary-500 rounded-lg mt-12`}
  .title {
    ${tw`mt-2 font-bold text-xl leading-none text-primary-500`}
  }

  .imageContainer {
    ${tw`text-center p-6 flex-shrink-0 relative`}
    img {
      ${tw`w-full h-full`}
    }
  }
`;

const DecoratorBlob = styled(SvgDecoratorBlob3)`
  ${tw`pointer-events-none absolute right-0 bottom-0 w-64 opacity-25 transform translate-x-32 translate-y-48 `}
`;

export default ({ heading = "Bản đồ theo dõi hạt giống" }) => {
  const cards = [
    {
      title: "Các lĩnh vực sản xuất",
      imageSrc: "https://www.c2dh.uni.lu/sites/default/files/styles/full_width/public/field/image/capture.png?itok=REb8jh_H",
    },
    {
      title: "Người dùng CST",
      imageSrc: "https://www.c2dh.uni.lu/sites/default/files/styles/full_width/public/field/image/capture.png?itok=REb8jh_H",
    },
  ];

  return (
    <Container>
      <TwoColumnContainer>
        <HeaderRow>
          <Header>{heading}</Header>
        </HeaderRow>
        {cards.map((card, i) => (
          <Column key={i}>
            <Card>
              <span className="title">{card.title || "Fully Secure"}</span>
              <span className="imageContainer">
                <img src={card.imageSrc || defaultCardImage} alt="map" />
              </span>
            </Card>
          </Column>
        ))}
      </TwoColumnContainer>
      <DecoratorBlob />
    </Container>
  );
};
