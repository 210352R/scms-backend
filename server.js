import express from "express";
import bodyParser from "body-parser";
import cors from "cors";
import cookieParser from "cookie-parser";

import customerRoutes from "./Routes/customer.js";
import adminRoutes from "./Routes/admin.js";

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
  addOrder,
  addOrderProductsByArray,
} from "./database/orderData.js";
import { getAllTrainDetails } from "./database/trainData.js";

// create express app ---
const app = express();

// add in-built middlewears ----
app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(cookieParser());

// for creaate file for upload images --
app.use(express.static("public"));

app.use("/login", loginRoutes);

app.use("/customer", customerRoutes);

app.use("/admin", adminRoutes);

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

// const productList = [
//   {
//     product_id: "P006",
//     quantity: 5,
//   },
//   {
//     product_id: "P004",
//     quantity: 10,
//   },
//   {
//     product_id: "P007",
//     quantity: 8,
//   },
// ];
// const order = {
//   customer_id: "Cust036",
//   delivery_address: "Horana",
//   route_id: "R006",
//   state: "new",
//   products: productList,
// };
// getAllTrainDetails()
//   .then((res) => {
//     console.log(res);
//   })
//   .catch((err) => {
//     console.log(err);
//   });

const port = process.env.PORT || 8000;
// Set Port to work as server ---
app.listen(port, () => {
  console.log("server is running on port " + port);
});
