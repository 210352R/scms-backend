import mysql from "mysql2"; // aluth version nisa ---
import dotenv from "dotenv"; // aluth version nisa ---
dotenv.config();

// connection eka pool ekak  widiyata hadanawa --
export const pool = mysql
  .createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DB, // database eke nam danwa --
  })
  .promise();
