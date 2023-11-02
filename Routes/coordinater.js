import express from "express";
import { pool } from "../database/database.js";
import { getAllNewOrdersWithProdutsAndNetCapacity } from "../database/orderData.js";
import {
  getCoo,
  getCooByUserName,
  getStoreIdCooByUserName,
  getTruckCooByUserName,
} from "../database/CoordinaterData.js";
import { getAllTrainTokenDetails } from "../database/TrainTokenData.js";
import { getStoreByUserId } from "../database/storeData.js";
import { getAllTrainDetails } from "../database/trainData.js";

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

router.get("/get/:username", async (req, res) => {
  const result = await getCooByUserName(req.params.username);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.customer?.length > 0) {
      res.status(200).json({ sucess: true, coordinater: result.customer });
    } else {
      res
        .status(200)
        .json({ sucess: false, message: "No Such Co-ordinater -- " });
    }
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

router.get("/get", async (req, res) => {
  const result = await getCoo();
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.customer?.length > 0) {
      res.status(200).json({ sucess: true, coordinater: result.customer });
    } else {
      res
        .status(200)
        .json({ sucess: false, message: "No Such Co-ordinater -- " });
    }
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

router.get("/getTokens", async (req, res) => {
  const result = await getAllTrainTokenDetails();
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

router.get("/getTrains", async (req, res) => {
  const result = await getAllTrainDetails();
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

router.get("/getStore/:id", async (req, res) => {
  const result = await getStoreByUserId(req.params.id);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.store.length > 0) {
      res.status(200).json({ sucess: true, store: result.store });
    } else {
      res.status(200).json({ sucess: false, message: "No Such Store -- " });
    }
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

router.get("/getTruckCoo/:username", async (req, res) => {
  const result = await getTruckCooByUserName(req.params.username);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.truckCoo?.length > 0) {
      res.status(200).json({ sucess: true, coordinater: result.truckCoo });
    } else {
      res
        .status(200)
        .json({ sucess: false, message: "No Such Co-ordinater -- " });
    }
  } else {
    res.status(404).json({ message: "Not found" });
  }
});
router.get("/getStoreId/:username", async (req, res) => {
  const result = await getStoreIdCooByUserName(req.params.username);
  //   res.json(result);
  console.log(result);
  if (result.sucess) {
    if (result.storeId?.length > 0) {
      res
        .status(200)
        .json({ sucess: true, storeId: result.storeId[0].storeId });
    } else {
      res
        .status(200)
        .json({ sucess: false, message: "No Such Co-ordinater -- " });
    }
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

export default router;
