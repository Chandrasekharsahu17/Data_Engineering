-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Module 7 — CTEs (Common Table Expressions)
-- MAGIC ---
-- MAGIC No answer keys. Write everything yourself.

-- COMMAND ----------

USE sql_mastery;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 7.1 — Basic CTE Syntax
-- MAGIC ```
-- MAGIC Common error from your 5.2 module: WITH a(SELECT...) is WRONG.
-- MAGIC Correct: WITH a AS (SELECT...)
-- MAGIC ```

-- COMMAND ----------

-- STUDY EXAMPLE
WITH high_value_products AS (
    SELECT product_id, name, unit_cost
    FROM products
    WHERE unit_cost > 3000
)
SELECT * FROM high_value_products ORDER BY unit_cost DESC;

-- COMMAND ----------

-- Q1: Write a CTE that gets total revenue per store, then SELECT stores
-- with total revenue above 100000
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Write a CTE that calculates WOS (stock_units/weekly_sales) per
-- store+product, then SELECT only rows where WOS > 15 (overstocked)
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 7.2 — Multiple CTEs in One Query

-- COMMAND ----------

-- STUDY EXAMPLE
WITH city_revenue AS (
    SELECT st.city, SUM(s.revenue) AS total_revenue
    FROM sales s JOIN stores st ON s.store_id = st.store_id
    GROUP BY st.city
),
city_avg AS (
    SELECT AVG(total_revenue) AS avg_rev FROM city_revenue
)
SELECT * FROM city_revenue, city_avg
WHERE city_revenue.total_revenue > city_avg.avg_rev;

-- COMMAND ----------

-- Q1: Write 2 CTEs: one for total revenue per product, one for the overall
-- average of that. Then SELECT products above the average.
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Write 2 CTEs: one for average WOS per city, one for average WOS
-- overall. SELECT cities whose average WOS is above the overall average.
-- YOUR CODE:


-- COMMAND ----------

-- Q3: Write 3 CTEs chained together: total revenue per store → rank stores
-- by revenue using ROW_NUMBER → SELECT only the top 3 ranked stores
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 7.3 — CTE vs Subquery vs Derived Table (apply what you learned in Module 5)

-- COMMAND ----------

-- Q1: Take this derived-table query and rewrite it as a CTE:
-- SELECT * FROM (
--     SELECT city, SUM(revenue) AS total FROM sales s
--     JOIN stores st ON s.store_id = st.store_id GROUP BY city
-- ) t WHERE total > 50000
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Take this correlated subquery and rewrite it as a CTE + JOIN instead
-- (for performance — recall Module 5.3 EXPLAIN about correlated subqueries running per-row):
-- SELECT * FROM products p
-- WHERE unit_cost > (SELECT AVG(unit_cost) FROM products WHERE category = p.category)
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## EXPLAIN BLOCK
-- MAGIC
-- MAGIC **Q1: You already answered "derived table vs CTE" in Module 5 and got partial credit — neither takes "extra storage." What IS the actual difference? Answer it correctly this time.**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```
-- MAGIC
-- MAGIC **Q2: Why would you chain 3 CTEs together instead of nesting 3 subqueries inside each other?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```
-- MAGIC
-- MAGIC **Q3: Does a CTE get computed once and reused, or recomputed every time you reference it in the main query? Why does this matter for performance?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## Checklist
-- MAGIC | Topic | Done? |
-- MAGIC |-------|-------|
-- MAGIC | 7.1 Basic CTE | ☐ |
-- MAGIC | 7.2 Multiple CTEs | ☐ |
-- MAGIC | 7.3 CTE vs Subquery vs Derived | ☐ |

