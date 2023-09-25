import { pool } from "./database.js";

// products okkogemaa okkoma data tika eliyata ganna wa---
export async function getAllProducts() {
  try {
    const products = await pool.query("SELECT * FROM product");
    products[0]?.map((product) => {
      return (product.unit_price = parseFloat(product.unit_price));
    });
    const reult = { sucess: true, products: products[0] };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// product id eka dunnama wisthara tika gannawa ---
export async function getProductById(id) {
  try {
    const product = await pool.query(
      "SELECT * FROM product WHERE product_id = ?",
      [id]
    );
    let result;
    if (product[0].length > 0) {
      result = { sucess: true, product: product[0] };
    } else {
      result = { sucess: false, err: "No such item Found !" };
    }
    //const result = { sucess: true, product: product[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// getProduct capacity by  id

// product id eka dunnama wisthara tika gannawa ---
export async function getProductCapacityById(id) {
  try {
    const productCapacity = await pool.query(
      "SELECT capacity FROM product WHERE product_id = ?",
      [id]
    );
    let result;
    if (productCapacity[0].length > 0) {
      result = { sucess: true, productCapacity: productCapacity[0][0] };
    } else {
      result = { sucess: false, err: "No such item Found !" };
    }
    //const result = { sucess: true, productCapacity: productCapacity[0][0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
