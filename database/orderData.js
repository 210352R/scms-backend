import { pool } from "./database.js";
import { getProductCapacityById } from "./productData.js";

// Orders okkogemaa okkoma data tika eliyata ganna wa---
export async function getAllOrders() {
  try {
    const orders = await pool.query("SELECT * FROM cust_order");
    const updateOrders = orders[0].map((order) => {
      const orderDate = order.date;
      const year = orderDate.getFullYear();
      const month = String(orderDate.getMonth() + 1).padStart(2, "0"); // Zero-pad the month.
      const day = String(orderDate.getDate()).padStart(2, "0"); // Zero-pad the day.
      const orderDateString = `${year}-${month}-${day}`;
      return { ...order, date: orderDateString };
    });
    const reult = { sucess: true, orders: updateOrders };
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
      "SELECT o.product_id ,p.name ,p.capacity, o.quantity , o.sent_quantity  FROM order_product_list as o INNER JOIN product as p ON p.product_id = o.product_id WHERE order_id = ?",
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
      "select order_id, date , customer_id ,  delivery_address , o.route_id ,state , store_id from cust_order as o INNER JOIN route as r ON o. route_id = r.route_id"
    );
    // orders[0].map(async (item) => {
    //   let products = await getAllOrdersWithProdutsByID(item.order_id);
    //   console.log(products);
    //   return (item = { ...item, products: products.products });
    // });
    const updatedOrders = await Promise.all(
      orders[0].map(async (item) => {
        const orderDate = item.date;
        const year = orderDate.getFullYear();
        const month = String(orderDate.getMonth() + 1).padStart(2, "0"); // Zero-pad the month.
        const day = String(orderDate.getDate()).padStart(2, "0"); // Zero-pad the day.
        const orderDateString = `${year}-${month}-${day}`;
        let products = await getAllOrdersWithProdutsByID(item.order_id);
        //console.log(products);
        return { ...item, date: orderDateString, products: products.products };
      })
    );
    const reult = { sucess: true, orders: updatedOrders };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// get Only new orders and progress orders

export async function getAllNewOrdersWithProduts() {
  try {
    const orders = await pool.query(
      "select order_id, date , customer_id ,  delivery_address , o.route_id ,state , store_id from cust_order as o INNER JOIN route as r ON o. route_id = r.route_id Where state = 'new' OR state = 'progress' ORDER BY state DESC , date ASC"
    );
    // orders[0].map(async (item) => {
    //   let products = await getAllOrdersWithProdutsByID(item.order_id);
    //   console.log(products);
    //   return (item = { ...item, products: products.products });
    // });
    const updatedOrders = await Promise.all(
      orders[0].map(async (item) => {
        const orderDate = item.date;
        const year = orderDate.getFullYear();
        const month = String(orderDate.getMonth() + 1).padStart(2, "0"); // Zero-pad the month.
        const day = String(orderDate.getDate()).padStart(2, "0"); // Zero-pad the day.
        const orderDateString = `${year}-${month}-${day}`;
        let products = await getAllOrdersWithProdutsByID(item.order_id);
        //console.log(products);
        return { ...item, date: orderDateString, products: products.products };
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
      "SELECT * FROM cust_order as orders  WHERE orders.order_id = ?",
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

export async function addOrderProductsByArray(order_id, products) {
  try {
    const query =
      "INSERT INTO order_product_list (order_id, product_id, quantity, sent_quantity) VALUES (?, ?, ?, 0)";
    products.map(async (product) => {
      const result = await pool.query(query, [
        order_id,
        product.product_id,
        product.quantity,
      ]);
      console.log("Added -- ", product.product_id);
    });
  } catch (err) {
    console.log(err);
    return err;
  }
}

export async function addOrder({
  customer_id,
  delivery_address,
  route_id,
  state,
  products, // list
}) {
  try {
    const currentDate = new Date();
    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, "0"); // Zero-pad the month.
    const day = String(currentDate.getDate()).padStart(2, "0"); // Zero-pad the day.

    const hours = String(currentDate.getHours()).padStart(2, "0"); // Zero-pad the hours.
    const minutes = String(currentDate.getMinutes()).padStart(2, "0"); // Zero-pad the minutes.
    const seconds = String(currentDate.getSeconds()).padStart(2, "0"); // Zero-pad the seconds.

    const dateTimeString = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;

    // const query = await pool.query(
    //   "INSERT INTO cust_order (date, customer_id, delivery_address, route_id, state) VALUES (?, ?, ?, ?, ?)",
    //   [dateTimeString, customer_id, delivery_address, route_id, state]
    // );
    // const order_id_Data = await pool.query(
    //   "select order_id from cust_order where date = ? AND customer_id = ? AND delivery_address = ? AND route_id = ?",
    //   [dateTimeString, customer_id, delivery_address, route_id]
    // );
    //console.log("orderID : ", order_id_Data[0][0].order_id);
    // let order_id = order_id_Data[0][0].order_id;
    //await addOrderProductsByArray(order_id , products);
    //return { sucess: true };

    const connection = await pool.getConnection();

    try {
      // Begin a transaction
      await connection.beginTransaction();

      // Query 1
      await connection.query(
        "INSERT INTO cust_order (date, customer_id, delivery_address, route_id, state) VALUES (?, ?, ?, ?, ?)",
        [dateTimeString, customer_id, delivery_address, route_id, state]
      );

      // Query 2
      const order_id_Data = await connection.query(
        "select order_id from cust_order where date = ? AND customer_id = ? AND delivery_address = ? AND route_id = ?",
        [dateTimeString, customer_id, delivery_address, route_id]
      );
      console.log("orderID : ", order_id_Data[0][0].order_id);
      let order_id = order_id_Data[0][0].order_id;
      await addOrderProductsByArray(order_id, products);

      // Commit the transaction
      await connection.commit();
      console.log("Both queries executed successfully.");
      return { sucess: true };
    } catch (error) {
      // If an error occurs, roll back the transaction
      await connection.rollback();
      console.error("Error executing queries:", error);
    } finally {
      // Release the connection back to the pool
      connection.release();
    }
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// products tikath ekka id eken ganna thmai mehema gahuwe  ---
export async function getAllOrdersWithProdutsByCustID(id) {
  try {
    const order = await pool.query(
      " select order_id, date , customer_id ,  delivery_address , o.route_id ,state , store_id from cust_order as o INNER JOIN route as r ON o. route_id = r.route_id where customer_id=?",
      [id]
    );
    let result;
    let productArr;
    console.log("ORDER : ", order);
    if (order[0].length > 0) {
      const updatedOrders = await Promise.all(
        order[0].map(async (item) => {
          let products = await getAllOrdersWithProdutsByID(item.order_id);
          //console.log(products);
          return { ...item, products: products.products };
        })
      );
      console.log("UPDATED ORDERS : ", updatedOrders);
      result = { sucess: true, orders: updatedOrders };
    } else {
      result = { sucess: false, order: order[0] };
    }
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// export async function getOrdersWithNetCapacity(productsArray) {
//   let netCapacity = 0;
//   //const res = await getAllOrdersWithProduts();
//   //const productArray = res.orders[0].products;
//   const productArray = productsArray;
//   //console.log("Products Array ---------------: ", productArray);
//   if (productArray === undefined) {
//     return 0;
//   }

//   for (let i = 0; i < productArray?.length; i++) {
//     //console.log(`Element at index ${i}: ${productArray[i].product_id}`);
//     const capacity = (await getProductCapacityById(productArray[i].product_id))
//       .productCapacity.capacity;
//     //console.log("Capacity : ", capacity);
//     const quantity = productArray[i].quantity;
//     const totCapacity = capacity * quantity;
//     netCapacity = netCapacity + totCapacity;
//   }
//   //console.log("Net Capacity : ", netCapacity);
//   return netCapacity;
// }

export async function getOrdersWithNetCapacity(orderId) {
  try {
    const netCapacity = await pool.query(
      "select sum((ao.quantity - ao.sent_quantity)*ao.capacity) as totQunatity from  AllOrderDetails as ao where ao.order_id = ? group by ao.order_id;",
      [orderId]
    );
    return netCapacity[0][0].totQunatity;
  } catch (err) {
    return { sucess: false, err: err };
  }
  //console.log("Net Capacity : ", netCapacity);
}

//getAllOrdersWithProduts with net capacity -----------------------------

export async function getAllNewOrdersWithProdutsAndNetCapacity() {
  try {
    // orders[0].map(async (item) => {
    //   let products = await getAllOrdersWithProdutsByID(item.order_id);
    //   console.log(products);
    //   return (item = { ...item, products: products.products });
    // });
    const res = await getAllNewOrdersWithProduts();
    //console.log("Orders ----- : ", res.orders);
    const orders = res.orders;
    const updatedOrders = await Promise.all(
      orders.map(async (item) => {
        let netCapacity = 0;

        if (item.products === undefined) {
          netCapacity = 0;
        } else {
          netCapacity = await getOrdersWithNetCapacity(item.order_id);
        }
        //console.log(products);
        // console.log("Net Capacity ----------------: ", netCapacity);
        return { ...item, netCapacity: netCapacity };
      })
    );
    const reult = { sucess: true, orders: updatedOrders };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getAllNewOrdersWithProdutsAndCapacityAndNetCapacity() {
  try {
    // orders[0].map(async (item) => {
    //   let products = await getAllOrdersWithProdutsByID(item.order_id);
    //   console.log(products);
    //   return (item = { ...item, products: products.products });
    // });
    const res = await getAllNewOrdersWithProduts();
    //console.log("Orders ----- : ", res.orders);
    const orders = res.orders;
    const updatedOrders = await Promise.all(
      orders.map(async (item) => {
        let netCapacity = 0;

        if (item.products === undefined) {
          netCapacity = 0;
        } else {
          netCapacity = await getOrdersWithNetCapacity(item.order_id);
        }
        //console.log(products);
        // console.log("Net Capacity ----------------: ", netCapacity);
        return { ...item, netCapacity: netCapacity };
      })
    );
    const reult = { sucess: true, orders: updatedOrders };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
