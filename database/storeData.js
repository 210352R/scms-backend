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

export async function getStoreByUserId(id) {
  try {
    const store = await pool.query("select * from store where store_id = ?", [
      id,
    ]);
    let result;
    if (store[0].length > 0) {
      result = { sucess: true, store: store[0] };
    } else {
      result = { sucess: true, err: "No such item Found !" };
    }
    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
