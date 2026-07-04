-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Module 6 — Window Functions
-- MAGIC ---
-- MAGIC No answer keys. Write everything yourself.
-- MAGIC Schema: stores, products, inventory, sales, forecast

-- COMMAND ----------

USE sql_mastery;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 6.1 — ROW_NUMBER, RANK, DENSE_RANK

-- COMMAND ----------

-- STUDY EXAMPLE
SELECT product_id, name, unit_cost,
       ROW_NUMBER() OVER (ORDER BY unit_cost DESC) AS rn,
       RANK()       OVER (ORDER BY unit_cost DESC) AS rnk,
       DENSE_RANK() OVER (ORDER BY unit_cost DESC) AS drnk
FROM products;

-- COMMAND ----------

-- Q1: Rank products by unit_cost WITHIN each category (use PARTITION BY)
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Find the top 2 highest-revenue products PER CITY using ROW_NUMBER + WHERE rn<=2
-- YOUR CODE:


-- COMMAND ----------

-- Q3: Use RANK() to find products tied for most expensive within their category
-- (rows where rnk = 1) — explain why RANK is the right choice here, not ROW_NUMBER
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 6.2 — LAG and LEAD

-- COMMAND ----------

-- STUDY EXAMPLE
SELECT store_id, product_id, sale_date, revenue,
       LAG(revenue, 1) OVER (PARTITION BY store_id, product_id ORDER BY sale_date) AS prev_revenue,
       LEAD(revenue, 1) OVER (PARTITION BY store_id, product_id ORDER BY sale_date) AS next_revenue
FROM sales;

-- COMMAND ----------

-- Q1: For each store+product, calculate revenue change vs the PREVIOUS sale
-- (current revenue - LAG revenue)
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Flag rows where revenue DROPPED more than 30% compared to the previous sale
-- YOUR CODE:


-- COMMAND ----------

-- Q3: Using forecast table — compare forecasted_units to the PREVIOUS month's
-- forecasted_units for the same store+product (LAG partitioned by store_id, product_id,
-- ordered by forecast_month)
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 6.3 — Running Totals

-- COMMAND ----------

-- STUDY EXAMPLE
SELECT sale_date, revenue,
       SUM(revenue) OVER (ORDER BY sale_date) AS running_total
FROM sales
WHERE store_id = 1
ORDER BY sale_date;

-- COMMAND ----------

-- Q1: Calculate a running total of revenue PER CITY, ordered by sale_date
-- (join sales to stores first, then PARTITION BY city)
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Calculate running COUNT of transactions per store, ordered by sale_date
-- YOUR CODE:


-- COMMAND ----------

-- Q3: Calculate what % each day's revenue contributes to the running total
-- (revenue / running_total * 100)
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 6.4 — NTILE (Bucketing)

-- COMMAND ----------

-- STUDY EXAMPLE
SELECT product_id, name, unit_cost,
       NTILE(4) OVER (ORDER BY unit_cost) AS price_quartile
FROM products;

-- COMMAND ----------

-- Q1: Split products into 3 buckets (NTILE(3)) by unit_cost. Label bucket 1 as
-- 'Budget', 2 as 'Mid', 3 as 'Premium' using CASE WHEN
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Split stores into 2 buckets by total revenue (you'll need a subquery/CTE
-- to get total revenue per store first, then NTILE on that result)
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 6.5 — Moving Averages (the Lowe's interview pattern)

-- COMMAND ----------

-- STUDY EXAMPLE — 3-period moving average
SELECT sale_date, revenue,
       AVG(revenue) OVER (
           ORDER BY sale_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_avg_3day
FROM sales
WHERE store_id = 1
ORDER BY sale_date;

-- COMMAND ----------

-- Q1: Calculate a 3-day moving average of revenue PER PRODUCT (not per store)
-- YOUR CODE:


-- COMMAND ----------

-- Q2: THE INTERVIEW QUESTION. forecast.actual_units has some NULL values
-- (future months not yet realized). Fill those NULLs using the moving average
-- of the PREVIOUS 3 known values — NOT including the current (NULL) row.
-- Hint: ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING
-- YOUR CODE:


-- COMMAND ----------

-- Q3: Calculate a 7-day moving average of revenue per store, but only using
-- PAST data (never look at future rows) — confirm your ROWS BETWEEN is correct
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## EXPLAIN BLOCK
-- MAGIC
-- MAGIC **Q1: Why does RANK() sometimes skip numbers (1,1,3) while DENSE_RANK() never does (1,1,2)? Walk through the mechanism.**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```
-- MAGIC
-- MAGIC **Q2: What's the difference between ROWS BETWEEN and RANGE BETWEEN in a window frame?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```
-- MAGIC
-- MAGIC **Q3: Why must ROWS BETWEEN N PRECEDING AND 1 PRECEDING be used (not CURRENT ROW) when filling a NULL value with a moving average?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```
-- MAGIC
-- MAGIC **Q4: What happens if you use ORDER BY inside OVER() without PARTITION BY? What does the window become?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## Checklist
-- MAGIC | Topic | Done? |
-- MAGIC |-------|-------|
-- MAGIC | 6.1 ROW_NUMBER/RANK/DENSE_RANK | ☐ |
-- MAGIC | 6.2 LAG/LEAD | ☐ |
-- MAGIC | 6.3 Running Totals | ☐ |
-- MAGIC | 6.4 NTILE | ☐ |
-- MAGIC | 6.5 Moving Averages | ☐ |
