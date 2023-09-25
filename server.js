import express from "express";
import bodyParser from "body-parser";
import cors from "cors";
import cookieParser from "cookie-parser";

import customerRoutes from "./Routes/customer.js";
import loginRoutes from "./Routes/login.js";
import orderRoutes from "./Routes/order.js";

import auth from "./middleware/auth.js";

import { pool } from "./database/database.js";
import {
  getAllCustomers,
  getCustomerById,
  addCustomer,
  loginCustomer,
} from "./database/customerData.js";

import {
  getAllProducts,
  getProductById,
  getProductCapacityById,
} from "./database/productData.js";
import {
  getAllOrders,
  getAllOrdersWithProduts,
  getAllOrdersWithProdutsByID as getOrdersWithProdutsByID,
  getOrderById,
} from "./database/orderData.js";

// create express app ---
const app = express();

// add in-built middlewears ----
app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(cookieParser());

app.use("/login", loginRoutes);

app.use("/customer", customerRoutes);

app.use("/order", orderRoutes);

// connfirm database connection---
pool
  .getConnection()
  .then((connection) => {
    console.log("Connected to the MYSQL database");
    connection.release(); // Release the connection back to the pool
  })
  .catch((err) => {
    console.error("Error connecting to the mysql database:", err.message);
  });

// methods ---

// loginCoordinater("user1", "password1")
//   .then((res) => {
//     console.log(res);
//   })
//   .catch((err) => {
//     console.log(err);
//   });

// getAllOrdersWithProduts()
//   .then((result) => {
//     console.log("Orders with Products:", result);
//   })
//   .catch((error) => {
//     console.error("Error:", error);
//   });

const port = process.env.PORT || 8000;
// Set Port to work as server ---
app.listen(port, () => {
  console.log("server is running on port " + port);
});
