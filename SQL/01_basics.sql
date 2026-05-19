-- Databricks notebook source
-- File: 01_basics.sql
-- Module 1: SQL Basics
-- Topics: SELECT · FROM · LIMIT · WHERE · ORDER BY · DISTINCT · NULL · Aliases · Expressions

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # 📦 Module 1 — SQL Basics
-- MAGIC
-- MAGIC **3-Layer Rule — topic is DONE when:**
-- MAGIC ```
-- MAGIC 👁️  STUDY    → Read the concept above each section
-- MAGIC ⌨️  WRITE    → Write the query yourself in the cell
-- MAGIC 🗣️  EXPLAIN  → Answer the explain question as a comment
-- MAGIC ```
-- MAGIC ---
-- MAGIC **Tables available:** `customers` · `orders` · `products` · `order_items` · `employees` · `departments`

-- COMMAND ----------

USE sql_mastery;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✦ Topic 1.1 — SELECT, FROM, LIMIT
-- MAGIC > Every query starts here. SELECT = what columns. FROM = which table. LIMIT = how many rows.

-- COMMAND ----------

-- 📖 STUDY EXAMPLE — run this first to understand the syntax
SELECT
    customer_id,
    name,
    city
FROM customers
LIMIT 5;

-- COMMAND ----------

-- ⌨️ Q1: Select ALL columns from customers
select * from customers;


-- COMMAND ----------

-- ⌨️ Q2: Select only name and city from customers
-- YOUR QUERY:
select name,city from customers;


-- COMMAND ----------

-- ⌨️ Q3: Select the first 5 products ordered by price (highest first)
-- YOUR QUERY:
select name,price from products
order by price desc
limit 5 ;


-- COMMAND ----------

-- 🗣️ EXPLAIN: What is the difference between SELECT * and SELECT col1, col2?
--             Why should you avoid SELECT * in production pipelines?
-- YOUR ANSWER (as a comment):as select 8 will take all columns from a table which will take a lot of memory and selected columns will take less memory so we should avoid using selct * in production


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✦ Topic 1.2 — WHERE Clause
-- MAGIC > Filter rows. Uses: =, !=, >, <, >=, <=, AND, OR, NOT, IN, BETWEEN, LIKE

-- COMMAND ----------

-- 📖 STUDY EXAMPLE
SELECT name, city, tier
FROM customers
WHERE city = 'Mumbai' AND tier = 'Gold';

-- COMMAND ----------

-- ⌨️ Q1: Find all customers from Delhi
-- YOUR QUERY:
select name from customers
where city="Delhi";

-- COMMAND ----------

-- ⌨️ Q2: Find orders with total between 2000 and 8000
-- YOUR QUERY:
Select * from orders
where total >2000 and total <8000



-- COMMAND ----------

-- ⌨️ Q3: Find products where name starts with 'S' and price > 20000
-- YOUR QUERY:
Select * from products
where upper(name)  like "S%" and price >2000

-- COMMAND ----------

-- 🗣️ EXPLAIN: What is the difference between IN and BETWEEN?
--             When would you use OR vs IN?
-- YOUR ANSWER: In will be used where name should be in the starting kind of thing between is like rane like between 200 to 5000 range or date range and OR condition will be used where we want either of the condition can be true 


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✦ Topic 1.3 — ORDER BY and DISTINCT
-- MAGIC > ORDER BY sorts results. DISTINCT removes duplicate values.

-- COMMAND ----------

-- 📖 STUDY EXAMPLE
SELECT DISTINCT city
FROM customers
ORDER BY city ASC;

-- COMMAND ----------

-- ⌨️ Q1: Get all products sorted by price descending
-- YOUR QUERY:
select * from products
order by price desc;


-- COMMAND ----------

-- ⌨️ Q2: Get a list of distinct cities where customers live
-- YOUR QUERY:
select distinct(city) from customers

-- COMMAND ----------

-- ⌨️ Q3: Get the 3 most expensive products — show name, category, price
-- YOUR QUERY:
select name,category,price from products
order by price desc
Limit 3;

