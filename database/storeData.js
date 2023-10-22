import { pool } from "./database.js";

export async function getAllStoreDetails() {
  try {
    const stores = await pool.query("SELECT * FROM store");

    const reult = { sucess: true, stores: stores[0] };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
