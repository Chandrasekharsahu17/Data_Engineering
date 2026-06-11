-- Databricks notebook source
-- File: 03_aggregations.sql
-- Module 3: GROUP BY & HAVING
-- Topics: GROUP BY Basics · HAVING · GROUP BY with CASE WHEN · SQL Execution Order

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # 📦 Module 3 — GROUP BY & HAVING
-- MAGIC ---
-- MAGIC **Tables:** `customers` · `orders` · `products` · `order_items` · `employees` · `departments`

-- COMMAND ----------

USE sql_mastery;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 3.1 — GROUP BY Basics
-- MAGIC > GROUP BY collapses rows into groups and applies aggregate functions to each group.

-- COMMAND ----------

-- 📖 STUDY EXAMPLE
SELECT
    status,
    COUNT(*)    AS order_count,
    SUM(total)  AS total_revenue,
    AVG(total)  AS avg_order_value
FROM orders
GROUP BY status;

-- COMMAND ----------

-- ⌨️ Q1: Total orders and total revenue per customer_id
-- YOUR QUERY:
select customer_id,count(order_id)as count_of_order,sum(total) as revenue
from orders
group by customer_id



-- COMMAND ----------

-- ⌨️ Q2: Number of products per category with average price
-- YOUR QUERY:
select category,count(product_id) as no_of_prod,avg(price) as avg_price 
from products 
group by category

-- COMMAND ----------

-- ⌨️ Q3: Count of orders per status (completed / pending / cancelled)
--        Also show % of total orders each status represents
-- YOUR QUERY:


select status,count(order_id) as or_count ,(sum(total)/(select sum(total) from orders))*100 as Perc_total from orders
group by status


-- COMMAND ----------

-- 🗣️ EXPLAIN: Why can't you SELECT a column that isn't in GROUP BY or an aggregate?
--             What rule does SQL enforce here and why?
-- YOUR ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 3.2 — HAVING
-- MAGIC > WHERE filters ROWS before grouping. HAVING filters GROUPS after grouping.

-- COMMAND ----------

-- 📖 STUDY EXAMPLE
SELECT
    city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY city
HAVING COUNT(*) > 1;   -- only cities with more than 1 customer

-- COMMAND ----------

-- ⌨️ Q1: Find cities with more than 1 customer
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q2: Find customers who have placed more than 2 orders
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q3: Find product categories where the average price is above 20000
-- YOUR QUERY:


-- COMMAND ----------

-- 🗣️ EXPLAIN: Write Q2 using WHERE instead of HAVING. Run it. What error do you get?
--             Explain exactly why WHERE cannot be used here.
-- YOUR EXPERIMENT:


-- YOUR ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 3.3 — GROUP BY with CASE WHEN
-- MAGIC > Combine conditional bucketing with aggregation.

-- COMMAND ----------

-- ⌨️ Q1: Count of orders by size bucket (Small / Medium / Large)
--        Use CASE WHEN inside GROUP BY
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q2: Total revenue for completed vs non-completed orders — show side by side
--        (hint: use SUM with CASE WHEN inside it — called conditional aggregation)
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q3: Count employees by seniority level based on hire year:
--        hired before 2018 → 'Senior'
--        hired 2018–2020   → 'Mid'
--        hired after 2020  → 'Junior'
-- YOUR QUERY:


-- COMMAND ----------

-- 🗣️ EXPLAIN: What is conditional aggregation? 
--             Show the pattern: SUM(CASE WHEN ... THEN value ELSE 0 END)
-- YOUR ANSWER + EXAMPLE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 3.4 — SQL Execution Order
-- MAGIC > FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
-- MAGIC > Understanding this explains why certain queries fail.

-- COMMAND ----------

-- ⌨️ Q1: Write one query that uses WHERE, GROUP BY, HAVING, ORDER BY all together
--        Goal: cities with total order revenue > 5000, sorted by revenue desc
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q2: Try using a SELECT alias in a WHERE clause — document what happens
-- YOUR EXPERIMENT + COMMENT:


-- COMMAND ----------

-- ⌨️ Q3: Try using a SELECT alias in ORDER BY — does it work in Spark SQL?
--        Then try in HAVING — does that work?
-- YOUR EXPERIMENT + COMMENT:


-- COMMAND ----------

-- 🗣️ EXPLAIN: Write out the SQL execution order from memory.
--             Why can you use a SELECT alias in ORDER BY but not WHERE?
-- YOUR ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✅ Module 3 Checklist
-- MAGIC | Topic | Queries Done? | Explained? |
-- MAGIC |-------|--------------|------------|
-- MAGIC | 3.1 GROUP BY Basics | ☐ | ☐ |
-- MAGIC | 3.2 HAVING | ☐ | ☐ |
-- MAGIC | 3.3 GROUP BY + CASE WHEN | ☐ | ☐ |
-- MAGIC | 3.4 Execution Order | ☐ | ☐ |
-- MAGIC
-- MAGIC **All done → push → move to 04_joins.sql**
