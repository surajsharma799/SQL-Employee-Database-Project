CREATE DATABASE retail_sales;
use retail_sales;

select * from sales_data;

SELECT city, postal_code, category, sales, profit 
FROM sales_data;

SELECT DISTINCT category 
FROM sales_data;

SELECT * FROM sales_data 
WHERE sales > 5000;

SELECT * FROM sales_data 
WHERE category = 'Furniture' AND sales > 3000;

SELECT category, quantity 
FROM sales_data
WHERE category = 'Technology' OR category = 'Furniture';

SELECT * FROM sales_data 
WHERE sales BETWEEN 5000 AND 20000;

SELECT * FROM sales_data 
WHERE city IN ('Henderson', 'Los Angeles', 'San Francisco');

SELECT * FROM sales_data 
WHERE state LIKE 'C__i%a';

SELECT * FROM sales_data 
ORDER BY sales ASC;

SELECT * FROM sales_data 
ORDER BY profit DESC;

SELECT * FROM sales_data 
ORDER BY sales DESC LIMIT 10;

SELECT COUNT(*) AS total_transactions 
FROM sales_data;

SELECT SUM(sales) AS total_sales 
FROM sales_data;

SELECT AVG(sales) AS average_sales 
FROM sales_data;

SELECT MIN(sales) AS minimum_sales, MAX(sales) AS maximum_sales
FROM sales_data;

SELECT category, SUM(sales) AS total_sales 
FROM sales_data 
GROUP BY category;

SELECT city, SUM(profit) AS total_profit 
FROM sales_data 
GROUP BY city;

SELECT category, SUM(sales) AS total_sales 
FROM sales_data 
GROUP BY category 
HAVING SUM(sales) > 100000;

SELECT * FROM sales_data 
WHERE sales > (SELECT AVG(sales) 
FROM sales_data);

SELECT * FROM sales_data 
WHERE sales = (SELECT MAX(sales) 
FROM sales_data);

CREATE TABLE product_summary AS
SELECT DISTINCT sub_category, category
FROM sales_data;

SELECT * FROM product_summary;

SELECT T1.sub_category, T1.category, T2.category
FROM sales_data T1
INNER JOIN product_summary T2
ON T1.sub_category = T2.sub_category;

SELECT T1.sub_category, T1.category, T2.category
FROM sales_data T1
LEFT OUTER JOIN product_summary T2
ON T1.sub_category = T2.sub_category;

SELECT T1.sub_category, T1.category, T2.category
FROM sales_data T1
RIGHT OUTER JOIN product_summary T2
ON T1.sub_category = T2.sub_category;

SELECT sales_data.sub_category, product_summary.category
FROM sales_data
CROSS JOIN product_summary;

SELECT T1.sub_category, T1.category,
       T2.sub_category, T2.category
FROM sales_data T1
JOIN sales_data T2
ON T1.category = T2.category
WHERE T1.sub_category < T2.sub_category;

CREATE TABLE category_summary AS
SELECT category,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       AVG(sales) AS average_sales
FROM sales_data
GROUP BY category;

SELECT * FROM category_summary;
-- 




