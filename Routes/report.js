import express from "express";
import {
  getItemsWithMostSales,
  getQuartlaryReport,
  getSalesBasedId,
  getSalesByCustomer,
  getWorkHoursOfEmployees,
  getWorkHoursOfTrucks,
} from "../database/reportData.js";

const router = express.Router();

router.get("/getQuartlaryReport/:year", async (req, res) => {
  const result = await getQuartlaryReport(req.params.year);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.data.length > 0) {
      res.status(200).json({ sucess: true, data: result.data });
    } else {
      res.status(200).json({ sucess: false, message: "No Such Report -- " });
    }
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

router.get("/getItemsWithMostSales/:year", async (req, res) => {
  const result = await getItemsWithMostSales(req.params.year);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.data.length > 0) {
      res.status(200).json({ sucess: true, data: result.data });
    } else {
      res.status(200).json({ sucess: false, message: "No Data -- " });
    }
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

router.get("/getSalesByCustomer/:year/:customer_id", async (req, res) => {
  const result = await getSalesByCustomer(
    req.params.year,
    req.params.customer_id
  );
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.data.length > 0) {
      res.status(200).json({ sucess: true, data: result.data });
    } else {
      res.status(200).json({ sucess: false, message: "No Data -- " });
    }
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

router.get("/getWorkHoursOfTrucks/:year", async (req, res) => {
  const result = await getWorkHoursOfTrucks(req.params.year);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.data.length > 0) {
      res.status(200).json({ sucess: true, data: result.data });
    } else {
      res.status(200).json({ sucess: false, message: "No Data -- " });
    }
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

router.get("/getWorkHoursOfEmployees/:year", async (req, res) => {
  const result = await getWorkHoursOfEmployees(req.params.year);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.data.length > 0) {
      res.status(200).json({ sucess: true, data: result.data });
    } else {
      res.status(200).json({ sucess: false, message: "No Data -- " });
    }
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

// getSalesBase

router.get("/getSalesBasedId/:year/:store_id", async (req, res) => {
  const result = await getSalesBasedId(req.params.year, req.params.store_id);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.data.length > 0) {
      res.status(200).json({ sucess: true, data: result.data });
    } else {
      res.status(200).json({ sucess: false, message: "No Data -- " });
    }
  } else {
    res.status(404).json({ message: "Not found" });
  }
});

export default router;
