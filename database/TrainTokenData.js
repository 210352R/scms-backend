import { pool } from "./database.js";

// make a function for add train token
export async function addTrainToken(train_id, date, start_time) {
  try {
    const query =
      "INSERT INTO train_token (train_id, Date, start_time) VALUES (?,?,?)";
    const result = await pool.query(query, [train_id, date, start_time]);
    console.log(result);
    return result;
  } catch (err) {
    console.log("Train token assign failed ----- ");
    return { sucess: false, err: err };
  }
}

// make a function for get tarin_token data by
export async function getTokenDetailsbyTripId(trip_id) {
  try {
    const query = " select * from train_token where trip_id = ?";
    const query2 =
      "select (t.train_capacity-ttk.curr_capacity) as avilableCapacity from train_trip as tt inner join train as t on t.train_id = tt.train_id inner join train_token as ttk on ttk.trip_id = tt.trip_id where tt.trip_id = ?";
    const result = await pool.query(query, [trip_id]);
    const avilableCapacity = await pool.query(query2, [trip_id]);
    console.log(result);
    return {
      sucess: true,
      result: {
        ...result[0][0],
        avilableCapacity: avilableCapacity[0][0].avilableCapacity,
      },
    };
  } catch (err) {
    console.log("Could not get train token details  ----- ");
    return { sucess: false, err: err };
  }
}

export async function addTrainTokenItems(tokenItems) {
  try {
    const query =
      "INSERT INTO train_token_items (token_Id ,add_quantity,order_Id, product_id ) values (?, ?, ?, ?)";
    let result;
    for (let i = 0; i < tokenItems?.length; i++) {
      result = await pool.query(query, [
        tokenItems[i].token_Id,
        tokenItems[i].add_quantity,
        tokenItems[i].order_Id,
        tokenItems[i].product_id,
      ]);
    }
    console.log("Wade Goda --- ");
    return { sucess: true, data: result };
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function updateTokenCapacity(tokenCapacity) {
  try {
    const res = await await pool.query(
      "select train_capacity from train_token_view where token_Id = ?",
      [tokenCapacity.token_id]
    );
    const query = "UPDATE train_token SET curr_capacity = ? WHERE token_id = ?";
    const result = await pool.query(query, [
      tokenCapacity.capacity,
      tokenCapacity.token_id,
    ]);
    console.log("Wade Goda --- ");
    return { sucess: true, data: result };
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getAllTrainTokenDetails() {
  try {
    const tokens = await pool.query("select * from train_token_view;");

    const reult = { sucess: true, tokens: tokens[0] };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getAllTrainTokenDetailsAccCapacity() {
  try {
    const tokens = await pool.query(
      "select * from train_token_view where curr_capacity != train_capacity order by curr_capacity desc  limit 10 ;"
    );

    const currentDate = new Date();
    const formattedDate = currentDate.toISOString(); // ISO 8601 format
    console.log(formattedDate);
    // use filter function for get the tokens which are not expired
    const newTokens = tokens[0].filter((token) => {
      return token.Date >= currentDate;
    });
    const reult = { sucess: true, tokens: newTokens };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
