import { pool } from "./database.js";

// product id eka dunnama wisthara tika gannawa ---

export async function getRouteByStoreId(id) {
  try {
    const route = await pool.query("select * from route where store_id = ? ", [
      id,
    ]);
    let result;
    if (route[0].length > 0) {
      result = { sucess: true, route: route[0] };
    } else {
      result = { sucess: false, err: "No such route Found !" };
    }
    //const result = { sucess: true, product: product[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

export async function getAllRoutes() {
  try {
    const routes = await pool.query("SELECT * FROM route");
    const reult = { sucess: true, routes: routes[0] };
    return reult;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
