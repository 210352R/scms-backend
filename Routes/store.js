import express from "express";
import { getAllStoreDetails, getStoreByUserId } from "../database/storeData.js";

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

router.get("/get/:id", async (req, res) => {
  const result = await getStoreByUserId(req.params.id);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.store.length > 0) {
      res.status(200).json({ sucess: true, store: result.store });
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
