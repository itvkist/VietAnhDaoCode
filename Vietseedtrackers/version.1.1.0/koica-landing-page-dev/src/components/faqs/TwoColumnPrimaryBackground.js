import React, { useState } from "react";
import { motion } from "framer-motion";
import tw from "twin.macro";
import styled, { css } from "styled-components/macro"; //eslint-disable-line
import { Container, ContentWithPaddingXl } from "components/misc/Layouts.js";
import { ReactComponent as ChevronDownIcon } from "feather-icons/dist/icons/chevron-down.svg";

const PrimaryBackgroundContainer = tw(
  Container
)`mx-64 m-20 px-8 bg-primary-500 text-gray-100 rounded-xl`;
const Heading = tw.h2`text-3xl sm:text-4xl font-bold`;
const FaqsContainer = tw.div`mt-10 sm:mt-16 w-full flex-1 lg:flex justify-between items-start max-w-screen-lg mx-auto`;
const FaqsColumn = tw.div`w-full lg:max-w-lg lg:mr-12 last:mr-0`;
const Faq = tw.div`select-none cursor-pointer border-b-2 border-primary-300 hover:border-pink-400 transition-colors duration-300 py-6`;
const Question = tw.div`flex justify-between items-center`;
const QuestionText = tw.div`text-sm sm:text-lg font-semibold tracking-wide`;
const QuestionToggleIcon = styled(motion.span)`
  ${tw`ml-2 transition duration-300`}
  svg {
    ${tw`w-6 h-6`}
  }
`;
const Answer = tw(motion.div)`hidden text-sm font-normal mt-4 text-gray-300`;

const FormContainer = styled.div`
  ${tw`text-gray-100 rounded-lg relative`}
  form {
    ${tw`mt-1`}
  }
  h2 {
    ${tw`text-3xl sm:text-4xl font-bold`}
  }
  input,
  textarea {
    ${tw`w-full bg-transparent text-gray-100 text-base font-medium tracking-wide border-b-2 py-2 text-gray-100 hocus:border-pink-400 focus:outline-none transition duration-200`};

    ::placeholder {
      ${tw`text-gray-500`}
    }
  }
`;
const TwoColumn = tw.div`flex flex-col md:flex-row justify-between`;
const Column = tw.div`md:w-5/12 flex flex-col`;
const InputContainer = tw.div`relative py-8 mt-2`;
const Label = tw.label`absolute top-0 left-0 tracking-wide text-sm sm:text-lg font-semibold`;
const Input = tw.input``;
const TextArea = tw.textarea`h-24 md:h-full resize-none`;
const SubmitButton = tw.button`w-full md:w-32 mt-6 py-3 bg-gray-100 text-primary-500 rounded-full font-bold tracking-wide shadow-lg uppercase text-sm transition duration-300 transform focus:outline-none focus:shadow-outline hover:bg-pink-400 hover:text-white hocus:-translate-y-px hocus:shadow-xl`;

export default ({
  faqs = [
    {
      question: "Cách phần mềm hoạt động ?",
      answer:
        "Yes, it is, if you have a membership with us. Otherwise it is charged as per the menu. Some limits do apply as to how much items can be included in your lunch. This limit is enough for any one person and merely exists to discourage abusal of the system.",
    },
    {
      question: "Cài đặt phần mềm ?",
      answer:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      question: "Đăng ký ở đâu ?",
      answer:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
  ],
}) => {
  const faqCol = [];
  const [activeQuestionIndex, setActiveQuestionIndex] = useState(null);

  const toggleQuestion = (questionIndex) => {
    if (activeQuestionIndex === questionIndex) setActiveQuestionIndex(null);
    else setActiveQuestionIndex(questionIndex);
  };

  faqs.map((faq, index) => {
    const renderedFaq = (
      <Faq key={index} onClick={() => toggleQuestion(index)}>
        <Question>
          <QuestionText>{faq.question}</QuestionText>
          <QuestionToggleIcon
            variants={{
              collapsed: { rotate: 0 },
              open: { rotate: -180 },
            }}
            initial="collapsed"
            animate={activeQuestionIndex === index ? "open" : "collapsed"}
            transition={{ duration: 0.02, ease: [0.04, 0.62, 0.23, 0.98] }}
          >
            <ChevronDownIcon />
          </QuestionToggleIcon>
        </Question>
        <Answer
          variants={{
            open: {
              opacity: 1,
              height: "auto",
              marginTop: "16px",
              display: "block",
            },
            collapsed: {
              opacity: 0,
              height: 0,
              marginTop: "0px",
              display: "none",
            },
          }}
          initial="collapsed"
          animate={activeQuestionIndex === index ? "open" : "collapsed"}
          transition={{ duration: 0.3, ease: [0.04, 0.62, 0.23, 0.98] }}
        >
          {faq.answer}
        </Answer>
      </Faq>
    );
    faqCol.push(renderedFaq);
    return null;
  });

  return (
    <PrimaryBackgroundContainer>
      <ContentWithPaddingXl>
        <FaqsContainer>
          <FaqsColumn>
            <Heading className="text-white">Các câu hỏi thường gặp</Heading>
            {faqCol}
          </FaqsColumn>
          <FaqsColumn>
            <Heading className="text-white">Liên lạc</Heading>
            <FormContainer>
              <form action="#">
                <TwoColumn>
                  <Column>
                    <InputContainer>
                      <Label htmlFor="name-input">Tên</Label>
                      <Input
                        id="name-input"
                        type="text"
                        name="name"
                        placeholder="Minh Huong"
                      />
                    </InputContainer>
                  </Column>
                  <Column>
                    <InputContainer>
                      <Label htmlFor="email-input">Email</Label>
                      <Input
                        id="email-input"
                        type="email"
                        name="email"
                        placeholder="minhhuong@mail.com"
                      />
                    </InputContainer>
                  </Column>
                </TwoColumn>
                <InputContainer tw="flex-1">
                  <Label htmlFor="name-input">Lời nhắn</Label>
                  <TextArea
                    id="message-input"
                    name="message"
                    placeholder="Tôi có thắc mắc..."
                  />
                </InputContainer>
                <SubmitButton type="submit" value="Submit">
                  Gửi
                </SubmitButton>
              </form>
            </FormContainer>
          </FaqsColumn>
        </FaqsContainer>
      </ContentWithPaddingXl>
    </PrimaryBackgroundContainer>
  );
};
