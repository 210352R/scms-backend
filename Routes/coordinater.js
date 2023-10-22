import express from "express";
import { pool } from "../database/database.js";
import { getAllNewOrdersWithProdutsAndNetCapacity } from "../database/orderData.js";

const router = express.Router();

router.get("/getAllOrdersWithCapacity", async (req, res) => {
  try {
    const result = await getAllNewOrdersWithProdutsAndNetCapacity();
    //   res.json(result);
    //   console.log(result);
    if (result.sucess) {
      if (result.orders.length > 0) {
        result.orders = result.orders.filter((order) => order);
        res.status(200).json(result);
      } else {
        res.status(200).json({ sucess: false, message: "No Such Orders" });
      }
    } else {
      res.status(500).json(result);
    }
  } catch (err) {
    res.status(500).json({ sucess: false, message: err.message });
  }
});

export default router;
