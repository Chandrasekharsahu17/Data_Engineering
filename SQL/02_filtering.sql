-- Databricks notebook source
-- File: 02_filtering.sql
-- Module 2: Filtering & Functions
-- Topics: String Functions · Date Functions · CASE WHEN · Math Functions · Aggregate Functions

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # 📦 Module 2 — Filtering & Functions
-- MAGIC ---
-- MAGIC **Tables:** `customers` · `orders` · `products` · `order_items` · `employees` · `departments`

-- COMMAND ----------

USE sql_mastery;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✦ Topic 2.1 — String Functions
-- MAGIC > UPPER, LOWER, LENGTH, TRIM, SUBSTRING, CONCAT, REPLACE, LIKE

-- COMMAND ----------

-- 📖 STUDY EXAMPLES
SELECT
    UPPER(name)              AS name_upper,
    LOWER(city)              AS city_lower,
    LENGTH(name)             AS name_length,
    SUBSTRING(name, 1, 3)    AS first_3_chars,
    CONCAT(name, ' - ', city) AS name_city
FROM customers
LIMIT 5;

-- COMMAND ----------

-- ⌨️ Q1: Show all customer names in UPPERCASE with their city in lowercase
-- YOUR QUERY:
select upper(name),lower(city) from customers;


-- COMMAND ----------

-- ⌨️ Q2: Find products where the name contains 'pro' (case insensitive)
--        Hint: use LOWER() + LIKE
-- YOUR QUERY:
Select name from products
where lower(name)  LIKE "%pro%";

-- COMMAND ----------

-- ⌨️ Q3: Extract first 3 characters of every customer name as 'code'
--        Concat it with their customer_id to make a unique code like 'RAJ001'
-- YOUR QUERY:
Select concat(upper(substring(name,0,3)),customer_id) from customers

-- COMMAND ----------

-- 🗣️ EXPLAIN: What is the difference between LIKE '%abc%' and LIKE 'abc%'?
--             Which one is faster in a large table and why?
-- YOUR ANSWER:in the 1st one the abc string should in between a string and in 2nd one it should start with abc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✦ Topic 2.2 — Date Functions
-- MAGIC > YEAR(), MONTH(), DAY(), DATEDIFF(), DATE_ADD(), CURRENT_DATE, date_format()

-- COMMAND ----------

-- 📖 STUDY EXAMPLES
SELECT
    order_id,
    order_date,
    YEAR(order_date)                        AS order_year,
    MONTH(order_date)                       AS order_month,
    DATEDIFF(CURRENT_DATE, order_date)      AS days_ago,
    date_format(order_date, 'dd-MM-yyyy')   AS formatted_date
FROM orders
LIMIT 5;

-- COMMAND ----------

-- ⌨️ Q1: Show all orders placed in January 2024
-- YOUR QUERY:
select * from orders 
where year(order_date) = 2024 and  month(order_date)=1

-- COMMAND ----------

-- ⌨️ Q2: Calculate how many days ago each order was placed
--        Show order_id, order_date, days_ago — sorted by days_ago ascending
-- YOUR QUERY:
SELECT order_id,order_date,
DATEDIFF(CURRENT_DATE,order_date) as days_ago
from orders
order by DATEDIFF(CURRENT_DATE,order_date) ;




-- COMMAND ----------

-- ⌨️ Q3: Find customers who joined after 2019-01-01
--        Show name, city, joined_date, and how many days they have been a customer
-- YOUR QUERY:
-- select * from customers
select name, city, joined_date,
datediff(current_date,joined_date) as period
from customers
where joined_date > '2019-01-01'


-- COMMAND ----------

-- 🗣️ EXPLAIN: In Spark SQL, what is the difference between DATEDIFF and months_between?
--             Give an example where they give different answers.
-- YOUR ANSWER: datediff is used to calaculate difference between two dates and months between is for how many months are there in between



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✦ Topic 2.3 — CASE WHEN
-- MAGIC > Conditional logic inside SQL. One of the most powerful tools you will use.

-- COMMAND ----------

-- 📖 STUDY EXAMPLE
SELECT
    name,
    tier,
    CASE
        WHEN tier = 'Gold'   THEN 'VIP Customer'
        WHEN tier = 'Silver' THEN 'Regular Customer'
        ELSE                      'New Customer'
    END AS customer_label
FROM customers;

-- COMMAND ----------

-- ⌨️ Q1: Add a price_range column to products:
--        price < 5000  → 'Budget'
--        price < 30000 → 'Mid'
--        else          → 'Premium'
-- YOUR QUERY:
Select * , case 
        when price < 5000 then 'Budget'
        when price < 30000 then 'Mid'
        else 'Premium'
    end as type
