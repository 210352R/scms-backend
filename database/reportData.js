import { pool } from "./database.js";

export async function getQuartlaryReport(year) {
  try {
    const res = await pool.query("call scms_db.GetQuarterlyIncome(?)", [year]);
    let result;

    result = { sucess: true, data: res[0][0] };

    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
//

export async function getItemsWithMostSales(year) {
  try {
    const res = await pool.query(
      "SELECT * FROM most_ordered_products where order_year = ? LIMIT 5",
      [year]
    );
    let result;

    result = { sucess: true, data: res[0] };

    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// sales by customer --------------------------------
// select * from cust_order where customer_id = 'Cust000001' AND year(date) = 2023;

export async function getSalesByCustomer(year, customer_id) {
  try {
    const res = await pool.query(
      "select * from cust_order where customer_id = ? AND year(date) = ? ",
      [customer_id, year]
    );
    console.log(res[0]);
    let result;

    result = { sucess: true, data: res[0] };

    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// work hours of trucks --------------
// select * from workhours_trucks where year = 2023;

export async function getWorkHoursOfTrucks(year) {
  try {
    const res = await pool.query(
      "select * from workhours_trucks where year = ? ",
      [year]
    );
    console.log(res[0]);
    let result;

    result = { sucess: true, data: res[0] };

    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// work hours of drivers and a_drivers --------------
// select * from  weeklyworkhours_drivers where year = 2023;
// select * from  weeklyworkhours_a_drivers where year = 2023;

export async function getWorkHoursOfEmployees(year) {
  try {
    const res = await pool.query(
      "SELECT username , type, sum(total_work_hours) as tot_time FROM weeklyworkhours_drivers as wd inner join employee as emp on emp.userName = wd.driver_id where year=?  group by userName Union  All SELECT username , type, sum(total_work_hours) as tot_time FROM weeklyworkhours_a_drivers as wd inner join employee as emp on emp.userName = wd.a_driver_id where year=?  group by userName",
      [year, year]
    );
    console.log(res[0]);
    let result;

    result = { sucess: true, data: res[0] };

    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}

// sales based cities ---------------
// select route_id , sum(tot_price) from route_sales group by route_id ;
// select rs.route_id , count(rs.order_id) as orders , sum(rs.tot_price) as tot_price  from route_sales as rs inner join cust_order as co on rs.order_id = co.order_id where  store_id = 'S002' and year(co.date) = 2023 group by rs.route_id;

export async function getSalesBasedId(year, store_id) {
  try {
    const res = await pool.query(
      "select rs.route_id , count(rs.order_id) as orders , sum(rs.tot_price) as tot_price  from route_sales as rs inner join cust_order as co on rs.order_id = co.order_id where  store_id = ? and year(co.date) = ? group by rs.route_id;",
      [store_id, year]
    );
    console.log(res[0]);
    let result;

    result = { sucess: true, data: res[0] };

    //const result = { sucess: true, customer: customer[0] };
    return result;
  } catch (err) {
    return { sucess: false, err: err };
  }
}
