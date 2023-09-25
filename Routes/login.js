import express from "express";
import jwt from "jsonwebtoken";
import dotenv from "dotenv"; // aluth version nisa ---

import {
  getAllCustomers,
  getCustomerById,
  addCustomer,
  loginCustomer,
} from "../database/customerData.js";
import { loginAdmin } from "../database/adminData.js";
import { loginCoordinater } from "../database/CoordinaterData.js";

const router = express.Router();
dotenv.config();

router.post("/customer", async (req, res) => {
  const { username, password } = req.body;
  try {
    const result = await loginCustomer(username, password);
    if (result.sucess) {
      //create jwt token
      const token = jwt.sign({ user: username }, "123456");
      //save token in cookie
      res.json({ ...result, token: token });
      // .cookie("authcookie", token, { maxAge: 900000, httpOnly: true })
    } else {
      res.json(result);
    }
  } catch (err) {
    console.log(err);
    console.log({ sucess: false, message: "Login Unsuccessfull" });
    res.status(404).json({ sucess: false, message: "Login Unsuccessfull" });
  }
});

router.post("/admin", async (req, res) => {
  const { username, password } = req.body;
  try {
    const result = await loginAdmin(username, password);
    if (result.sucess) {
      //create jwt token
      const token = jwt.sign({ user: username }, "123456");
      //save token in cookie
      res.json({ ...result, token: token });
      // .cookie("authcookie", token, { maxAge: 900000, httpOnly: true })
    } else {
      res.json(result);
    }
  } catch (err) {
    console.log(err);
    console.log({ sucess: false, message: "Login Unsuccessfull" });
    res.status(404).json({ sucess: false, message: "Login Unsuccessfull" });
  }
});

router.post("/coordinater", async (req, res) => {
  const { username, password } = req.body;
  try {
    const result = await loginCoordinater(username, password);
    if (result.sucess) {
      //create jwt token
      const token = jwt.sign({ user: username }, "123456");
      //save token in cookie
      res.json({ ...result, token: token });
      // .cookie("authcookie", token, { maxAge: 900000, httpOnly: true })
    } else {
      res.json(result);
    }
  } catch (err) {
    console.log(err);
    console.log({ sucess: false, message: "Login Unsuccessfull" });
    res.status(404).json({ sucess: false, message: "Login Unsuccessfull" });
  }
});
export default router;
