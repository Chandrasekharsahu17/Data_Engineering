-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Module 10 — Advanced SQL
-- MAGIC ---
-- MAGIC No answer keys. Write everything yourself.

-- COMMAND ----------

USE sql_mastery;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 10.1 — UNION vs UNION ALL

-- COMMAND ----------

-- STUDY EXAMPLE
SELECT city FROM stores WHERE region = 'North'
UNION
SELECT city FROM stores WHERE region = 'South';
-- UNION removes duplicates. UNION ALL keeps them (and is faster).

-- COMMAND ----------

-- Q1: Get a combined list of product names from category='Tools' OR
-- category='Paint' using UNION ALL. Why is UNION ALL fine here?
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Get a list of cities that appear in BOTH stores AND a hypothetical
-- high-priority list ['Mumbai','Delhi','Bangalore'] using UNION, then
-- explain when you'd need UNION over UNION ALL for correctness
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 10.2 — INTERSECT / EXCEPT (MINUS)

-- COMMAND ----------

-- STUDY EXAMPLE
-- Cities that have BOTH stores and appear in sales
SELECT city FROM stores
INTERSECT
SELECT st.city FROM sales s JOIN stores st ON s.store_id = st.store_id;

-- COMMAND ----------

-- Q1: Find products that exist in the products table but have NEVER
-- appeared in a sale (use EXCEPT)
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Rewrite your Q1 answer using NOT EXISTS instead of EXCEPT.
-- Which do you find more readable? Note it as a comment.
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 10.3 — PIVOT-Style Queries (CASE WHEN + GROUP BY)

-- COMMAND ----------

-- STUDY EXAMPLE
SELECT st.city,
       SUM(CASE WHEN p.category = 'Tools' THEN s.revenue ELSE 0 END) AS tools_revenue,
       SUM(CASE WHEN p.category = 'Paint' THEN s.revenue ELSE 0 END) AS paint_revenue
FROM sales s
JOIN stores st ON s.store_id = st.store_id
JOIN products p ON s.product_id = p.product_id
GROUP BY st.city;

-- COMMAND ----------

-- Q1: Build a pivot showing, per city, total revenue split by EACH
-- category that exists in your products table (Tools, Paint, Safety, Garden)
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Build a pivot showing count of overstocked (WOS>15) vs healthy
-- (WOS<=15) inventory records, per city
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 10.4 — Window Frame Variations (recap + extend)

-- COMMAND ----------

-- Q1: Calculate a CENTERED moving average (1 PRECEDING, CURRENT ROW,
-- 1 FOLLOWING) of revenue per store — different from the forward-only
-- moving average you did in Module 6
-- YOUR CODE:


-- COMMAND ----------

-- Q2: Calculate the FULL running total using UNBOUNDED PRECEDING explicitly
-- (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) and confirm it matches
-- the simpler version from Module 6.3
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## EXPLAIN BLOCK
-- MAGIC
-- MAGIC **Q1: What's the difference between EXCEPT and NOT EXISTS? Do they always give the same result? (Hint: think about the NULL trap from Module 5.4)**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```
-- MAGIC
-- MAGIC **Q2: Why must all SELECT statements in a UNION have the same number of columns and compatible types?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```
-- MAGIC
-- MAGIC **Q3: When would a CASE WHEN pivot be preferable to an actual PIVOT clause (where available)?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## Checklist
-- MAGIC | Topic | Done? |
-- MAGIC |-------|-------|
-- MAGIC | 10.1 UNION vs UNION ALL | ☐ |
-- MAGIC | 10.2 INTERSECT / EXCEPT | ☐ |
-- MAGIC | 10.3 PIVOT-Style Queries | ☐ |
-- MAGIC | 10.4 Window Frame Variations | ☐ |

