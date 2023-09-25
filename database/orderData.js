import { pool } from "./database.js";

// Orders okkogemaa okkoma data tika eliyata ganna wa---
export async function getAllOrders() {
  try {
    const orders = await pool.query("SELECT * FROM cust_order");

    const reult = { sucess: true, orders: orders[0] };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// Get order by id  * -- --  -- --
export async function getOrderById(id) {
  try {
    const order = await pool.query(
      "SELECT * FROM cust_order WHERE order_id = ?",
      [id]
    );
    let result;
    if (order[0].length > 0) {
      result = { sucess: true, order: order[0] };
    } else {
      result = { sucess: false, err: "No such item Found !" };
    }
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// get oder by products ***-----

export async function getOrderItemsById(id) {
  try {
    const orderItems = await pool.query(
      "SELECT product_id , quantity , sent_quantity FROM order_items WHERE order_id = ?",
      [id]
    );
    if (orderItems[0].length > 0) {
      return { success: true, products: orderItems[0] };
    } else {
      return { success: false, err: "No items Found !" };
    }
  } catch (err) {
    throw err; // Rethrow the error to handle it in the caller function
  }
}

export async function getAllOrdersWithProduts() {
  try {
    const orders = await pool.query(
      "SELECT order_id FROM cust_order as orders"
    );
    // orders[0].map(async (item) => {
    //   let products = await getAllOrdersWithProdutsByID(item.order_id);
    //   console.log(products);
    //   return (item = { ...item, products: products.products });
    // });
    const updatedOrders = await Promise.all(
      orders[0].map(async (item) => {
        let products = await getAllOrdersWithProdutsByID(item.order_id);
        //console.log(products);
        return { ...item, products: products.products };
      })
    );
    const reult = { sucess: true, orders: updatedOrders };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// products tikath ekka id eken ganna thmai mehema gahuwe  ---
export async function getAllOrdersWithProdutsByID(id) {
  try {
    const order = await pool.query(
      "SELECT * FROM cust_order as orders WHERE orders.order_id = ?",
      [id]
    );
    let result;
    let productArr;
    if (order[0].length > 0) {
      const res = await getOrderItemsById(id);
      if (res.success) {
        productArr = res.products;
      }
      result = { sucess: true, order: order[0][0], products: productArr };
    } else {
      result = { sucess: false, order: order[0] };
    }
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
