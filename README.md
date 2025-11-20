🍕 SQL Pizza Analytics Project

A complete SQL exploration and analysis project performed on a pizza sales dataset.
This repository walks through essential SQL concepts—filtering, aggregations, joins, grouping, subqueries, and data cleaning—using real business-driven questions.

📂 Project Overview

The goal of this project is to analyze pizza sales data and derive meaningful insights across three phases:

Data Understanding
Filtering & Exploration
Sales Performance Analysis

These phases include hands-on SQL tasks that simulate day-to-day analytics work such as identifying missing data, understanding product categories, analyzing order patterns, and evaluating pizza performance across categories and sizes.

🧱 Dataset Description

The project uses multiple interconnected tables. Typical tables include:

pizzas – pizza details by size and price
pizza_types – type/category of pizzas
orders – order-level data
order_details – pizza-level quantities inside each order

🚀 Phase 1: Data Understanding

1. List all unique pizza categories
Use SELECT DISTINCT to identify all available product categories.

2. Display pizza type details
Retrieve pizza_type_id, name, and ingredients, replacing missing ingredients with "Missing Data".
Limit results to the first 5 rows.

3. Check for pizzas missing a price
Identify records where price IS NULL.

🔍 Phase 2: Filtering & Exploration

1. Orders placed on '2015-01-01'
Filter orders using WHERE on the order date.

2. List pizzas sorted by price (descending)

3. Pizzas sold in sizes 'L' or 'XL'

4. Pizzas priced between $15.00 and $17.00
Use BETWEEN.

5. Pizzas with "Chicken" in the name
Use pattern matching with LIKE.

6. Orders placed on '2015-02-15' or after 8 PM
Work with date and time conditions in WHERE.

📊 Phase 3: Sales Performance Analysis
1. Total quantity of pizzas sold
Aggregate using SUM(quantity).

2. Average pizza price
Use AVG(price).

3. Total order value per order
Join orders with order details and sum pizza values using GROUP BY.

4. Total quantity sold per pizza category
Join pizza → pizza_types → order_details and group by category.

5. Categories with more than 5,000 pizzas sold
Apply HAVING on grouped data.

6. Pizzas never ordered
Use LEFT JOIN or RIGHT JOIN to identify pizzas without matching order detail records.

7. Price difference between sizes of the same pizza
Perform a SELF JOIN to compare pricing for size variations.

🎯 Key SQL Concepts Covered

This project demonstrates:
DISTINCT, ORDER BY, LIMIT, IS NULL
Pattern filtering with LIKE
Conditional filters with BETWEEN, IN, comparison operators
Aggregations: SUM, AVG, COUNT
Complex queries with JOINs
INNER JOIN
LEFT JOIN
RIGHT JOIN
SELF JOIN
GROUP BY and HAVING for grouped analysis
Handling missing data using COALESCE
Real-world scenario-based SQL problem solving
