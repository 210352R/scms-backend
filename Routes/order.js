import express from "express";

import {
  getAllOrdersWithProduts,
  getAllOrders,
  getAllOrdersWithProdutsByID,
  getAllOrdersWithProdutsByCustID,
} from "../database/orderData.js";

const router = express.Router();

router.get("/getAll", async (req, res) => {
  const result = await getAllOrdersWithProduts();
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(404).json({ sucess: false, message: "No Orders found" });
  }
});

router.get("/get/:id", async (req, res) => {
  const result = await getAllOrdersWithProdutsByCustID(req.params.id);
  //   res.json(result);
  console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(404).json({ sucess: false, message: "No Orders found" });
  }
});

//getAllOrdersWithProdutsByID
router.get("/getItem/:id", async (req, res) => {
  const result = await getAllOrdersWithProdutsByID(req.params.id);
  //   res.json(result);
  console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(404).json({ sucess: false, message: "No Orders found" });
  }
});

export default router;
