SELECT * FROM pizza_sales;

-- * KPI And Measures *

-- 1.Total Revenue
SELECT ROUND(SUM(total_price),2) AS Total_Revenue FROM pizza_sales;

-- 2.Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- 3.Total Pizzas Sold
SELECT SUM(quantity) as Total_Pizzas_Sold FROM pizza_sales;

-- 4.Avergae Order Value
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id),2)
AS Average_Order_Value
FROM pizza_sales;

-- 5.Average Pizzas Per Order
SELECT ROUND(SUM(quantity) / COUNT(DISTINCT order_id),2)
AS Average_Pizzas_Per_Order
FROM pizza_sales;

-- 6.Average Revenue Per Day
SELECT ROUND(AVG(DailyRevenue),2) AS Average_Revenue_Per_Day
FROM
(
SELECT
order_date,
SUM(total_price) DailyRevenue
FROM pizza_sales
GROUP BY order_date
) AS Average_Revenue;

-- Daily Orders With Ranking And Sales
SELECT DATENAME(DW,order_date) AS Day_Name,
COUNT(DISTINCT order_id) AS Total_Orders,
ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)
ORDER BY Total_Orders DESC;

-- Monthly Orders With Ranking And Sales
SELECT DATENAME(MONTH,order_date) AS Month_Name,
COUNT(DISTINCT order_id) AS Total_Orders,
ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY Total_Orders DESC;

-- Hours Trend By Orders
SELECT DATEPART(HOUR, order_time) AS Hour_Timing,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY total_orders DESC;

-- % Of Sales By Pizza Category
SELECT pizza_category ,
ROUND(SUM(total_price),2) AS Total_Revenue ,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2)
AS Percentage_Value
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Percentage_Value DESC;

-- % of Sales by Pizza Size
SELECT pizza_size ,
ROUND(SUM(total_price),2) AS Total_Revenue ,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2)
AS Percentage_Value
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Percentage_Value DESC;

-- Total Pizzas Sold For Each Category
SELECT pizza_category , SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category;

-- Top 5 Pizzas By Sales
SELECT TOP 5 pizza_name , ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

-- Bottom 5 Pizzas By Sales
SELECT TOP 5 pizza_name , ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;

-- Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

-- Bottom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;

-- Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;

-- Bottom 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;