-- COMMAND ----------

-- 🗣️ EXPLAIN: Does ORDER BY happen before or after WHERE in SQL execution?
--             Why does this matter?
-- YOUR ANSWER:where is like filter that is added to table and order by is like sorting it from desc or aescending


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✦ Topic 1.4 — NULL Handling
-- MAGIC > NULL means unknown. It is NOT zero or empty string.
-- MAGIC > Use: IS NULL, IS NOT NULL, COALESCE, IFNULL, NULLIF
-- MAGIC
-- MAGIC

-- COMMAND ----------

-- 📖 STUDY EXAMPLE — see the difference
SELECT name, manager_id
FROM employees
WHERE manager_id IS NULL;   -- these are the top-level managers

-- COMMAND ----------

-- ⌨️ Q1: Find all orders where customer_id IS NULL
-- YOUR QUERY:
select * from orders
where customer_id is null;


-- COMMAND ----------

-- ⌨️ Q2: Show all employees — if manager_id is NULL, show 0 instead
--        (use COALESCE)
-- YOUR QUERY:
select *,COALESCE(manager_id,"0") as manage from employees


-- COMMAND ----------

-- ⌨️ Q3: Find customers where BOTH city and tier are NOT null
-- YOUR QUERY:
select * from customers
where city is not null and tier is not null


-- COMMAND ----------

-- 🗣️ EXPLAIN: Why does WHERE manager_id = NULL not work?
--             What is the difference between COALESCE and IFNULL?
-- YOUR ANSWER:COALESCE is used to check fit null values in a list and ifNULL is used to check a value is null or not and replace it with any replacement


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✦ Topic 1.5 — Aliases and Expressions
-- MAGIC > Rename columns with AS. Do math directly in SELECT.

-- COMMAND ----------

-- 📖 STUDY EXAMPLE
SELECT
    name,
    salary,
    salary * 12        AS annual_salary,
    salary * 0.1       AS bonus
FROM employees;

-- COMMAND ----------

-- ⌨️ Q1: Show product name and price with 18% GST added — call it price_with_gst
-- YOUR QUERY:
select name, price ,price*1.18 as price_with_gst
from products

-- COMMAND ----------

-- ⌨️ Q2: Show employee name and salary — rename salary to monthly_pay
-- YOUR QUERY:
select name , salary as monthly_pay
from employees

-- COMMAND ----------

-- ⌨️ Q3: Show order_id, total, and a column 'total_after_discount' = total * 0.9
--        Also add a column 'savings' = total - total_after_discount
-- YOUR QUERY:
select order_id,total,total*0.9 as total_after_discount,total - total*0.9 as savings
from orders

-- COMMAND ----------

-- 🗣️ EXPLAIN: Can you use an alias in a WHERE clause?
--             Try it — write the query, run it, and explain what happens and why.
-- YOUR EXPERIMENT:

select name , salary as monthly_pay
from employees
where salary > 50000;

-- YOUR ANSWER:
-- No, you cannot use an alias in a WHERE clause. The WHERE clause is evaluated BEFORE the SELECT clause,
-- so the alias 'monthly_pay' doesn't exist yet when WHERE is processed. You must use the original column name 'salary'.

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## ✅ Module 1 Completion Checklist
-- MAGIC
-- MAGIC Go back and mark each one honestly:
-- MAGIC
-- MAGIC | Topic | Watched? | All 3 Queries? | Explained? |
-- MAGIC |-------|----------|----------------|------------|
-- MAGIC | 1.1 SELECT FROM LIMIT | ✅ | ✅ | ✅ |
-- MAGIC | 1.2 WHERE | ✅ | ✅ | ✅ |
-- MAGIC | 1.3 ORDER BY DISTINCT | ✅ | ✅ | ✅ |
-- MAGIC | 1.4 NULL Handling | ✅ | ✅ | ✅ |
-- MAGIC | 1.5 Aliases & Expressions | ✅ | ✅ | ✅ |
-- MAGIC
-- MAGIC **When all rows are done → push to GitHub → move to 02_filtering.sql**
