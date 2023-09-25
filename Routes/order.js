import express from "express";

import { getAllOrdersWithProduts } from "../database/orderData.js";

const router = express.Router();

router.get("/getAll", async (req, res) => {
  const result = await getAllOrdersWithProduts();
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(404).json({ sucess: false, message: "No customers found" });
  }
});

export default router;
