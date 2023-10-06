import { pool } from "./database.js";

export async function getAllTrainDetails() {
  try {
    const trains = await pool.query("SELECT * FROM train");

    const reult = { sucess: true, trains: trains[0] };

    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
