-- Databricks notebook source
-- File: 05_subqueries.sql
-- Module 5: Subqueries

-- COMMAND ----------
-- MAGIC %md
-- MAGIC # 📦 Module 5 — Subqueries
-- MAGIC ---

-- COMMAND ----------
USE sql_mastery;

-- COMMAND ----------
-- MAGIC %md
-- MAGIC ## ✦ Topic 5.1 — Scalar Subqueries (return one value)

-- COMMAND ----------
-- 📖 STUDY EXAMPLE
SELECT name, price, (SELECT AVG(price) FROM products) AS avg_price
FROM products;

-- COMMAND ----------
-- ⌨️ Q1: Find products priced above the average product price
-- YOUR QUERY:

-- COMMAND ----------
-- ⌨️ Q2: Show each order with a column 'vs_avg' = (total - overall avg total)
-- YOUR QUERY:

-- COMMAND ----------
-- ⌨️ Q3: Find the customer who placed the single highest value order
-- YOUR QUERY:

-- COMMAND ----------
-- 🗣️ EXPLAIN: What happens if a scalar subquery returns more than 1 row?
-- YOUR ANSWER:

-- COMMAND ----------
-- MAGIC %md
-- MAGIC ## ✦ Topic 5.2 — Subqueries in FROM (Derived Tables)

-- COMMAND ----------
-- ⌨️ Q1: Get avg spend per customer, then find customers above that average
-- YOUR QUERY:

-- COMMAND ----------
-- ⌨️ Q2: Find top 3 products by total revenue using subquery in FROM
-- YOUR QUERY:

-- COMMAND ----------
-- ⌨️ Q3: Find departments where highest paid employee earns > 2x the lowest paid
-- YOUR QUERY:

-- COMMAND ----------
-- 🗣️ EXPLAIN: What is a derived table? How is it different from a CTE?
-- YOUR ANSWER:

-- COMMAND ----------
-- MAGIC %md
-- MAGIC ## ✦ Topic 5.3 — Correlated Subqueries

-- COMMAND ----------
-- 📖 STUDY EXAMPLE — runs once per row in outer query
SELECT name, salary, dept_id
FROM employees e
WHERE salary > (
    SELECT AVG(salary) FROM employees WHERE dept_id = e.dept_id
);

-- COMMAND ----------
-- ⌨️ Q1: Employees earning more than their own department average (use example above)
-- YOUR QUERY:

-- COMMAND ----------
-- ⌨️ Q2: Customers whose total spend is above average spend in their own city
-- YOUR QUERY:

-- COMMAND ----------
-- ⌨️ Q3: For each product, show if its price is above or below its category average
-- YOUR QUERY:

-- COMMAND ----------
-- 🗣️ EXPLAIN: Why are correlated subqueries slow? How would you rewrite one as a JOIN?
-- YOUR ANSWER:

-- COMMAND ----------
-- MAGIC %md
-- MAGIC ## ✦ Topic 5.4 — IN, NOT IN, EXISTS, NOT EXISTS

-- COMMAND ----------
-- ⌨️ Q1: Find customers who ordered at least one Electronics product (use IN)
-- YOUR QUERY:

-- COMMAND ----------
-- ⌨️ Q2: Find customers who have NEVER placed an order (use NOT EXISTS)
-- YOUR QUERY:

-- COMMAND ----------
-- ⌨️ Q3: Rewrite Q2 using NOT IN — then add a NULL to the subquery and see what breaks
-- YOUR QUERY + COMMENT:

-- COMMAND ----------
-- 🗣️ EXPLAIN: Why is NOT IN dangerous with NULLs? Show the bug.
-- YOUR ANSWER + EXAMPLE:

-- COMMAND ----------
-- MAGIC %md
-- MAGIC ## ✦ Topic 5.5 — Subquery vs JOIN vs CTE

-- COMMAND ----------
-- ⌨️ Q1: Write the SAME query 3 ways: customers with more than 2 completed orders
--        Way 1: subquery  Way 2: JOIN  Way 3: CTE
-- YOUR QUERIES:

-- COMMAND ----------
-- ⌨️ Q2: Add a comment: which version is most readable and why?
-- YOUR COMMENT:

-- COMMAND ----------
-- 🗣️ EXPLAIN: Tradeoffs between subquery, JOIN, CTE — when do you use each?
-- YOUR ANSWER:

-- COMMAND ----------
-- MAGIC %md
-- MAGIC ## ✅ Module 5 Checklist
-- MAGIC | Topic | Done? |
-- MAGIC |-------|-------|
-- MAGIC | 5.1 Scalar Subqueries | ☐ |
-- MAGIC | 5.2 Subqueries in FROM | ☐ |
-- MAGIC | 5.3 Correlated Subqueries | ☐ |
-- MAGIC | 5.4 IN / EXISTS | ☐ |
-- MAGIC | 5.5 Subquery vs JOIN vs CTE | ☐ |
