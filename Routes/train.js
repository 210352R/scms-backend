import express from "express";
import { getTrainDetailsByStoreId } from "../database/trainData.js";
import { getAvilableTrainsByDate } from "../database/traintripData.js";

const router = express.Router();

router.get("/getTrain/:id", async (req, res) => {
  const result = await getTrainDetailsByStoreId(req.params.id);
  //   res.json(result);
  console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(404).json({ sucess: false, message: "No Orders found" });
  }
});

router.get("/getTrainAvilable/:id/:date", async (req, res) => {
  const result = await getAvilableTrainsByDate(req.params.id, req.params.date);
  //   res.json(result);
  console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(404).json({ sucess: false, message: "No Orders found" });
  }
});

export default router;
