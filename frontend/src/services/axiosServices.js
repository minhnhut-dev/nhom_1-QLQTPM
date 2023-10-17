// axiosService.js

import axios from 'axios';

// Create an instance of Axios with custom configuration
const axiosInstance = axios.create({
  baseURL: 'http://103.75.186.153:5002', // Replace with your API base URL
  timeout: 10000, // Set a timeout in milliseconds
});

// Function to set the authorization token
const setAuthToken = (token) => {
  if (token) {
    axiosInstance.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  } else {
    delete axiosInstance.defaults.headers.common['Authorization'];
  }
};

// Define your service functions
const axiosService = {
  get: (url) => axiosInstance.get(url),
  post: (url, data) => axiosInstance.post(url, data),
  put: (url, data) => axiosInstance.put(url, data),
  delete: (url) => axiosInstance.delete(url),
};

export { axiosService, setAuthToken };
