import { pool } from "./database.js";

// -- INSERT INTO truck_schedule (truck_id, driver_id, a_driver_id, time, Date, route_id)
// -- VALUES (2, 'john_doe', 'jane', '08:00:00', '2023-10-27', 'R001');

export async function addTruckSchedule({
  truck_id,
  driver_id,
  a_driver_id,
  time,
  date,
  route_id,
  order_id,
}) {
  try {
    console.log("Date ----------------- : ", date);
    const query =
      "INSERT INTO truck_schedule (truck_id, driver_id, a_driver_id, time, Date, route_id,order_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
    const result = await pool.query(query, [
      truck_id,
      driver_id,
      a_driver_id,
      time,
      date,
      route_id,
      order_id,
    ]);
    const reult = { sucess: true, result: result[0] };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getAllTruckSchedules() {
  try {
    const truck_schedules = await pool.query(
      "SELECT * FROM truckschedulewithroutedetails"
    );

    const reult = { sucess: true, truck_schedules: truck_schedules[0] };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getAllTruckSchedulesByYear(year) {
  try {
    const customers = await pool.query(
      "SELECT * FROM truckschedulewithroutedetails"
    );

    const reult = { sucess: true, customers: customers[0] };

    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getAllTruckSchedulesByDate(date) {
  try {
    const customers = await pool.query(
      "SELECT * FROM truckschedulewithroutedetails where date = ?",
      [date]
    );

    const reult = { sucess: true, customers: customers[0] };

    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
