drop database if exists data_digger;
Query OK, 1 row affected (0.226 sec)

mysql> create database Data_digger;
Query OK, 1 row affected (0.061 sec)

mysql> use data_digger;
Database changed
mysql> create table customers(
    -> CustomerID int primary key auto_increment,
    -> Name Varchar(50) not null,
    -> Email varchar(50) not null,
    -> address varchar(100) not null
    -> );
Query OK, 0 rows affected (0.190 sec)

mysql> -- inserting values into the table
Query OK, 0 rows affected (0.004 sec)

mysql> insert into customers(Name, email, address)values
    -> ('Rohan', 'rohan@gmail.com', 'Ahmedabad'),
    -> ('Mihir', 'mihir@gmail.com', 'Surat'),
    -> ('Kunal', 'kunal@gmail.com', 'Vadodara'),
    -> ('Pooja', 'pooja@gmail.com', 'Mumbai'),
    -> ('Nikhil', 'nikhil@gmail.com', 'Pune');
Query OK, 5 rows affected (0.064 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from customers;
+------------+--------+------------------+-----------+
| CustomerID | Name   | Email            | address   |
+------------+--------+------------------+-----------+
|          1 | Rohan  | rohan@gmail.com  | Ahmedabad |
|          2 | Mihir  | mihir@gmail.com  | Surat     |
|          3 | Kunal  | kunal@gmail.com  | Vadodara  |
|          4 | Pooja  | pooja@gmail.com  | Mumbai    |
|          5 | Nikhil | nikhil@gmail.com | Pune      |
+------------+--------+------------------+-----------+
5 rows in set (0.014 sec)

mysql> update customers
    -> set address = 'parola'
    -> where customerID = '2';
Query OK, 1 row affected (0.051 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customers;
+------------+--------+------------------+-----------+
| CustomerID | Name   | Email            | address   |
+------------+--------+------------------+-----------+
|          1 | Rohan  | rohan@gmail.com  | Ahmedabad |
|          2 | Mihir  | mihir@gmail.com  | parola    |
|          3 | Kunal  | kunal@gmail.com  | Vadodara  |
|          4 | Pooja  | pooja@gmail.com  | Mumbai    |
|          5 | Nikhil | nikhil@gmail.com | Pune      |
+------------+--------+------------------+-----------+
5 rows in set (0.009 sec)

mysql> delete from customers where customerID = "1";
Query OK, 1 row affected (0.048 sec)

mysql> select * from customers;
+------------+--------+------------------+----------+
| CustomerID | Name   | Email            | address  |
+------------+--------+------------------+----------+
|          2 | Mihir  | mihir@gmail.com  | parola   |
|          3 | Kunal  | kunal@gmail.com  | Vadodara |
|          4 | Pooja  | pooja@gmail.com  | Mumbai   |
|          5 | Nikhil | nikhil@gmail.com | Pune     |
+------------+--------+------------------+----------+
4 rows in set (0.036 sec)

mysql> select * from customers where name = "pooja";
+------------+-------+-----------------+---------+
| CustomerID | Name  | Email           | address |
+------------+-------+-----------------+---------+
|          4 | Pooja | pooja@gmail.com | Mumbai  |
+------------+-------+-----------------+---------+
1 row in set (0.011 sec)

mysql> create table orders(
    -> orderID int primary key auto_increment,
    -> customerID int not null,
    -> foreign key(customerID) references customers(customerID),
    -> order_date Date not null,
    -> Total_amount decimal(10,2)
    -> );
Query OK, 0 rows affected (0.277 sec)

mysql> INSERT INTO Orders(orderID, customerID, order_date, Total_amount)
    -> VALUES
    -> (101, 3, '2026-09-25', 1500.00),
    -> (102, 2, '2026-09-20', 2200.00),
    -> (103, 3, '2026-09-15', 800.00),
    -> (104, 2, '2026-09-10', 1200.00),
    -> (105, 4, '2026-08-10', 2500.00);
Query OK, 5 rows affected (0.098 sec)
Records: 5  Duplicates: 0  Warnings: 0


mysql> select * from orders;
+---------+------------+------------+--------------+
| orderID | customerID | order_date | Total_amount |
+---------+------------+------------+--------------+
|     101 |          3 | 2026-09-25 |      1500.00 |
|     102 |          2 | 2026-09-20 |      2200.00 |
|     103 |          3 | 2026-09-15 |       800.00 |
|     104 |          2 | 2026-09-10 |      1200.00 |
|     105 |          4 | 2026-08-10 |      2500.00 |
+---------+------------+------------+--------------+
5 rows in set (0.009 sec)

mysql>
mysql> SELECT *
    -> FROM Orders
    -> WHERE CustomerID = 2;
+---------+------------+------------+--------------+
| orderID | customerID | order_date | Total_amount |
+---------+------------+------------+--------------+
|     102 |          2 | 2026-09-20 |      2200.00 |
|     104 |          2 | 2026-09-10 |      1200.00 |
+---------+------------+------------+--------------+
2 rows in set (0.013 sec)

mysql> UPDATE Orders
    -> SET Total_Amount = 57000.00
    -> WHERE OrderID = 104;
Query OK, 1 row affected (0.065 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from orders;select * from orders;
+---------+------------+------------+--------------+
| orderID | customerID | order_date | Total_amount |
+---------+------------+------------+--------------+
|     101 |          3 | 2026-09-25 |      1500.00 |
|     102 |          2 | 2026-09-20 |      2200.00 |
|     103 |          3 | 2026-09-15 |       800.00 |
|     104 |          2 | 2026-09-10 |     57000.00 |
|     105 |          4 | 2026-08-10 |      2500.00 |
+---------+------------+------------+--------------+
5 rows in set (0.010 sec)

+---------+------------+------------+--------------+
| orderID | customerID | order_date | Total_amount |
+---------+------------+------------+--------------+
|     101 |          3 | 2026-09-25 |      1500.00 |
|     102 |          2 | 2026-09-20 |      2200.00 |
|     103 |          3 | 2026-09-15 |       800.00 |
|     104 |          2 | 2026-09-10 |     57000.00 |
|     105 |          4 | 2026-08-10 |      2500.00 |
+---------+------------+------------+--------------+
5 rows in set (0.005 sec)

mysql> DELETE FROM Orders
    -> WHERE OrderID = 5;
Query OK, 0 rows affected (0.004 sec)

mysql> select * from orders;
+---------+------------+------------+--------------+
| orderID | customerID | order_date | Total_amount |
+---------+------------+------------+--------------+
|     101 |          3 | 2026-09-25 |      1500.00 |
|     102 |          2 | 2026-09-20 |      2200.00 |
|     103 |          3 | 2026-09-15 |       800.00 |
|     104 |          2 | 2026-09-10 |     57000.00 |
|     105 |          4 | 2026-08-10 |      2500.00 |
+---------+------------+------------+--------------+
5 rows in set (0.007 sec)

mysql> SELECT *
    -> FROM Orders
    -> WHERE Order_Date >= CURRENT_DATE - INTERVAL 30 DAY;
+---------+------------+------------+--------------+
| orderID | customerID | order_date | Total_amount |
+---------+------------+------------+--------------+
|     101 |          3 | 2026-09-25 |      1500.00 |
|     102 |          2 | 2026-09-20 |      2200.00 |
|     103 |          3 | 2026-09-15 |       800.00 |
+---------+------------+------------+--------------+
3 rows in set (0.005 sec)

mysql> SELECT
    -> MAX(Total_Amount) AS Highest_Order_Amount,
    -> MIN(Total_Amount) AS Lowest_Order_Amount,
    -> AVG(Total_Amount) AS Average_Order_Amount
    -> FROM Orders;
+----------------------+---------------------+----------------------+
| Highest_Order_Amount | Lowest_Order_Amount | Average_Order_Amount |
+----------------------+---------------------+----------------------+
|             57000.00 |              800.00 |         12800.000000 |
+----------------------+---------------------+----------------------+
1 row in set (0.006 sec)

mysql> create table Products (
    -> ProductID INT PRIMARY KEY,
    -> ProductName VARCHAR(100) NOT NULL,
    -> Price DECIMAL(10,2),
    -> Stock INT
    -> );
Query OK, 0 rows affected (0.208 sec)

mysql> INSERT INTO Products
    -> (ProductID, ProductName, Price, Stock)
    -> VALUES
    -> (201, 'Laptop', 55000.00, 57),
    -> (202, 'RAM', 25000.00, 35),
    -> (203, 'Graphics card', 1500.00, 15),
    -> (204, 'Keyboard', 1200.00, 78),
    -> (205, 'Mouse', 800.00, 0);
Query OK, 5 rows affected (0.068 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Products ORDER BY Price DESC;
+-----------+---------------+----------+-------+
| ProductID | ProductName   | Price    | Stock |
+-----------+---------------+----------+-------+
|       201 | Laptop        | 55000.00 |    57 |
|       202 | RAM           | 25000.00 |    35 |
|       203 | Graphics card |  1500.00 |    15 |
|       204 | Keyboard      |  1200.00 |    78 |
|       205 | Mouse         |   800.00 |     0 |
+-----------+---------------+----------+-------+
5 rows in set (0.011 sec)

mysql> UPDATE Products
    -> SET Price = 27000.00
    -> WHERE ProductID = 203;
Query OK, 1 row affected (0.053 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from products;
+-----------+---------------+----------+-------+
| ProductID | ProductName   | Price    | Stock |
+-----------+---------------+----------+-------+
|       201 | Laptop        | 55000.00 |    57 |
|       202 | RAM           | 25000.00 |    35 |
|       203 | Graphics card | 27000.00 |    15 |
|       204 | Keyboard      |  1200.00 |    78 |
|       205 | Mouse         |   800.00 |     0 |
+-----------+---------------+----------+-------+
5 rows in set (0.005 sec)

mysql> SELECT *
    -> FROM Products
    -> WHERE ProductID = 203;
+-----------+---------------+----------+-------+
| ProductID | ProductName   | Price    | Stock |
+-----------+---------------+----------+-------+
|       203 | Graphics card | 27000.00 |    15 |
+-----------+---------------+----------+-------+
1 row in set (0.006 sec)

mysql> DELETE FROM Products
    -> WHERE ProductID = 205
    -> AND Stock = 0;
Query OK, 1 row affected (0.054 sec)

mysql> select * from products;
+-----------+---------------+----------+-------+
| ProductID | ProductName   | Price    | Stock |
+-----------+---------------+----------+-------+
|       201 | Laptop        | 55000.00 |    57 |
|       202 | RAM           | 25000.00 |    35 |
|       203 | Graphics card | 27000.00 |    15 |
|       204 | Keyboard      |  1200.00 |    78 |
+-----------+---------------+----------+-------+
4 rows in set (0.005 sec)

mysql> SELECT *
    -> FROM Products
    -> WHERE Price BETWEEN 500 AND 2000;
+-----------+-------------+---------+-------+
| ProductID | ProductName | Price   | Stock |
+-----------+-------------+---------+-------+
|       204 | Keyboard    | 1200.00 |    78 |
+-----------+-------------+---------+-------+
1 row in set (0.007 sec)

mysql> SELECT
    -> MAX(Price) AS Expe_Product,
    -> MIN(Price) AS cheap_product
    -> FROM Products;
+--------------+---------------+
| Expe_Product | cheap_product |
+--------------+---------------+
|     55000.00 |       1200.00 |
+--------------+---------------+
1 row in set (0.005 sec)

mysql> CREATE TABLE OrderDetails (
    ->     OrderDetailID INT PRIMARY KEY,
    ->     OrderID INT,
    ->     ProductID INT,
    ->     Quantity INT,
    ->     SubTotal DECIMAL(10,2),
    ->     FOREIGN KEY (OrderID)
    ->     REFERENCES Orders(OrderID),
    ->     FOREIGN KEY (ProductID)
    ->     REFERENCES Products(ProductID)
    -> );
Query OK, 0 rows affected (0.272 sec)

mysql> INSERT INTO OrderDetails
    -> (orderDetailID, ProductID, OrderID, Quantity, SubTotal)
    -> VALUES
    -> (401, 204, 101, 3, 3600.00),
    -> (402, 201, 102, 1, 55000.00),
    -> (403, 202, 103, 2, 50000.00),
    -> (404, 204, 104, 2, 2400.00),
    -> (405, 203, 105, 1, 27000.00);
Query OK, 5 rows affected (0.077 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from OrderDetails;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|           401 |     101 |       204 |        3 |  3600.00 |
|           402 |     102 |       201 |        1 | 55000.00 |
|           403 |     103 |       202 |        2 | 50000.00 |
|           404 |     104 |       204 |        2 |  2400.00 |
|           405 |     105 |       203 |        1 | 27000.00 |
+---------------+---------+-----------+----------+----------+
5 rows in set (0.012 sec)

mysql> SELECT *
    -> FROM OrderDetails
    -> WHERE OrderID = 101;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|           401 |     101 |       204 |        3 |  3600.00 |
+---------------+---------+-----------+----------+----------+
1 row in set (0.007 sec)

mysql> SELECT SUM(SubTotal) AS Total_Revenue
    -> FROM OrderDetails;
+---------------+
| Total_Revenue |
+---------------+
|     138000.00 |
+---------------+
1 row in set (0.005 sec)

mysql> SELECT ProductID, SUM(Quantity) AS Total_Quantity_Sold
    -> FROM OrderDetails
    -> GROUP BY ProductID
    -> ORDER BY Total_Quantity_Sold DESC
    -> LIMIT 3;
+-----------+---------------------+
| ProductID | Total_Quantity_Sold |
+-----------+---------------------+
|       204 |                   5 |
|       202 |                   2 |
|       201 |                   1 |
+-----------+---------------------+
3 rows in set (0.015 sec)

mysql> SELECT ProductID, COUNT(*) AS Times_Sold
    -> FROM OrderDetails
    -> WHERE ProductID = 204
    -> GROUP BY ProductID;
+-----------+------------+
| ProductID | Times_Sold |
+-----------+------------+
|       204 |          2 |
+-----------+------------+
1 row in set (0.010 sec)

mysql>
mysql> SELECT * FROM Customers;
+------------+--------+------------------+----------+
| CustomerID | Name   | Email            | address  |
+------------+--------+------------------+----------+
|          2 | Mihir  | mihir@gmail.com  | parola   |
|          3 | Kunal  | kunal@gmail.com  | Vadodara |
|          4 | Pooja  | pooja@gmail.com  | Mumbai   |
|          5 | Nikhil | nikhil@gmail.com | Pune     |
+------------+--------+------------------+----------+
4 rows in set (0.009 sec)

mysql> SELECT * FROM Orders;
+---------+------------+------------+--------------+
| orderID | customerID | order_date | Total_amount |
+---------+------------+------------+--------------+
|     101 |          3 | 2026-09-25 |      1500.00 |
|     102 |          2 | 2026-09-20 |      2200.00 |
|     103 |          3 | 2026-09-15 |       800.00 |
|     104 |          2 | 2026-09-10 |     57000.00 |
|     105 |          4 | 2026-08-10 |      2500.00 |
+---------+------------+------------+--------------+
5 rows in set (0.009 sec)

mysql> SELECT * FROM Products;
+-----------+---------------+----------+-------+
| ProductID | ProductName   | Price    | Stock |
+-----------+---------------+----------+-------+
|       201 | Laptop        | 55000.00 |    57 |
|       202 | RAM           | 25000.00 |    35 |
|       203 | Graphics card | 27000.00 |    15 |
|       204 | Keyboard      |  1200.00 |    78 |
+-----------+---------------+----------+-------+
4 rows in set (0.008 sec)

mysql> SELECT * FROM OrderDetails;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|           401 |     101 |       204 |        3 |  3600.00 |
|           402 |     102 |       201 |        1 | 55000.00 |
|           403 |     103 |       202 |        2 | 50000.00 |
|           404 |     104 |       204 |        2 |  2400.00 |
|           405 |     105 |       203 |        1 | 27000.00 |
+---------------+---------+-----------+----------+----------+
5 rows in set (0.007 sec)
















