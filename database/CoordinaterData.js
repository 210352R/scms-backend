import { pool } from "./database.js";

export async function loginCoordinater(username, password) {
  try {
    const query = "SELECT password FROM coordinator WHERE user_name = ?";
    const result = await pool.query(query, [username]);

    if (result[0][0]) {
      if (result[0][0].password === password) {
        const query =
          "SELECT * FROM coordinator WHERE user_name = ? AND password = ?";
        const result = await pool.query(query, [username, password]);
        // console.log({
        //   sucess: true,
        //   customer: result[0][0],
        //   message: "login successfull",
        // });
        return {
          sucess: true,
          coordinater: result[0][0],
          message: "Login Sucessfull -",
        };
      } else {
        return { sucess: false, message: "Invalid password" };
      }
    } else {
      return { sucess: false, message: "Invalid username" };
    }
  } catch (err) {
    const response = {
      sucess: false,
      err: err,
      message: "Invalid username or password",
    };
    return response;
  }
}
export async function getCooByUserName(username) {
  try {
    const customer = await pool.query(
      "select * from train_coordinator_details where user_name = ? ",
      [username]
    );
    let result;
    if (customer[0]?.length > 0) {
      result = { sucess: true, customer: customer[0] };
    } else {
      result = { sucess: true, err: "No such item Found !" };
    }
    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getCoo() {
  try {
    const customer = await pool.query(
      "select * from train_coordinator_details "
    );
    let result;
    if (customer[0]?.length > 0) {
      result = { sucess: true, customer: customer[0] };
    } else {
      result = { sucess: true, err: "No such item Found !" };
    }
    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getStoreIdCooByUserName(username) {
  try {
    const truckCoo = await pool.query(
      "select scms_db.GetStoreIdByUserName(?) as storeId",
      [username]
    );
    let result;
    if (truckCoo[0]?.length > 0) {
      result = { sucess: true, storeId: truckCoo[0] };
    } else {
      result = { sucess: true, err: "No such item Found !" };
    }
    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getTruckCooByUserName(username) {
  try {
    const truckCoo = await pool.query(
      "select * from truck_coordinator_details where user_name = ? ",
      [username]
    );
    let result;
    if (truckCoo[0]?.length > 0) {
      result = { sucess: true, truckCoo: truckCoo[0] };
    } else {
      result = { sucess: true, err: "No such item Found !" };
    }
    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
