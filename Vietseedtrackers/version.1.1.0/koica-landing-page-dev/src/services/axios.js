import axios from "axios";
const { BASE_URL } = require("./url");

const CancelToken = axios.CancelToken;
const source = CancelToken.source();
const axiosInstance = axios.create({
  baseURL: BASE_URL,
});

axiosInstance.interceptors.response.use(
  (response) => {
    const { code } = response.data;
    if (code === 401) {
      const { config } = response;
      return axiosInstance
        .post("/auth/refresh")
        .then((res) => {
          if (res.data.httpStatus === 401) {
            config.headers["Authorization"] = null;
            localStorage.removeItem("refresh_token");
            alert("Phiên đăng nhập đã hết hạn, vui lòng đăng nhập lại");
            window.location.href = "/";
            source.cancel();
          } else {
            const { access_token } = res.data.data;
            config.headers["Authorization"] = access_token;
            return axiosInstance(config);
          }
        })
        .catch((e) => e);
    }
    return response;
  },
  (error) => {
    console.warn("Error status", error.response.status);
    return Promise.reject(error);
  }
);

export const login = async ({ email, password }) => {
  const res = await axiosInstance.post("/auth/login", {
    email: email,
    password: password,
  });
  if (res.status === 200) {
    const resData = res.data.data;
    axiosInstance.defaults.headers.common["Authorization"] =
      "Bearer " + resData.access_token;
    localStorage.setItem("refresh_token", resData.refresh_token);
    localStorage.setItem("access_token", resData.access_token);
    return { ...resData, status: true };
  }
  return { status: false };
};

export const logout = async () => {
  const res = await axiosInstance.post("/auth/logout", {
    refresh_token: localStorage.getItem("refresh_token"),
  });
  console.log(res.status);
  if (res.status === 204) {
    localStorage.removeItem("refresh_token");
    localStorage.removeItem("access_token");
    delete axiosInstance.defaults.headers.common["Authorization"];
    return { status: true };
  }
  return { status: false };
};

export default axiosInstance;
