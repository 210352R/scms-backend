import express from "express";

import auth from "../middleware/auth.js";

import {
  getAllCustomers,
  getCustomerById,
  addCustomer,
  loginCustomer,
} from "../database/customerData.js";

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

router.get("/get/:id", async (req, res) => {
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

router.post("/save", auth, async (req, res) => {
  console.log("Body : ", req.body);
  const result = await addCustomer(req.body);
  console.log("Result : ", result);
  if (result.sucess) {
    res.status(200).json({ sucess: true, message: "Customer Added" });
  }
  res.status(404).json({ sucess: false, message: "Customer Not Added" });
});

export default router;
