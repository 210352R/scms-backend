import { pool } from "./database.js";
import moment from "moment";

export async function getAllA_Drivers() {
  try {
    const a_drivers = await pool.query("select * from geta_driverdata");
    const result = { sucess: true, a_drivers: a_drivers[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getAllA_DriversOrderByScheduleDate() {
  try {
    const a_drivers = await pool.query("select * from geta_driverdata");
    const result = { sucess: true, a_drivers: a_drivers[0] };
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

export async function getADriverIdsForSuitable(date, time, tripTime, store_id) {
  try {
    let inputIdNearAfter = null;
    let inputIdNearEarly = null;

    const query = "call scms_db.GetA_DriverIdByNearAfter(?,?,?)";
    // Execute the stored procedure using the CALL statement
    const resNearAfter = await pool.query(query, [date, time, store_id]);

    console.log("dfhbasabnjfsn : ", resNearAfter[0][0]);

    if (resNearAfter[0][0].length > 0) {
      if (
        resNearAfter[0][0][0]?.a_driver_id ===
        resNearAfter[0][0][1]?.a_driver_id
      ) {
        inputIdNearAfter = resNearAfter[0][0][0]?.a_driver_id;
      }
    }

    console.log("inputIdNearAfter : ", inputIdNearAfter);

    const query2 = "call scms_db.GetA_DriverIdByNearEarly(?, ? , ?)";

    const resNearEarly = await pool.query(query, [date, time, store_id]);

    if (resNearEarly[0][0].length > 0) {
      if (
        resNearEarly[0][0][0]?.a_driver_id ===
        resNearEarly[0][0][1]?.a_driver_id
      ) {
        inputIdNearEarly = resNearEarly[0][0][0]?.a_driver_id;
      }
    }

    console.log("inputIdNearEarly : ", inputIdNearEarly);

    const dateObj = moment(date, "YYYY-MM-DD");
    const weekNumber = dateObj.isoWeek();
    console.log(`Week number for ${date}: ${weekNumber}`);

    const year = dateObj.year();

    console.log(`Year for ${date}: ${year}`);

    let result;
    if (!inputIdNearAfter && !inputIdNearEarly) {
      console.log("Wohfroh 0");
      result = await pool.query(
        "SELECT userName FROM a_driver WHERE  userName NOT IN (select a_driver_id from WeeklyWorkHours_a_drivers where year = ? AND week_number = ? AND total_work_hours >= (60-?)) ",
        [inputIdNearEarly, year, weekNumber, tripTime]
      );
    }

    if (!inputIdNearAfter && inputIdNearEarly) {
      console.log("Wohfroh 1");
      result = await pool.query(
        "SELECT userName FROM a_driver WHERE userName NOT IN (?) AND  userName NOT IN (select a_driver_id from WeeklyWorkHours_a_drivers where year = ? AND week_number = ? AND total_work_hours >= (60-?)) ",
        [inputIdNearEarly, year, weekNumber, tripTime]
      );
    }

    if (inputIdNearAfter && !inputIdNearEarly) {
      console.log("Query 2");
      result = await pool.query(
        "SELECT userName FROM a_driver WHERE userName NOT IN (?) AND  userName NOT IN (select a_driver_id from WeeklyWorkHours_a_drivers where year = ? AND week_number = ? AND total_work_hours >= (60-?)) ",
        [inputIdNearAfter, year, weekNumber, tripTime]
      );
    }

    if (inputIdNearAfter && inputIdNearEarly) {
      console.log("Query 3");
      result = await pool.query(
        "SELECT userName FROM a_driver WHERE userName NOT IN (? , ?) AND  userName NOT IN (select a_driver_id from WeeklyWorkHours_a_drivers where year = ? AND week_number = ? AND total_work_hours >= (60-?)) ",
        [inputIdNearAfter, inputIdNearEarly, year, weekNumber, tripTime]
      );
    }

    console.log("Result:", result[0]);
    return { sucess: true, result: result[0] };
  } catch (error) {
    console.error("Error:", error);
    return { sucess: false, err: err };
  }
}
