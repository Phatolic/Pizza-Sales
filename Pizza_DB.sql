CREATE DATABASE Pizza_DB
SELECT * FROM [pizza_sales ]

--KPI
--1. Total Revenue: The sum of the total price of all pizza orders.
SELECT sum(total_price) AS Total_Revenue
FROM [pizza_sales ]

--2. Average Order Value: The average amount spent per order, calculated by dividing the total revenue by the total number of orders.
SELECT SUM(total_price) / COUNT (DISTINCT order_id) AS Average_per_Order
FROM [pizza_sales ]

--3. Total Pizzas Sold: The sum of the quantities of all pizzas sold.
SELECT sum(quantity) AS Total_Pizzas_Sold
from [pizza_sales ]

--4. Total Orders: The total number of orders placed.
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM [pizza_sales ]

--5. Average Pizzas Per Order: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.
SELECT CAST(CAST(SUM(quantity) AS decimal (10,2)) / CAST(COUNT(DISTINCT order_id) AS decimal (10,2)) AS DECIMAL(10,2)) AS Avg_Pizza_per_Order
FROM [pizza_sales ]

--CHARTS
--1. Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) as order_day,COUNT(DISTINCT order_id) AS Total_Orders
FROM [pizza_sales ]
GROUP BY DATENAME(DW, order_date)

--2. Hourly Trend for Total Orders
SELECT DATEPART(HOUR, order_time) as order_hour,COUNT(DISTINCT order_id) AS Total_Orders
FROM [pizza_sales ]
GROUP BY DATEPART(HOUR, order_time)

--3. Percentage of Sales by Pizza Category
SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM [pizza_sales ]) AS Percentage_of_Sales
FROM [pizza_sales ]
GROUP BY pizza_category

--4. Percentage of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS decimal(10,2)) AS Total_Sales, 
        CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM [pizza_sales ]) AS decimal (10,2))AS Percentage_of_Sales
FROM [pizza_sales ]
GROUP BY pizza_size

--5.Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Pizzas_Sold
FROM [pizza_sales ]
GROUP BY pizza_category

--Top 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM [pizza_sales ]
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC

---7. Bottom 5 Worst Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM [pizza_sales ]
GROUP BY pizza_name
ORDER BY SUM(quantity) 



