import express from "express";
import { getAllStoredOrdersWithProdutsByStoreId } from "../database/orderData";

const router = express.Router();

router.get("/getAllStoredOrders/:id", async (req, res) => {
  const result = await getAllStoredOrdersWithProdutsByStoreId(req.params.id);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    res.status(200).json({ sucess: true, orders: result.orders });
  } else {
    res.status(500).json({ sucess: false, message: "No Orders found yet" });
  }
});

export default router;
