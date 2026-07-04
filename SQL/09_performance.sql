-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Module 9 — Query Performance
-- MAGIC ---
-- MAGIC No answer keys. This module is more conceptual — apply what you
-- MAGIC learned about correlated subqueries (Module 5) and shuffles (Spark).

-- COMMAND ----------

USE sql_mastery;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 9.1 — Execution Order Recap (why it matters for performance)
-- MAGIC ```
-- MAGIC FROM → JOIN → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
-- MAGIC
-- MAGIC Filtering early (WHERE) is cheaper than filtering late (HAVING)
-- MAGIC because WHERE reduces rows BEFORE the expensive GROUP BY/aggregation
-- MAGIC work happens. HAVING filters AFTER aggregation already ran on
-- MAGIC every row.
-- MAGIC ```

-- COMMAND ----------

-- Q1: This query filters late. Rewrite it to filter as early as possible
-- (move the store filter into WHERE instead of HAVING, if the condition
-- doesn't require aggregation):
-- SELECT store_id, SUM(revenue) as total FROM sales
-- GROUP BY store_id HAVING store_id = 1
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 9.2 — SELECT * vs Explicit Columns

-- COMMAND ----------

-- Q1: Take this query and rewrite selecting ONLY the columns you actually
-- need (name, revenue) instead of SELECT *:
-- SELECT * FROM sales s JOIN products p ON s.product_id = p.product_id
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 9.3 — Reading an EXPLAIN Plan

-- COMMAND ----------

-- STUDY EXAMPLE
EXPLAIN
SELECT st.city, SUM(s.revenue)
FROM sales s JOIN stores st ON s.store_id = st.store_id
GROUP BY st.city;

-- COMMAND ----------

-- Q1: Run EXPLAIN on a query with a correlated subquery (from Module 5.3)
-- vs the JOIN-rewritten version. Paste both plans below as comments and
-- note which has more stages/scans.
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 9.4 — Indexing Concepts (theory — this practice DB has no indexes)
-- MAGIC ```
-- MAGIC Read only, no query needed:
-- MAGIC
-- MAGIC An index is a separate structure that lets the database find rows
-- MAGIC by a column's value WITHOUT scanning every row (like a book's index
-- MAGIC vs reading every page).
-- MAGIC
-- MAGIC Indexes speed up: WHERE, JOIN ON, ORDER BY on indexed columns
-- MAGIC Indexes slow down: INSERT/UPDATE/DELETE (index must be maintained)
-- MAGIC
-- MAGIC Spark/Databricks note: traditional B-tree indexes don't apply the
-- MAGIC same way — instead you get performance from partitioning, Z-ORDER,
-- MAGIC and file pruning. Concept is the same: avoid scanning everything.
-- MAGIC ```

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## 9.5 — CTE Materialization

-- COMMAND ----------

-- Q1: You have a CTE referenced 3 times in the main query. Write a short
-- note (as a SQL comment) on whether you'd expect this to be computed once
-- or three times, and why that matters for a large table.
-- YOUR ANSWER (as comment):


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## EXPLAIN BLOCK
-- MAGIC
-- MAGIC **Q1: Why does filtering in WHERE before a JOIN (when possible) often perform better than filtering after the JOIN?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```
-- MAGIC
-- MAGIC **Q2: Connect this to Spark: how does "filter early" here relate to narrow vs wide transformations and minimizing shuffle size that you learned in spark02?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```
-- MAGIC
-- MAGIC **Q3: Why is SELECT * considered a performance anti-pattern even when it "works fine" on small tables?**
-- MAGIC ```
-- MAGIC Your answer:
-- MAGIC ```

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## Checklist
-- MAGIC | Topic | Done? |
-- MAGIC |-------|-------|
-- MAGIC | 9.1 Execution Order | ☐ |
-- MAGIC | 9.2 SELECT * vs Explicit | ☐ |
-- MAGIC | 9.3 EXPLAIN Plans | ☐ |
-- MAGIC | 9.4 Indexing Concepts | ☐ |
-- MAGIC | 9.5 CTE Materialization | ☐ |

