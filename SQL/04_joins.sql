-- Databricks notebook source
-- File: 04_joins.sql
-- Module 4: JOINs (Most Important Module)
-- Topics: INNER · LEFT · RIGHT/FULL · SELF · CROSS · Multi-table · Pitfalls

-- COMMAND ----------

-- MAGIC %md
-- MAGIC # 📦 Module 4 — JOINs
-- MAGIC > The most important module. Take your time. Every topic here shows up in real pipelines daily.
-- MAGIC ---
-- MAGIC **Tables:** `customers` · `orders` · `products` · `order_items` · `employees` · `departments`

-- COMMAND ----------

USE sql_mastery;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 4.1 — INNER JOIN
-- MAGIC > Returns only rows that have a match in BOTH tables.

-- COMMAND ----------

-- 📖 STUDY EXAMPLE
SELECT
    o.order_id,
    c.name        AS customer_name,
    c.city,
    o.total
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
LIMIT 5;

-- COMMAND ----------

-- ⌨️ Q1: Show all orders with customer name and city
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q2: Show order_items with product name, qty, unit_price
--        (join order_items with products)
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q3: 3-table join — customers + orders + order_items + products
--        Show: customer name, product name, qty, revenue (qty * unit_price)
-- YOUR QUERY:


-- COMMAND ----------

-- 🗣️ EXPLAIN: What rows does INNER JOIN drop?
--             Draw a simple Venn diagram in a comment showing what it keeps.
-- YOUR ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 4.2 — LEFT JOIN
-- MAGIC > All rows from LEFT table. Matched rows from RIGHT. NULLs where no match.

-- COMMAND ----------

-- 📖 STUDY EXAMPLE — notice customer 6, 9, 11, 13 have no orders
SELECT
    c.name,
    c.city,
    o.order_id,
    o.total
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- COMMAND ----------

-- ⌨️ Q1: All customers with their orders — include customers who have no orders
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q2: All products with their order_items — include products never ordered
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q3: Find customers who have NEVER placed an order
--        (LEFT JOIN + WHERE order_id IS NULL)
-- YOUR QUERY:


-- COMMAND ----------

-- 🗣️ EXPLAIN: What is the anti-join pattern? Write the pattern and give a real use case.
-- YOUR ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 4.3 — FULL OUTER JOIN and RIGHT JOIN

-- COMMAND ----------

-- ⌨️ Q1: RIGHT JOIN — show all orders even if customer record is missing
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q2: FULL OUTER JOIN — all customers + all orders (even unmatched on both sides)
--        Spark SQL supports FULL OUTER JOIN directly
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q3: Find rows that exist in customers but NOT orders AND rows in orders but NOT customers
--        (symmetric difference using FULL OUTER JOIN + WHERE)
-- YOUR QUERY:


-- COMMAND ----------

-- 🗣️ EXPLAIN: Why is RIGHT JOIN rarely used in practice?
--             How do you convert any RIGHT JOIN to a LEFT JOIN?
-- YOUR ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 4.4 — Self JOIN
-- MAGIC > Joining a table to itself. Used for hierarchies and comparisons.

-- COMMAND ----------

-- 📖 STUDY EXAMPLE — employee and their manager
SELECT
    e.name        AS employee,
    e.salary      AS emp_salary,
    m.name        AS manager,
    m.salary      AS mgr_salary
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- COMMAND ----------

-- ⌨️ Q1: Show each employee with their manager's name
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q2: Find employees who earn MORE than their manager
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q3: Find all pairs of employees in the same department
--        (avoid duplicates — only show where e1.emp_id < e2.emp_id)
-- YOUR QUERY:


-- COMMAND ----------

-- 🗣️ EXPLAIN: What is a self join and when would you use it?
--             Give 2 real-world scenarios beyond org charts.
-- YOUR ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 4.5 — CROSS JOIN

-- COMMAND ----------

-- ⌨️ Q1: Cross join departments and products — show all combinations
--        How many rows do you get? Why?
-- YOUR QUERY + COMMENT:


-- COMMAND ----------

-- ⌨️ Q2: Create a size × tier combination list using VALUES
SELECT sizes.size, tiers.tier
FROM (VALUES ('S'), ('M'), ('L'), ('XL')) AS sizes(size)
CROSS JOIN (VALUES ('Bronze'), ('Silver'), ('Gold')) AS tiers(tier)
ORDER BY sizes.size, tiers.tier;
-- Now write your OWN cross join combining two real tables

-- YOUR QUERY:


-- COMMAND ----------

-- 🗣️ EXPLAIN: When is CROSS JOIN useful vs dangerous?
--             What happens to row count: table A (100 rows) CROSS JOIN table B (50 rows)?
-- YOUR ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 4.6 — Multi-table JOINs

-- COMMAND ----------

-- ⌨️ Q1: 4-table join: customers → orders → order_items → products
--        Show: customer name, product name, qty, line_total (qty * unit_price)
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q2: employees → departments → manager (self join)
--        Show: employee name, dept name, dept location, manager name
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q3: Find the top product by total revenue per city
--        (customers → orders → order_items → products, group, rank)
-- YOUR QUERY:


-- COMMAND ----------

-- 🗣️ EXPLAIN: Does the ORDER of tables in FROM/JOIN matter for results?
--             Does it matter for performance in Spark? Why?
-- YOUR ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 4.7 — JOIN Pitfalls & EXISTS

-- COMMAND ----------

-- ⌨️ Q1: Write a JOIN that accidentally duplicates rows — identify why and fix it
--        (hint: join orders to order_items without aggregating)
-- YOUR QUERY + EXPLANATION:


-- COMMAND ----------

-- ⌨️ Q2: Use EXISTS to find customers who have at least 1 completed order
-- YOUR QUERY:


-- COMMAND ----------

-- ⌨️ Q3: Use IN with a subquery vs JOIN to find the same result
--        Write both and add a comment on which is clearer
-- YOUR QUERY:


-- COMMAND ----------

-- 🗣️ EXPLAIN: What is a JOIN explosion? How does a LEFT JOIN to a table
--             with duplicate keys cause unexpected row counts?
-- YOUR ANSWER:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✅ Module 4 Checklist
-- MAGIC | Topic | Queries Done? | Explained? |
-- MAGIC |-------|--------------|------------|
-- MAGIC | 4.1 INNER JOIN | ☐ | ☐ |
-- MAGIC | 4.2 LEFT JOIN | ☐ | ☐ |
-- MAGIC | 4.3 FULL OUTER / RIGHT | ☐ | ☐ |
-- MAGIC | 4.4 Self JOIN | ☐ | ☐ |
-- MAGIC | 4.5 CROSS JOIN | ☐ | ☐ |
-- MAGIC | 4.6 Multi-table JOINs | ☐ | ☐ |
-- MAGIC | 4.7 Pitfalls & EXISTS | ☐ | ☐ |
-- MAGIC
-- MAGIC **All done → push → 05_subqueries.sql**
