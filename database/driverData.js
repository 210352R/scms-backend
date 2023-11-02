import { pool } from "./database.js";
import moment from "moment";

// Rest of your code remains the same
// const dateStr = "2023-10-26"; // Replace with your date
// const date = moment(dateStr, "YYYY-MM-DD");
// const weekNumber = date.isoWeek();
// console.log(`Week number for ${dateStr}: ${weekNumber}`);

export async function getAllDrivers() {
  try {
    const drivers = await pool.query("select * from getdriverdata");
    const result = { sucess: true, drivers: drivers[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getAllDriversOrderByScheduleDate() {
  try {
    const drivers = await pool.query(
      "SELECT getdriverdata.* , date FROM getdriverdata JOIN truck_schedule ON getdriverdata.userName = truck_schedule.driver_id ORDER BY truck_schedule.Date DESC"
    );
    const result = { sucess: true, drivers: drivers[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getDriverByUserName(username) {
  try {
    const driver = await pool.query(
      "select * from getdriverdata where username = ? ",
      [username]
    );
    let result;
    if (driver[0].length > 0) {
      result = { sucess: true, driver: driver[0] };
    } else {
      result = { sucess: false, err: "No Driver Found !" };
    }
    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getDriverIdsForSuitable(date, time, tripTime, store_id) {
  const connection = await pool.getConnection();

  try {
    let outputDriverId_1 = null;
    let outputDriverId_2 = null;

    const query1 = "call scms_db.GetDriverIdByNearAfter(?,?,?)";
    // Execute the stored procedure using the CALL statement
    const resNearAfter = await pool.query(query1, [date, time, store_id]);
    if (resNearAfter[0][0][0]) {
      outputDriverId_1 = resNearAfter[0][0][0]?.driver_id;
    }

    console.log("Output Driver Id 1 : ", outputDriverId_1);

    const query2 = "call scms_db.GetDriverIdByNearEarly(?,?,?)";
    // Execute the stored procedure using the CALL statement
    const resNearEarly = await pool.query(query2, [date, time, store_id]);
    console.log("ResNearAfter : ", resNearAfter[0][0]);
    console.log("ResNearEarly : ", resNearEarly[0][0]);
    if (resNearEarly[0][0][0]) {
      console.log("dfgfhgjhkjhfdfsdssfghj ---- ----- ---- --- ");
      outputDriverId_2 = resNearEarly[0][0][0]?.driver_id;
    }

    console.log("Output Driver Id 2 : ", outputDriverId_2);

    const dateObj = moment(date, "YYYY-MM-DD");
    const weekNumber = dateObj.isoWeek();
    console.log(`Week number for ${date}: ${weekNumber}`);

    const year = dateObj.year();

    console.log(`Year for ${date}: ${year}`);

    // const resultCapacity = await connection.query(
    //   "select driver_id from WeeklyWorkHours_drivers where year = ? AND week_number = ? AND total_work_hours >= (40-?) ",
    //   [year, weekNumber, tripTime]
    // );

    // console.log("Result Capacity:", resultCapacity);
    // console.log("Result Capacity IDS:", resultCapacity[0]);
    // // Use the output parameter in your subsequent query
    let result;
    if (!outputDriverId_1 && !outputDriverId_2) {
      result = await connection.query(
        "SELECT userName FROM getdriverdata where store_id = ? AND userName NOT IN (select driver_id from WeeklyWorkHours_drivers where year = ? AND week_number = ?  AND total_work_hours >= (40-?)) ",
        [store_id, year, weekNumber, tripTime]
      );
    }
    if (!outputDriverId_1 && outputDriverId_2) {
      console.log("llbgigj ------------- ----------------------");
      result = await connection.query(
        "SELECT userName FROM getdriverdata where store_id = ? AND userName NOT IN (?) AND userName NOT IN (select driver_id from WeeklyWorkHours_drivers where year = ? AND week_number = ?  AND total_work_hours >= (40-?))",
        [store_id, outputDriverId_2, year, weekNumber, tripTime]
      );
    }
    if (outputDriverId_1 && !outputDriverId_2) {
      result = await connection.query(
        "SELECT userName FROM getdriverdata where store_id = ? AND userName NOT IN (?) AND userName NOT IN (select driver_id from WeeklyWorkHours_drivers where year = ? AND week_number = ?  AND total_work_hours >= (40-?))",
        [store_id, outputDriverId_1, year, weekNumber, tripTime]
      );
    }
    if (outputDriverId_1 && outputDriverId_2) {
      result = await connection.query(
        "SELECT userName FROM getdriverdata where store_id = ? AND userName NOT IN (?,?) AND userName NOT IN (select driver_id from WeeklyWorkHours_drivers where year = ? AND week_number = ?  AND total_work_hours >= (40-?))",
        [
          store_id,
          outputDriverId_1,
          outputDriverId_2,
          year,
          weekNumber,
          tripTime,
        ]
      );
    }

    // console.log("Result:", result);
    return { sucess: true, result: result[0] };
  } catch (error) {
    console.error("Error:", error);
  } finally {
    connection.release();
  }
}
