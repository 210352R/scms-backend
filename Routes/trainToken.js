import express from "express";
import {
  addTrainTokenItems,
  getAllTrainTokenDetailsAccCapacity,
  getAllTrainTokenDetailsAccCapacityByStoreId,
  getTokenDetailsbyTripId,
  updateTokenCapacity,
} from "../database/TrainTokenData.js";

const router = express.Router();

router.get("/getTokenDetails/:id", async (req, res) => {
  const result = await getTokenDetailsbyTripId(req.params.id);
  //   res.json(result);
  console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(404).json({ sucess: false, message: "No Tokens found" });
  }
});

router.post("/addTokenItems", async (req, res) => {
  console.log("Body : ", req.body);
  try {
    const result = await addTrainTokenItems(req.body);
    console.log("Result : ", result);
    if (result.sucess) {
      res
        .status(200)
        .json({ sucess: true, message: "Items are successfully Added" });
    } else {
      res.status(404).json({
        sucess: false,
        message: "Items are Not Added",
        err: result.err.message,
      });
    }
  } catch (err) {
    console.log("Error : ", err);
    res
      .status(404)
      .json({ sucess: false, message: "Items are Not Added -- ", err: err });
  }
});

router.post("/updateCapacity", async (req, res) => {
  console.log("Body --- : ", req.body);
  try {
    const result = await updateTokenCapacity(req.body);
    console.log("Result : ", result);
    if (result.sucess && result.capacity) {
      res
        .status(200)
        .json({ sucess: true, message: "successfully updated Capacity" });
    } else if (result.sucess && !result.capacity) {
      res
        .status(200)
        .json({ sucess: false, message: "Capacity Exceeded ---- " });
    } else {
      res.status(404).json({
        sucess: false,
        message: "Not updated Capacity",
        err: result.err.message,
      });
    }
  } catch (err) {
    console.log("Error : ", err);
    res
      .status(404)
      .json({ sucess: false, message: "Not updated Capacity", err: err });
  }
});

router.get("/getNotFillTokenDetails", async (req, res) => {
  const result = await getAllTrainTokenDetailsAccCapacity();
  //   res.json(result);
  console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(404).json({ sucess: false, message: "No Tokens found" });
  }
});

router.get("/getNotFillTokenDetailsByStore/:id", async (req, res) => {
  const result = await getAllTrainTokenDetailsAccCapacityByStoreId(
    req.params.id
  );
  //   res.json(result);
  console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(404).json({ sucess: false, message: "No Tokens found" });
  }
});
export default router;
