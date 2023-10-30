import { pool } from "./database.js";
import moment from "moment";

export async function getAllTrucks() {
  try {
    const trucks = await pool.query("select * from truck");
    const result = { sucess: true, trucks: trucks[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getTruckByTruckId(id) {
  try {
    const truck = await pool.query("select * from truck where truck_id = ? ", [
      id,
    ]);
    let result;
    if (truck[0].length > 0) {
      result = { sucess: true, truck: truck[0] };
    } else {
      result = { sucess: false, err: "No truck Found !" };
    }
    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getTruckByStoreId(id) {
  try {
    const truck = await pool.query("select * from truck where store_id = ?", [
      id,
    ]);
    let result;
    if (truck[0].length > 0) {
      result = { sucess: true, truck: truck[0] };
    } else {
      result = { sucess: false, err: "No Truck Founnd !" };
    }
    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getValidTruckForGivenDateTime(
  date,
  time,
  route_id,
  store_id
) {
  console.log("Date : ", date, "Time : ", time, "Route : ", route_id);
  const dateObj = moment(date, "YYYY-MM-DD");

  const month = dateObj.month() + 1;
  console.log("Month : ", month);
  try {
    const query = "call scms_db.GetAvailableTrucksByMonth(?,?,?,?,?)";

    const trucks = await pool.query(query, [
      date,
      time,
      route_id,
      store_id,
      month,
    ]);
    let result;
    console.log("Trucks : ", trucks[0][0]);
    if (trucks[0].length > 0) {
      result = { sucess: true, truck: trucks[0][0] };
    } else {
      result = { sucess: false, err: "No Truck Founnd !" };
    }
    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
