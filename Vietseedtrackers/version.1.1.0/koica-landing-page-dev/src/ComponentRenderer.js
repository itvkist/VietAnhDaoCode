import {
  CassavaDetail,
  Cassavas,
  Diagnostics,
  DiseaseDetail,
  Diseases,
  Hompage,
  Maps,
  Signin,
} from "pages";
import React from "react";
import { useParams } from "react-router-dom";

export default () => {
  const { id, page } = useParams();
  const components = {
    pages: {
      homepage: {
        component: <Hompage />,
        url: "/",
      },
      signin: {
        component: <Signin />,
        url: "/signin",
      },
      cassavas: {
        component: <Cassavas />,
        url: "/cassavas",
      },
      diseases: {
        component: <Diseases />,
        url: "/diseases",
      },
      cassavas_detail: {
        component: <CassavaDetail id={id} />,
        url: `/cassavas/${id}`,
      },
      diseases_detail: {
        component: <DiseaseDetail id={id} />,
        url: `/diseases/${id}`,
      },
      maps: {
        component: <Maps />,
        url: `/diseases`,
      },
      diagnostics: {
        component: <Diagnostics />,
        url: `/diagnostics`,
      },
    },
  };

  try {
    return id
      ? components.pages[page + "_detail"].component
      : page
      ? components.pages[page].component
      : components.pages.homepage.component;
  } catch (e) {
    console.log(e);
    return <div>Error: Component Not Found</div>;
  }
};
