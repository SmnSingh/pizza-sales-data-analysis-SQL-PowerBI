-- Q1 What is the total revenue ?
SELECT SUM(total_price) AS Total_Revenue 
FROM pizza_sales_data;

-- Q2 What is the Average Order Value ?
SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS Avg_Order_Value 
FROM pizza_sales_data;

-- Q3 What is the total number of Pizzas sold ?
SELECT SUM(quantity) AS Total_pizzas_sold
FROM pizza_sales_data;

-- Q4 What is the total number of Orders placed ?
SELECT COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales_data;

-- Q5 What is the Average Pizzas per Order ?
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) 
AS Avg_Pizza_per_order
FROM pizza_sales_data;

-- Q6 What is the Daily Trend for total Order ?
SELECT TO_CHAR(order_date,'Day') AS order_day,
COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales_data
GROUP BY TO_CHAR(order_date,'Day');

-- Q7 What is the Monthly Trend for total Order ?
SELECT TO_CHAR(order_date,'Month') AS Month_name,
COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales_data
GROUP BY TO_CHAR(order_date,'Month')
order by total_orders desc;

-- Q8 What is the percentage of sales by pizza category ?
SELECT pizza_category, SUM(total_price)*100 /
(SELECT SUM(total_price) FROM pizza_sales_data AS PCT)
FROM pizza_sales_data 
GROUP BY pizza_category;

-- Q9 What is the percentage of sales by pizza size ?
SELECT pizza_size, SUM(total_price)*100 /
(SELECT SUM(total_price) FROM pizza_sales_data AS PCT)
FROM pizza_sales_data 
GROUP BY pizza_size;

-- Q10 Top 5 best sellers ?
SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Q11 Bottom 5 sellers ?
SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_Revenue 
LIMIT 5;






