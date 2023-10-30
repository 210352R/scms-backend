import express from "express";
import { getAllStoredOrdersWithProdutsByStoreId } from "../database/orderData.js";
import {
  getTruckByStoreId,
  getValidTruckForGivenDateTime,
} from "../database/truckData.js";
import { getDriverIdsForSuitable } from "../database/driverData.js";
import { getRouteById } from "../database/routeData.js";
import { getADriverIdsForSuitable } from "../database/a_driver_data.js";
import { addTruckSchedule } from "../database/truckScheduleData.js";

const router = express.Router();

router.get("/getAllStoredOrders/:id", async (req, res) => {
  const result = await getAllStoredOrdersWithProdutsByStoreId(req.params.id);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(500).json({ sucess: false, message: "No Orders found yet" });
  }
});

router.get("/getAllTrucks/:id", async (req, res) => {
  const result = await getTruckByStoreId(req.params.id);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(500).json({ sucess: false, message: "No Trucks found yet" });
  }
});

router.get(
  "/getValidAllTrucks/:date/:time/:route_id/:store_id",
  async (req, res) => {
    const result = await getValidTruckForGivenDateTime(
      req.params.date,
      req.params.time,
      req.params.route_id,
      req.params.store_id
    );

    //   res.json(result);
    //   console.log(result);
    if (result.sucess) {
      res.status(200).json(result);
    } else {
      res.status(500).json({ sucess: false, message: "No Trucks found yet" });
    }
  }
);

router.get("/getValidAllDrivers/:date/:time/:trip_time", async (req, res) => {
  console.log(req.params.date, req.params.time, req.params.trip_time);

  const result = await getDriverIdsForSuitable(
    req.params.date,
    req.params.time,
    req.params.trip_time
  );

  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(500).json({ sucess: false, message: "No Drivers found yet" });
  }
});

router.get("/getRoute/:id", async (req, res) => {
  const result = await getRouteById(req.params.id);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    res.status(200).json(result);
  } else {
    res.status(500).json({ sucess: false, message: "No Orders found yet" });
  }
});

router.get(
  "/getValidAll_A_Drivers/:date/:time/:trip_time",
  async (req, res) => {
    console.log(req.params.date, req.params.time, req.params.trip_time);

    const result = await getADriverIdsForSuitable(
      req.params.date,
      req.params.time,
      req.params.trip_time
    );

    //   res.json(result);
    //   console.log(result);
    if (result.sucess) {
      res.status(200).json(result);
    } else {
      res.status(500).json({ sucess: false, message: "No Drivers found yet" });
    }
  }
);

router.post("/addTruck", async (req, res) => {
  console.log("Body : ", req.body);
  try {
    const result = await addTruckSchedule(req.body);
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

export default router;
