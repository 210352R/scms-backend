import express from "express";

import auth from "../middleware/auth.js";

import multer from "multer";
import path from "path";
import { pool } from "../database/database.js";

import {
  getAllCustomers,
  getCustomerById,
  addCustomer,
  loginCustomer,
} from "../database/customerData.js";
import { addOrder } from "../database/orderData.js";

const router = express.Router();

router.get("/getAll", async (req, res) => {
  const result = await getAllCustomers();
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    res.status(200).json({ sucess: true, customers: result.customers });
  } else {
    res.status(404).json({ sucess: false, message: "No customers found" });
  }
});

router.get("/get/:id", auth, async (req, res) => {
  const result = await getCustomerById(req.params.id);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.customer.length > 0) {
      res.status(200).json({ sucess: true, customer: result.customer });
    } else {
      res.status(200).json({ sucess: false, message: "No Such Customer" });
    }
  } else {
    res.status(404).json({ message: "No customers found" });
  }
});

router.get("/getA/:id", async (req, res) => {
  const result = await getCustomerById(req.params.id);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.customer.length > 0) {
      res.status(200).json({ sucess: true, customer: result.customer });
    } else {
      res.status(200).json({ sucess: false, message: "No Such Customer" });
    }
  } else {
    res.status(404).json({ message: "No customers found" });
  }
});

router.post("/save", async (req, res) => {
  console.log("Body : ", req.body);
  try {
    const result = await addCustomer(req.body);
    console.log("Result : ", result);
    if (result.sucess) {
      res.status(200).json({ sucess: true, message: "Customer Added" });
    } else {
      res.status(404).json({ sucess: false, message: "Customer Not Added" });
    }
  } catch (err) {
    console.log("Error : ", err);
    res.status(404).json({ sucess: false, message: "Customer Not Added" });
  }
});

// Add customer order -----------------

router.post("/addOrder", auth, async (req, res) => {
  try {
    const result = await addOrder(req.body);
    console.log("Result : ", result);
    if (result.sucess) {
      res.status(200).json({ sucess: true, message: "Customer Order Added" });
    } else {
      res.status(500).json({
        sucess: false,
        message: "Customer Order Not Added - Internal sever Error -- ",
      });
    }
  } catch (err) {
    console.log(err);
    console.log({ sucess: false, message: "Adding order Unsuccessfull" });
    res
      .status(404)
      .json({ sucess: false, message: "Adding order Unsuccessfull" });
  }
});

/// Add customer Image --------

// Multer configuration -------
const storage = multer.diskStorage({
  destination: (req, file, callBack) => {
    callBack(null, "../backend/public/images"); // Use an absolute path
  },
  filename: (req, file, callBack) => {
    callBack(
      null,
      file.fieldname + "_" + Date.now() + path.extname(file.originalname)
    );
  },
});
//D:\DBMS PROJECT\backend
const upload = multer({
  storage: storage,
});

router.put("/upload/:id", upload.single("image"), (req, res) => {
  console.log(req.file);
  try {
    const image = req.file.filename;

    console.log("File Name  : ", image);
    var insertData = "UPDATE customer SET image = ? WHERE  customer_id = ?";
    pool.query(insertData, [image, req.params.id]);
    console.log("Image Added Successfully");
    res.status(200).json({ sucess: true, message: "Image Added Successfully" });
  } catch (err) {
    console.log(err);
    console.log({
      sucess: false,
      message: "Adding image Unsuccessfull",
      err: err,
    });
    res
      .status(404)
      .json({ sucess: false, message: "Adding image Unsuccessfull", err: err });
  }
});

export default router;
