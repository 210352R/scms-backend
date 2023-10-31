import express from "express";
import bodyParser from "body-parser";
import cors from "cors";
import cookieParser from "cookie-parser";

import customerRoutes from "./Routes/customer.js";
import adminRoutes from "./Routes/admin.js";

import coordinaterRoutes from "./Routes/coordinater.js";

import truckCoordinaterRoutes from "./Routes/TruckCoordinater.js";

import loginRoutes from "./Routes/login.js";
import orderRoutes from "./Routes/order.js";

import storeRoutes from "./Routes/store.js";

import trainRoutes from "./Routes/train.js";

import trainTripRoutes from "./Routes/trainTrip.js";

import trainTokenRoutes from "./Routes/trainToken.js";

import reportRoutes from "./Routes/report.js";

import { auth } from "./middleware/auth.js";

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
  getOrdersWithNetCapacity,
  getAllNewOrdersWithProdutsAndNetCapacity,
  getAllNewOrdersWithProdutsAndCapacityAndNetCapacity,
  getAllOrdersWithProdutsByID,
  getAllStoredOrdersWithProdutsByStoreId,
} from "./database/orderData.js";
import {
  getAllTrainDetails,
  getTrainDetailsById,
  getTrainDetailsByStoreId,
} from "./database/trainData.js";
import {
  assignTrainTrip,
  getAllTrainTripDetails,
  getAvilableTrainsByDate,
  getTrainTripDetailsByDateTime,
  getTrainTripDetailsById,
  getTrainTripDetailsByTrainId,
} from "./database/traintripData.js";
import {
  addTrainTokenItems,
  getAllTrainTokenDetails,
  getAllTrainTokenDetailsAccCapacity,
  getAllTrainTokenDetailsAccCapacityByStoreId,
  getTokenDetailsbyTripId,
  updateTokenCapacity,
} from "./database/TrainTokenData.js";
import { getDriverIdsForSuitable } from "./database/driverData.js";
import { getValidTruckForGivenDateTime } from "./database/truckData.js";
import { getADriverIdsForSuitable } from "./database/a_driver_data.js";
import {
  addTruckSchedule,
  getAllTruckSchedules,
  getAllTruckSchedulesByDate,
} from "./database/truckScheduleData.js";
import { getCooByUserName } from "./database/CoordinaterData.js";
import {
  getItemsWithMostSales,
  getQuartlaryReport,
  getSalesBasedId,
  getSalesByCustomer,
  getWorkHoursOfEmployees,
  getWorkHoursOfTrucks,
} from "./database/reportData.js";

// create express app ---
const app = express();

// add in-built middlewears ----
app.use(cors({ credentials: true }));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(cookieParser());

// for creaate file for upload images --
app.use(express.static("public"));
app.use(cookieParser());
app.use("/login", loginRoutes);

app.use("/customer", customerRoutes);

app.use("/admin", adminRoutes);

app.use("/coordinater", coordinaterRoutes);

app.use("/truckcoordinater", truckCoordinaterRoutes);

app.use("/order", orderRoutes);

app.use("/store", storeRoutes);

app.use("/train", trainRoutes);

app.use("/traintrip", trainTripRoutes);

app.use("/traintoken", trainTokenRoutes);

app.use("/report", reportRoutes);

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

// getTrainTripDetailsByDateTime("TR001", "2023-10-26", "08:00:00")
//   .then((res) => {
//     console.log(res);
//   })
//   .catch((err) => {
//     console.log(err);
//   });

// getAllOrdersWithProduts()
//   .then((res) => {
//     // console.log("Products Array : ", res.orders[0].products);
//     const productArray = res.orders[0].products;
// console.log("Products Array : ", productArray);
// let netCapacity = 0;
// productArray.map(async (item) => {
//   const capacity = (await getProductCapacityById(item.product_id))
//     .productCapacity.capacity;
//   console.log("Capacity : ", capacity);
//   netCapacity = netCapacity + capacity;
// });
//     return netCapacity;
//   })
//   .catch((err) => {
//     console.log(err);
//   });

// const updatedOrders = await Promise.all(
//   orders[0].map(async (item) => {
//     let products = await getAllOrdersWithProdutsByID(item.order_id);
//     //console.log(products);
//     return { ...item, products: products.products };
//   })
// );

// const func1 = async () => {
//   console.log(
//     "----------------------------------------------------------------------"
//   );
//   let netCapacity = 0;
//   const res = await getAllOrdersWithProduts();
//   const productArray = res.orders[0].products;
//   console.log("Products Array ---------------: ", productArray);
//   for (let i = 0; i < productArray.length; i++) {
//     console.log(`Element at index ${i}: ${productArray[i].product_id}`);
//     const capacity = (await getProductCapacityById(productArray[i].product_id))
//       .productCapacity.capacity;
//     console.log("Capacity : ", capacity);
//     netCapacity = netCapacity + capacity;
//   }
//   return netCapacity;
// };

// const jsonArray = [
//   {
//     token_Id: 1,
//     add_quantity: 2,
//     order_Id: 8,
//     product_id: "P006",
//   },
//   {
//     token_Id: 1,
//     add_quantity: 2,
//     order_Id: 17,
//     product_id: "P002",
//   },
// ];

// const res = await getValidTruckForGivenDateTime(
//   "2023-10-26",
//   "10:00:00",
//   "R002"
// );
// console.log("Net ", res);

// const res = await addTruckSchedule({
//   truck_id: "2",
//   driver_id: "john_doe",
//   a_driver_id: "jane",
//   time: "08:00:00",
//   Date: "2023-10-25",
//   route_id: "R002",
//   order_id: "17",
// });
// console.log("Net ", res);

// const res = await getItemsWithMostSales(2023);
// console.log("Newhguioa : ", res);

const res = await getDriverIdsForSuitable("2023-11-03", "10:00:00", 2, "S001");

console.log("Net ", res);

// console.log("Prod ---- ", res.orders[17].order_id, res.orders[17].products);

const port = process.env.PORT || 8000;
// Set Port to work as server ---
app.listen(port, () => {
  console.log("server is running on port " + port);
});
