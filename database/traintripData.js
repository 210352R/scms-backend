import { pool } from "./database.js";

const commonQuery =
  "SELECT tt.trip_id , tt.Date , tt.start_time, tt.train_id ,t.name as train_name,t.arrival_time,t.train_capacity,t.store_id,t.destination FROM train_trip as tt inner join train as t ON t.train_id = tt.train_id";

export async function getAllTrainTripDetails() {
  try {
    const train_trips = await pool.query(
      `${commonQuery} order by tt.trip_id asc`
    );

    let result;
    if (train_trips[0].length > 0) {
      result = { sucess: true, train_trips: train_trips[0] };
    } else {
      result = { sucess: false, err: "No assigned train trips yet!" };
    }
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// Assign train trip -------
export async function assignTrainTrip(train_id, date, start_time) {
  try {
    const query =
      "INSERT INTO train_trip (train_id, Date, start_time) VALUES (?,?,?)";
    const result = await pool.query(query, [train_id, date, start_time]);
    console.log(result);
    return { sucess: true, result };
  } catch (err) {
    console.log("Trip assign failed ----- ");
    return { sucess: false, err: err };
  }
}

// Get  train trip by id -------
export async function getTrainTripDetailsById(trip_id) {
  try {
    const train_trip = await pool.query(`${commonQuery} where tt.trip_id = ?`, [
      trip_id,
    ]);
    let result;
    if (train_trip[0].length > 0) {
      result = { sucess: true, train_trip: train_trip[0] };
    } else {
      result = { sucess: false, err: "No such train trip !" };
    }
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// Get  train trip by id -------
export async function getTrainTripDetailsByDateTime(
  train_id,
  date,
  start_time
) {
  try {
    const train_trip = await pool.query(
      `${commonQuery} where tt.train_id = ? AND tt.Date= ? AND tt.start_time = ?`,
      [train_id, date, start_time]
    );
    let result;
    if (train_trip[0].length > 0) {
      result = { sucess: true, train_trip: train_trip[0] };
    } else {
      result = { sucess: false, err: "No such train trip !" };
    }
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

//get train trips by traain_id ----------------------

export async function getTrainTripDetailsByTrainId(train_id) {
  try {
    const train_trip = await pool.query(
      `${commonQuery} where tt.train_id = ?`,
      [train_id]
    );
    let result;
    if (train_trip[0].length > 0) {
      result = { sucess: true, train_trip: train_trip[0] };
    } else {
      result = { sucess: false, err: "No such train trips  !" };
    }
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

//select * from train where store_id = 'S001' AND  train_id not in (select distinct train_id from train_trip where Date = '2023-10-05');

export async function getAvilableTrainsByDate(storeId, date) {
  try {
    const query =
      "select * from train where store_id = ? AND  train_id not in (select distinct train_id from train_trip where Date = ?)";
    const train = await pool.query(query, [storeId, date]);
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

//////////////////////////////////////////////////////////////////
