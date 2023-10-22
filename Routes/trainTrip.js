import express from "express";
import {
  assignTrainTrip,
  getTrainTripDetailsByDateTime,
} from "../database/traintripData.js";

const router = express.Router();

router.post("/addTrainTrip", async (req, res) => {
  console.log("Body : ", req.body);
  try {
    const result = await assignTrainTrip(
      req.body.train_id,
      req.body.date,
      req.body.start_time
    );
    console.log("Result : ", result);
    if (result.sucess) {
      res.status(200).json({ sucess: true, message: "Train Trip Added" });
    } else {
      res.status(404).json({ sucess: false, message: "Train Trip Not Added" });
    }
  } catch (err) {
    console.log("Error : ", err);
    res
      .status(404)
      .json({ sucess: false, message: "Train Trip Not Added", err: err });
  }
});

router.post("/getTrainTrip", async (req, res) => {
  console.log("Body : ", req.body);
  try {
    const result = await getTrainTripDetailsByDateTime(
      req.body.train_id,
      req.body.date,
      req.body.start_time
    );
    console.log("Result : ", result);
    if (result.sucess) {
      res.status(200).json({
        sucess: true,
        train_trip: result.train_trip,
        message: "Train Trip Found",
      });
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

export default router;
