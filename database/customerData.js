import { pool } from "./database.js";

export async function getAllCustomers() {
  try {
    const customers = await pool.query("SELECT * FROM customer");

    const reult = { sucess: true, customers: customers[0] };

    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getCustomerById(id) {
  try {
    const customer = await pool.query(
      "SELECT * FROM customer WHERE customer_id = ?",
      [id]
    );
    let result;
    if (customer[0].length > 0) {
      result = { sucess: true, customer: customer[0] };
    } else {
      result = { sucess: false, err: "No such item Found !" };
    }
    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function addCustomerImage() {}

export async function addCustomer(customer) {
  try {
    const query =
      "INSERT INTO customer (customer_id, first_name, last_name, address, phone_number, email, DOB, type, password) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    const result = await pool.query(query, [
      customer.customer_id,
      customer.firstName,
      customer.lastName,
      customer.address,
      customer.phone_number,
      customer.email,
      customer.date_birth,
      customer.customer_type,
      customer.password,
    ]);
    return { sucess: true, data: result };
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function loginCustomer(customer_id, password) {
  try {
    const query = "SELECT password FROM customer WHERE customer_id = ?";
    const result = await pool.query(query, [customer_id]);
    if (result[0][0]) {
      if (result[0][0].password === password) {
        const query =
          "SELECT * FROM customer WHERE customer_id = ? AND password = ?";
        const result = await pool.query(query, [customer_id, password]);
        // console.log({
        //   sucess: true,
        //   customer: result[0][0],
        //   message: "login successfull",
        // });
        return {
          sucess: true,
          customer: result[0][0],
          message: "Login Sucessfull -",
        };
      } else {
        return { sucess: false, message: "Invalid password" };
      }
    } else {
      return { sucess: false, message: "Invalid customer id" };
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