from products

-- COMMAND ----------

-- ⌨️ Q2: Add an order_size column to orders:
--        total < 1000  → 'Small'
--        total < 5000  → 'Medium'
--        else          → 'Large'
-- YOUR QUERY:
select *,case 
    when total < 1000  then 'Small'
    when total < 5000  then 'Medium'
    else      'Large'
    end as order_size   

 from orders 


-- COMMAND ----------

-- ⌨️ Q3: Count how many orders fall into each size bucket
--        Combine CASE WHEN inside a GROUP BY
--        Expected output: Small | Medium | Large with counts
-- YOUR QUERY:
SELECT
    CASE
        WHEN total < 1000 THEN 'Small'
        WHEN total < 5000 THEN 'Medium'
        ELSE 'Large'
    END AS size_bucket,
    COUNT(*) AS order_count
FROM orders
GROUP BY
    CASE
        WHEN total < 1000 THEN 'Small'
        WHEN total < 5000 THEN 'Medium'
        ELSE 'Large'
    END;


-- COMMAND ----------

-- 🗣️ EXPLAIN: Can you use CASE WHEN inside an aggregate function like SUM()?
--             Write an example that sums revenue only for completed orders using CASE inside SUM
-- YOUR EXAMPLE + ANSWER:
SELECT
    SUM(
        CASE
            WHEN status = 'completed' THEN total
            ELSE 0
        END
    ) AS completed_revenue
FROM orders;



-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✦ Topic 2.4 — Math Functions
-- MAGIC > ROUND, FLOOR, CEIL, ABS, MOD, POWER, SQRT

-- COMMAND ----------

-- 📖 STUDY EXAMPLE
SELECT
    price,
    ROUND(price, -3)         AS rounded_to_1000,
    FLOOR(price / 1000)      AS thousands_floor,
    CEIL(price / 1000)       AS thousands_ceil,
    ABS(price - 50000)       AS distance_from_50k
FROM products
LIMIT 5;

-- COMMAND ----------

-- ⌨️ Q1: Round all product prices to the nearest 1000
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q2: Find the absolute difference between each order total
--        and the average order total across all orders
--        Show order_id, total, avg_total, difference
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q3: Show employees with:
--        - salary rounded to nearest 10000
--        - their annual salary (salary * 12)
--        - annual salary squared (use POWER)
-- YOUR QUERY:


-- COMMAND ----------

-- 🗣️ EXPLAIN: What is the difference between FLOOR and ROUND for negative numbers?
--             FLOOR(-4.3) = ? and ROUND(-4.3) = ? — explain why.
-- YOUR ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✦ Topic 2.5 — Aggregate Functions
-- MAGIC > COUNT, SUM, AVG, MIN, MAX — the core of analytics

-- COMMAND ----------

-- 📖 STUDY EXAMPLE — different COUNT behaviors
SELECT
    COUNT(*)                    AS total_rows,
    COUNT(customer_id)          AS non_null_customer_ids,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(total)                  AS total_revenue,
    AVG(total)                  AS avg_order_value,
    MIN(total)                  AS smallest_order,
    MAX(total)                  AS largest_order
FROM orders;

-- COMMAND ----------

-- ⌨️ Q1: Find total revenue, avg order value, min and max order from the orders table
--        For COMPLETED orders only
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q2: Count of products per category
--        Show category and product_count, sorted by count descending
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q3: For employees — find avg salary, min salary, max salary, and total headcount
--        Per department (use dept_id for now)
-- YOUR QUERY:


-- COMMAND ----------

-- 🗣️ EXPLAIN: What is the difference between COUNT(*), COUNT(col), and COUNT(DISTINCT col)?
--             Create a scenario where all three give DIFFERENT results and show the query.
-- YOUR EXAMPLE + ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✅ Module 2 Completion Checklist
-- MAGIC
-- MAGIC | Topic | All 3 Queries? | Explained? |
-- MAGIC |-------|----------------|------------|
-- MAGIC | 2.1 String Functions | ☐ | ☐ |
-- MAGIC | 2.2 Date Functions | ☐ | ☐ |
-- MAGIC | 2.3 CASE WHEN | ☐ | ☐ |
-- MAGIC | 2.4 Math Functions | ☐ | ☐ |
-- MAGIC | 2.5 Aggregate Functions | ☐ | ☐ |
-- MAGIC
-- MAGIC **All done → push to GitHub → move to 03_aggregations.sql**
