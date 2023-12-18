import React, { useState } from "react";
import GlobalStyles from "styles/GlobalStyles";
import "./style.css";
import { css } from "styled-components/macro"; //eslint-disable-line
import ComponentRenderer from "ComponentRenderer.js";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { Outlet } from "react-router-dom";
import Header from "components/headers/light.js";
import Footer from "components/footers/SimpleFooter.js";
import Context from "services/context";

export default function App() {
  const [user, setUser] = useState(null);
  const [disease, setDisease] = useState(null);

  return (
    <>
      <Context.Provider
        value={{
          user: user,
          setUser: setUser,
          disease: disease,
          setDisease: setDisease,
        }}
      >
        <GlobalStyles />
        <Router>
          <Header />
          <Routes>
            <Route
              path="/"
              element={
                <div className="content-full">
                  <Outlet />
                </div>
              }
            >
              <Route path=":page" element={<ComponentRenderer />} />
              <Route path=":page/:id" element={<ComponentRenderer />} />
              <Route path="/" element={<ComponentRenderer />} />
            </Route>
          </Routes>
          <Footer />
        </Router>
      </Context.Provider>
    </>
  );
}
