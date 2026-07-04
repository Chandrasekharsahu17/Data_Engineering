-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Module 8 — String & Date Functions
-- MAGIC ---
-- MAGIC No answer keys. Write everything yourself.

-- COMMAND ----------

USE sql_mastery;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 8.1 — String Functions

-- COMMAND ----------

-- STUDY EXAMPLE
SELECT name,
       UPPER(name) AS upper_name,
       LOWER(name) AS lower_name,
       LENGTH(name) AS name_length,
       SUBSTRING(name, 1, 3) AS first_3_chars,
       CONCAT(name, ' - ', category) AS combined,
       TRIM('  padded  ') AS trimmed
FROM products;

-- COMMAND ----------

-- Q1: Get the first 4 characters of each city name, uppercase
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Concatenate product name and brand into one column "name (brand)"
-- YOUR CODE:


-- COMMAND ----------

-- Q3: Find all products where the name is longer than 10 characters
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 8.2 — Pattern Matching (LIKE)

-- COMMAND ----------

-- STUDY EXAMPLE
SELECT name FROM products WHERE name LIKE '%Paint%';   -- contains
SELECT name FROM products WHERE name LIKE 'D%';         -- starts with
SELECT name FROM products WHERE name LIKE '%r';          -- ends with

-- COMMAND ----------

-- Q1: Find all customers whose city starts with 'B'
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Find all products where the name contains 'a' AND category is 'Tools'
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 8.3 — Date Functions

-- COMMAND ----------

-- STUDY EXAMPLE
SELECT sale_date,
       YEAR(sale_date) AS yr,
       MONTH(sale_date) AS mn,
       DAY(sale_date) AS dy,
       DATEDIFF(CURRENT_DATE(), sale_date) AS days_ago,
       DATE_ADD(sale_date, 7) AS week_later
FROM sales;

-- COMMAND ----------

-- Q1: Get month and year as separate columns for every row in the sales table
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Find all sales from the last 30 days (using DATEDIFF against CURRENT_DATE)
-- YOUR CODE:


-- COMMAND ----------

-- Q3: For the forecast table, calculate how many days until forecast_month
-- from today (careful: forecast_month is YYYY-MM format, not a full date —
-- you'll need to convert it first)
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 8.4 — Date Truncation & Formatting

-- COMMAND ----------

-- STUDY EXAMPLE
SELECT sale_date,
       DATE_TRUNC('MONTH', sale_date) AS month_start,
       DATE_FORMAT(sale_date, 'yyyy-MM') AS year_month
FROM sales;

-- COMMAND ----------

-- Q1: Group total revenue by MONTH (use DATE_TRUNC or DATE_FORMAT to bucket
-- sale_date into months first)
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Group total revenue by WEEK
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## EXPLAIN BLOCK
-- MAGIC
-- MAGIC **Q1: Why is `WHERE UPPER(city) = 'MUMBAI'` generally worse for performance than `WHERE city = 'Mumbai'`, assuming the data is stored consistently?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```
-- MAGIC
-- MAGIC **Q2: What's the difference between DATE_TRUNC and DATE_FORMAT? When would you use each?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```
-- MAGIC
-- MAGIC **Q3: Why does `name LIKE '%Paint%'` (leading wildcard) behave differently for performance than `name LIKE 'Paint%'`?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## Checklist
-- MAGIC | Topic | Done? |
-- MAGIC |-------|-------|
-- MAGIC | 8.1 String Functions | ☐ |
-- MAGIC | 8.2 Pattern Matching | ☐ |
-- MAGIC | 8.3 Date Functions | ☐ |
-- MAGIC | 8.4 Date Truncation & Formatting | ☐ |

