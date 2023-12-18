import React from "react";
import tw from "twin.macro";
import { css } from "styled-components/macro"; //eslint-disable-line
import AnimationRevealPage from "helpers/AnimationRevealPage.js";
import Hero from "components/hero/TwoColumnWithVideo.js";
import TabGrid from "components/cards/TabCardGrid.js";
import TwoColumnDashedBorderFeatures from "components/features/DashedBorderTwoMap";
import FAQ from "components/faqs/TwoColumnPrimaryBackground.js";
import { HighlightedText } from "components/misc/Headings";

export default () => {
  const imageCss = tw`rounded-4xl`;
  return (
    <AnimationRevealPage>
      <Hero
        heading={<HighlightedText>KOICA</HighlightedText>}
        description="Phần mềm sắn KOICA sẽ mô phỏng một số chức năng cơ bản giống seedtracker nhưng cũng sẽ có một số bổ sung theo đặc thù Việt Nam, dựa trên các thông tin nhóm nghiên cứu đã thu hoạch được trong chuyến công tác Tây Ninh đầu tháng 10/20 và đặc biệt sử dụng AI để cung cấp cho người sử dụng một số tính năng thông minh."
        imageSrc="https://pqm.vn/wp-content/uploads/2021/02/phuong-phap-trong-va-cham-soc-cay-san-cay-san-cay-khoai-mi-neo-nam-viet-1-768x432.jpg"
        imageCss={imageCss}
        imageDecoratorBlob={true}
        primaryButtonText="Bắt đầu"
      />
      <TabGrid
        heading={
          <>
            <HighlightedText>Các tính năng</HighlightedText>
          </>
        }
      />
      <TwoColumnDashedBorderFeatures
        heading={
          <>
            <HighlightedText>Bản đồ theo dõi hạt giống</HighlightedText>
          </>
        }
      />
      <FAQ />
    </AnimationRevealPage>
  );
};
