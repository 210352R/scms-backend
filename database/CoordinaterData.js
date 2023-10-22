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
