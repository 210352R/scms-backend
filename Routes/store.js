import express from "express";
import { getAllStoreDetails } from "../database/storeData.js";

const router = express.Router();

// Get all Store details ----------------------------------------------------------------------------------

/// Images dana wade balanna  --- -- - -- -- -- -- --  -- -- -- -- --
router.get("/getAll", async (req, res) => {
  const result = await getAllStoreDetails();
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    res.status(200).json({ sucess: true, stores: result.stores });
  } else {
    res.status(404).json({ sucess: false, message: "No stores found" });
  }
});

export default router;
