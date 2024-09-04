
##Supply Chain Management System (SCMS)

Overview

The Supply Chain Management System (SCMS) is a comprehensive solution designed to manage the distribution of products from the company's factory in Kandy to customers across the island. Utilizing the railway system for transportation to major cities and trucks for final deliveries, the SCMS efficiently handles order management, scheduling, and reporting, ensuring smooth operations from factory to customer.

Features

Core Functions:
- Registration and Login: Secure authentication for various user roles.
- Order Management: Efficient handling of customer orders from placement to delivery.
- Train Scheduling: Coordination of product transportation via the railway system.
- Route Management and Truck Scheduling: Optimization of delivery routes and schedules.
- Driver and Driver Assistant Assignments: Allocation of drivers and assistants for deliveries.
- Reporting: Generation of reports for management to monitor and analyze system performance.

 User Roles:
- Customers: (Wholesalers, Retailers, End Customers) 
  - Create user profiles.
  - Place and view orders.
- Logistic Coordinators: 
  - Allocate orders to trains and trucks.
  - Assign drivers and driver assistants.
- System Administrators: 
  - Review reports.
  - View orders and logistics coordinators' activities.

Technical Specifications

 Frontend:
- ReactJS: 
  - Manages the frontend of the SCMS.
  - Ensures a responsive and user-friendly web interface.
  - Utilizes both default and custom libraries for UI development.

 Backend:
- NodeJS:
  - Powers the backend with its fast runtime environment.
  - ExpressJS: Manages the backend logic and API handling for the web application.

 Database:
- MySQL: 
  - Serves as the primary data storage.
  - Hosted on a local server.
  - Integrated with the backend using appropriate libraries for query management.

System Requirements
- Browser: Google Chrome or any other standard web browser.
- Database: MySQL hosted on a local server.

Use Cases

 Admin:
- Review system-generated reports.
- View and manage orders.
- Oversee the activities of logistic coordinators.

 Logistic Coordinator:
- Allocate orders for transportation via trains and trucks.
- Assign drivers and driver assistants for deliveries.

 Customer:
- Create and manage user profiles.
- Place orders and track order status.

Installation and Setup

1.Clone the Repositor:
   ```bash
   git clone <repository-url>
   ```
2.Install Dependencie:
   ```bash
   npm install
   ```
3.Set Up Databas:
   - Ensure MySQL is installed and running.
   - Import the SQL dump provided in the repository to set up the database schema:
     ```bash
     mysql -u your_username -p your_database_name < path_to_sql_dump.sql
     ```
   - Replace `your_username`, `your_database_name`, and `path_to_sql_dump.sql` with your MySQL username, the name of the database you want to create, and the path to the SQL dump file, respectively.

4.Configure Environment Variable:
   - The repository includes a `.env` file for configuration. Make sure it is correctly set up with the necessary environment variables such as database credentials and API keys.

5.Run the Applicatio:
   ```bash
   npm start
   ```
