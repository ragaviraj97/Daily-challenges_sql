-- 1️.Create Database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- 2️.Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- 3️.Create Sales Table

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 4️.Insert Sample Data into Product Table
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

-- 5️.Insert Sample Data into Sales Table
INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);
select * from Sales;
-- 1. order by --
select  product_id,product_name,price from Product order by price desc limit 3;
-- 2. summery statistics--
-- COUNT--
select count(*) from Sales;
-- SUM--
select sum(sale_amount) as total_sales from Sales;
-- average--
select ROUND(avg(sale_amount)) as average_amount from Sales;
-- MAXIMUM--
select max(sale_amount) as Highest_sales from Sales;
-- MINIMUM--
select min(sale_amount) as Lowest_sales from Sales;
-- GROUP BY AND HAVING--
select product_id, sum(sale_amount) as total_sales from Sales
GROUP BY product_id
HAVING sum(sale_amount) > 100;

SELECT p.product_name, 
       SUM(s.sale_amount) AS total_sales
FROM Sales s
INNER JOIN Product p 
    ON s.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(s.sale_amount) > 100;

-- WINDOWS FUNCTION --
-- RANK--
select product_id,product_name,row_number()over(order by price) as row_num from Product;
-- DENSE RANK --
select product_id,product_name,rank() over (order by price desc) as rank_price from Product;













