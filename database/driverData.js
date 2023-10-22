import { pool } from "./database.js";

export async function callStoredProcAndQuery() {
  const connection = await pool.getConnection();

  try {
    // Set input parameters
    const inputDate = "2023-10-26";
    const inputTime = "10:00:00";

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

    // console.log("Output Driver ID 2:", outputDriverId_2);

    // // Use the output parameter in your subsequent query
    const [result] = await connection.query(
      "SELECT userName FROM driver WHERE userName NOT IN (? , ?)",
      [outputDriverId_1, outputDriverId_2]
    );

    // console.log("Result:", result);
    return { sucess: true, result };
  } catch (error) {
    console.error("Error:", error);
  } finally {
    connection.release();
  }
}

callStoredProcAndQuery();
