## 🍕 Pizza Sales Analysis

An end-to-end Business Intelligence project using SQL Server and Power BI to analyze pizza sales and generate actionable business insights.

## 📌 Project Overview

This project analyzes one year of pizza sales transactions to evaluate business performance, identify customer purchasing patterns, and provide recommendations for improving sales and profitability.
The project demonstrates the complete data analysis workflow, including data cleaning, SQL analysis, KPI development, DAX measures, and interactive dashboard creation.

## 🎯 Business Objectives

1. Measure overall sales performance.  
2. Identify peak sales periods.  
3. Analyze product performance.  
4. Evaluate customer ordering behavior.  
5. Support business decisions using data.  

##  🛠 Tools Used

1. Excel
2. MS SQL Server
3. Power Bi
4. DAX

  [Dataset used](https://1drv.ms/x/s!AmKU00K1sOXkiXYGCmYAQfrCOGMJ?e=lz8diP](https://drive.google.com/file/d/11-6ahyMHzXEZr5qcQKP3x2fh_KgG1jpQ/view?usp=sharing))  

  [SQL Anaylsis](https://github.com/Omar-Elgazzar5923/Pizza_Sales_Anaylsis_Project/blob/main/SQL%20Anaylsis.sql)  

  [Project Dashboard](https://drive.google.com/file/d/13IyPZSsyy5lR7JjYbZ5pIVY6B11mgSd-/view?usp=sharing)   

## 📈 Key Insights

1. Friday recorded the highest number of orders.  
2. Large pizzas generated the highest revenue.  
3. Classic pizzas accounted for the largest share of total sales.  
4. A small number of pizzas generated most of the revenue.  
5. Afternoon and evening represented peak ordering hours.

## 💻 SQL Execution

1) Total Revenue :
   ```sql
    SELECT ROUND(SUM(total_price),2) AS Total_Revenue FROM pizza_sales;
   ```
     ![image](https://github.com/Omar-Elgazzar5923/Pizza_Sales_Anaylsis_Project/blob/main/Total%20Revenue.png)

2) Total Orders :
   ```sql
    SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;
   ```
     ![image](https://github.com/Omar-Elgazzar5923/Pizza_Sales_Anaylsis_Project/blob/main/Total%20Orders.png)
   
3) Total Pizzas Sold :
   ```sql
    SELECT SUM(quantity) as Total_Pizzas_Sold FROM pizza_sales;
	```
     ![image](https://github.com/Omar-Elgazzar5923/Pizza_Sales_Anaylsis_Project/blob/main/Total%20Pizzas%20Sold.png)
   
4) Daily Orders And Sales :
   ```sql
    SELECT DATENAME(DW,order_date) AS Day_Name,
    COUNT(DISTINCT order_id) AS Total_Orders,
    ROUND(SUM(total_price),2) AS Total_Revenue
    FROM pizza_sales
    GROUP BY DATENAME(DW,order_date)
    ORDER BY Total_Orders DESC;
	```
     ![image](https://github.com/Omar-Elgazzar5923/Pizza_Sales_Anaylsis_Project/blob/main/Daily%20Orders%20And%20Sales.png) 
   
5) Trend Hours By Orders :
   ```sql
    SELECT DATEPART(HOUR, order_time) AS Hour_Timing,
    COUNT(DISTINCT order_id) AS total_orders
    FROM pizza_sales
    GROUP BY DATEPART(HOUR, order_time)
    ORDER BY total_orders DESC;
   ```
     ![image](https://github.com/Omar-Elgazzar5923/Pizza_Sales_Anaylsis_Project/blob/main/Trend%20Hours%20By%20Orders.png)
   
6) % of Sales By Pizza Category :
    ```sql
    SELECT pizza_category ,
    ROUND(SUM(total_price),2) AS Total_Revenue ,
    ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2)
    AS Percentage_Value
    FROM pizza_sales
    GROUP BY pizza_category
    ORDER BY Percentage_Value DESC;
    ```
     ![image](https://github.com/Omar-Elgazzar5923/Pizza_Sales_Anaylsis_Project/blob/main/%25%20of%20Sales%20By%20Pizza%20Category.png)

## 🔗 Connect With Me

[LinkedIn](https://www.linkedin.com/in/omar-adel-0839683a5/)  
[GitHub](https://github.com/Omar-Elgazzar5923)  
