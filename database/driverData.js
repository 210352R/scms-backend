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

export async function getDriverIdsForSuitable(date, time, tripTime) {
  const connection = await pool.getConnection();

  try {
    // Set input parameters
    const inputDate = date;
    const inputTime = time;

    // Create an empty variable for the output parameter
    let outputDriverId_1;
    let outputDriverId_2;

    // Execute the stored procedure using the CALL statement
    await connection.query(
      "CALL GetDriverIdByNearEarly(?, ?, @output_driver_id)",
      [inputDate, inputTime]
    );

    // Fetch the value of the output parameter
    const [rows] = await connection.query(
      "SELECT @output_driver_id AS output_driver_id"
    );

    // The output parameter value will be in rows[0][0]
    outputDriverId_1 = rows[0].output_driver_id;

    // // Process the output parameter
    console.log("Output Driver ID:", outputDriverId_1);

    await connection.query(
      "CALL GetDriverIdByNearAfter(?, ?, @output_driver_id)",
      [inputDate, inputTime]
    );

    const [rows1] = await connection.query(
      "SELECT @output_driver_id AS output_driver_id"
    );

    outputDriverId_2 = rows1[0].output_driver_id;

    console.log("Output Driver ID 2:", outputDriverId_2);

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
        "SELECT userName FROM driver WHERE userName NOT IN (select driver_id from WeeklyWorkHours_drivers where year = ? AND week_number = ? AND total_work_hours >= (40-?)) ",
        [year, weekNumber, tripTime]
      );
    }
    if (!outputDriverId_1 && outputDriverId_2) {
      result = await connection.query(
        "SELECT userName FROM driver WHERE userName NOT IN (?) AND  userName NOT IN (select driver_id from WeeklyWorkHours_drivers where year = ? AND week_number = ? AND total_work_hours >= (40-?)) ",
        [outputDriverId_2, year, weekNumber, tripTime]
      );
    }
    if (outputDriverId_1 && !outputDriverId_2) {
      result = await connection.query(
        "SELECT userName FROM driver WHERE userName NOT IN (?) AND  userName NOT IN (select driver_id from WeeklyWorkHours_drivers where year = ? AND week_number = ? AND total_work_hours >= (40-?)) ",
        [outputDriverId_1, year, weekNumber, tripTime]
      );
    }
    if (outputDriverId_1 && outputDriverId_2) {
      result = await connection.query(
        "SELECT userName FROM driver WHERE userName NOT IN (? , ?) AND  userName NOT IN (select driver_id from WeeklyWorkHours_drivers where year = ? AND week_number = ? AND total_work_hours >= (40-?)) ",
        [outputDriverId_1, outputDriverId_2, year, weekNumber, tripTime]
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
