/* log in process */
import { pool } from "./database.js";

export async function loginAdmin(username, password) {
  try {
    const query = "SELECT password FROM admin WHERE user_name = ?";
    const result = await pool.query(query, [username]);

    if (result[0][0]) {
      if (result[0][0].password === password) {
        const query =
          "SELECT * FROM admin WHERE user_name = ? AND password = ?";
        const result = await pool.query(query, [username, password]);
        // console.log({
        //   sucess: true,
        //   customer: result[0][0],
        //   message: "login successfull",
        // });
        return {
          sucess: true,
          admin: result[0][0],
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

export async function getAdminByUsername(id) {
  try {
    const admin = await pool.query("select * from admin where user_name = ?", [
      id,
    ]);
    let result;
    if (admin[0].length > 0) {
      result = { sucess: true, admin: admin[0] };
    } else {
      result = { sucess: false, err: "No such item Found !" };
    }
    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
