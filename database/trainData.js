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

export async function getTrainDetailsById(trainId) {
  try {
    const train = await pool.query("SELECT * FROM train WHERE train_id = ?", [
      trainId,
    ]);
    let result;
    if (train[0].length > 0) {
      result = { sucess: true, train: train[0] };
    } else {
      result = { sucess: false, err: "No such item Found !" };
    }

    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getTrainDetailsByStoreId(storeId) {
  try {
    const train = await pool.query("SELECT * FROM train WHERE store_id = ?", [
      storeId,
    ]);
    let result;
    if (train[0].length > 0) {
      result = { sucess: true, trains: train[0] };
    } else {
      result = { sucess: false, err: "No such item Found !" };
    }

    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
