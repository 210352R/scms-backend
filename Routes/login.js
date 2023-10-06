import express from "express";
import jwt from "jsonwebtoken";
import dotenv from "dotenv"; // aluth version nisa ---

import path from "path";
import { dirname } from "path";
import { fileURLToPath } from "url";
import { createRequire } from "module";

import cookieParser from "cookie-parser";

import {
  getAllCustomers,
  getCustomerById,
  addCustomer,
  loginCustomer,
} from "../database/customerData.js";
import { loginAdmin } from "../database/adminData.js";
import { loginCoordinater } from "../database/CoordinaterData.js";
import auth from "../middleware/auth.js";

const router = express.Router();
dotenv.config();

router.get("/customers/authenticate", auth, async (req, res) => {
  // const token = req?.headers.authorization.split(" ")[1];
  // console.log("undeci Token : ", token);
  // const decodedToken = jwt.decode(token);
  res
    .status(200)
    .json({ success: true, message: "you are logged in", token: decodedToken });
});

router.post("/customer", async (req, res) => {
  const { username, password } = req.body;
  try {
    const result = await loginCustomer(username, password);
    if (result.sucess) {
      //create jwt token
      const token = jwt.sign({ user: username }, "123456");
      //save token in cookie
      //res.cookie("authcookie", token, { httpOnly: true });
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

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

router.get("/page", (req, res) => {
  console.log(path.join(__dirname, "index.html"));
  res.sendFile(path.join(__dirname, "index.html"));
});

export default router;
