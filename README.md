
# Data Digger — MySQL Database Project

## About the Project

Data Digger is a beginner-friendly MySQL database project designed to practice SQL queries and database management. The project manages customer information, orders, product details, and order details. It demonstrates how SQL can be used to store, retrieve, update, delete, and analyze data.

## Database Structure

The project uses the `data_digger` database, which contains four tables:

- **Customers:** Stores customer IDs, names, email addresses, and addresses.
- **Orders:** Stores order IDs, customer IDs, order dates, and total amounts.
- **Products:** Stores product IDs, product names, prices, and stock quantities.
- **OrderDetails:** Stores order detail IDs, order IDs, product IDs, quantities, and subtotals.

## SQL Concepts Covered

- Database creation and selection
- Table creation
- Primary keys and foreign keys
- AUTO_INCREMENT and NOT NULL constraints
- INSERT, SELECT, UPDATE, and DELETE statements
- WHERE conditions and filtering
- ORDER BY and LIMIT
- BETWEEN operator
- Date filtering using CURRENT_DATE and INTERVAL
- Aggregate functions: MAX(), MIN(), AVG(), SUM(), and COUNT()
- GROUP BY
- Sales and product quantity analysis

## Project Features

- Manage customer records.
- Store and retrieve customer orders.
- Maintain product information and stock quantities.
- Update customer addresses and product prices.
- Filter orders by customer and date.
- Calculate total revenue from order details.
- Find the highest, lowest, and average order amounts.
- Identify the most frequently sold products.

## Example SQL Queries

### 1. Calculate Total Revenue

```sql
SELECT SUM(SubTotal) AS Total_Revenue
FROM OrderDetails;
```

### 2. Find the Highest and Lowest Product Prices

```sql
SELECT
    MAX(Price) AS Expensive_Product,
    MIN(Price) AS Cheapest_Product
FROM Products;
```

### 3. Find the Top Three Products by Quantity Sold

```sql
SELECT ProductID, SUM(Quantity) AS Total_Quantity_Sold
FROM OrderDetails
GROUP BY ProductID
ORDER BY Total_Quantity_Sold DESC
LIMIT 3;
```

### 4. Retrieve Orders from the Last 30 Days

```sql
SELECT *
FROM Orders
WHERE Order_Date >= CURRENT_DATE - INTERVAL 30 DAY;
```

## Technologies Used

- **Database:** MySQL
- **SQL Client:** MySQL Server / MySQL Workbench
- **Language:** SQL

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Connect to your MySQL Server.
3. Open the `data_digger.sql` file in MySQL Workbench.
4. Execute the SQL statements in the correct order.
5. Run the SELECT queries to view the results.

**Note:** The script begins with `DROP DATABASE IF EXISTS data_digger;`. Executing it will delete the existing database with that name and recreate it. Back up any important data before running the script.

The provided SQL file also contains MySQL terminal prompts and query outputs. Remove these prompts and outputs before executing the file as a SQL script.

## Learning Outcomes

This project provides practical experience in relational database design, data manipulation, filtering, aggregation, and basic sales analysis using MySQL.


