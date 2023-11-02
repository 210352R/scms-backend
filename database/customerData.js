import { pool } from "./database.js";

import bcrypt from "bcrypt";

export async function getAllCustomers() {
  try {
    const customers = await pool.query("SELECT * FROM customer_details");

    const reult = { sucess: true, customers: customers[0] };

    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getCustomerById(id) {
  try {
    const customer = await pool.query(
      "SELECT * FROM customer_details WHERE customer_id = ?",
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
    // Hash the customer's password
    const hashedPassword = await bcrypt.hash(customer.password, 10);

    const query =
      "INSERT INTO customer (customer_id, first_name, last_name, address, phone_number, email, DOB, type, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    const result = await pool.query(query, [
      customer.customer_id,
      customer.firstName,
      customer.lastName,
      customer.address,
      customer.phone_number,
      customer.email,
      customer.date_birth,
      customer.customer_type,
      hashedPassword, // Store the hashed password
    ]);

    return { sucess: true, data: result };
  } catch (err) {
    return { sucess: false, error: err };
  }
}

// login customer ------------------------------

export async function loginCustomer(customer_id, password) {
  try {
    const query =
      "SELECT customer_id, password FROM customer WHERE customer_id = ?";
    const result = await pool.query(query, [customer_id]);

    if (result[0][0]) {
      const hashedPassword = result[0][0].password;

      // Compare the hashed password with the provided password
      const passwordMatch = await bcrypt.compare(password, hashedPassword);

      if (passwordMatch) {
        const query =
          "SELECT * FROM customer WHERE customer_id = ? AND password = ?";
        const result = await pool.query(query, [customer_id, hashedPassword]);
        return {
          sucess: true,
          customer: result[0][0],
          message: "Login Successful",
        };
      } else {
        return { sucess: false, message: "Invalid password" };
      }
    } else {
      return { sucess: false, message: "Invalid customer id" };
    }
  } catch (err) {
    return {
      sucess: false,
      error: err,
      message: "Invalid username or password",
    };
  }
}
