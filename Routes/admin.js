import express from "express";

import auth from "../middleware/auth.js";

import multer from "multer";
import path from "path";
import { pool } from "../database/database.js";
import { getAdminByUsername } from "../database/adminData.js";

const router = express.Router();

// router.get("/getAll", async (req, res) => {
//   const result = await getAllCustomers();
//   //   res.json(result);
//   //   console.log(result);
//   if (result.sucess) {
//     res.status(200).json({ sucess: true, customers: result.customers });
//   } else {
//     res.status(404).json({ sucess: false, message: "No customers found" });
//   }
// });

router.get("/get/:id", async (req, res) => {
  const result = await getAdminByUsername(req.params.id);
  //   res.json(result);
  //   console.log(result);
  if (result.sucess) {
    if (result.admin.length > 0) {
      res.status(200).json({ sucess: true, admin: result.admin });
    } else {
      res.status(200).json({ sucess: false, message: "No Such Admin" });
    }
  } else {
    res.status(404).json({ sucess: false, message: "No Admin found" });
  }
});

export default router;
