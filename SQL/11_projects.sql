-- Databricks notebook source
-- MAGIC %md
-- MAGIC # Module 11 — Capstone Project
-- MAGIC ---
-- MAGIC No answer keys. Combine everything: joins, subqueries, CTEs,
-- MAGIC window functions, string/date functions.
-- MAGIC
-- MAGIC These are written as realistic interview-style prompts —
-- MAGIC including the exact category of question you got in the
-- MAGIC Lowe's interview.

-- COMMAND ----------

USE sql_mastery;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Project 1 — Overstocked Store Report
-- MAGIC For every store, calculate WOS (stock_units/weekly_sales) per product.
-- MAGIC Flag rows as 'OVERSTOCKED' (WOS>15), 'LOW STOCK' (WOS<5), or 'HEALTHY'.
-- MAGIC Show city, product name, WOS, and status — sorted by WOS descending.
-- MAGIC Use a CTE. Watch the integer division gotcha from earlier modules.

-- COMMAND ----------
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Project 2 — Top Product Per City (the classic interview question)
-- MAGIC Find the single highest-revenue product in each city.
-- MAGIC Use ROW_NUMBER + PARTITION BY.

-- COMMAND ----------
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Project 3 — Forecast Fill (the exact Lowe's interview question)
-- MAGIC The forecast table has NULL actual_units for future months.
-- MAGIC Fill NULLs using a moving average of the previous 3 known values.
-- MAGIC Non-null rows should keep their original actual_units value.

-- COMMAND ----------
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Project 4 — Month-over-Month Revenue Growth
-- MAGIC For each store, calculate revenue by month, and the % change vs
-- MAGIC the previous month. Use DATE_TRUNC/DATE_FORMAT + LAG.

-- COMMAND ----------
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Project 5 — Customers/Stores With No Recent Activity
-- MAGIC Find stores that have had NO sales in the last 30 days.
-- MAGIC Use NOT EXISTS (not NOT IN — recall the NULL trap from Module 5.4).

-- COMMAND ----------
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Project 6 — Category Revenue Pivot with Ranking
-- MAGIC Build a pivot of revenue by category per city (like Module 10.3),
-- MAGIC then rank cities by their TOTAL revenue across all categories.

-- COMMAND ----------
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Project 7 — Full Root-Cause Style Query
-- MAGIC A product's weekly_sales dropped. Write a query that:
-- MAGIC 1. Shows current vs previous period revenue per store+product (LAG)
-- MAGIC 2. Flags drops greater than 20%
-- MAGIC 3. Joins in current WOS to show whether the drop is creating an
-- MAGIC    overstock risk
-- MAGIC This should combine a CTE, a JOIN, LAG, and a CASE WHEN — everything
-- MAGIC from Modules 4 through 6 in one query.

-- COMMAND ----------
-- YOUR CODE:


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## Self-Review
-- MAGIC For each project above, before moving on:
-- MAGIC - Did you use WHERE for early filtering where possible? (Module 9)
-- MAGIC - Did you avoid NOT IN where NULLs could exist? (Module 5.4)
-- MAGIC - Did you alias tables clearly, especially in correlated/joined
-- MAGIC   subqueries? (Module 5.3 bug you had before)
-- MAGIC - Did you handle integer division correctly? (stock_units * 1.0 / weekly_sales)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ---
-- MAGIC ## Checklist
-- MAGIC | Project | Done? |
-- MAGIC |---------|-------|
-- MAGIC | 1 Overstocked Store Report | ☐ |
-- MAGIC | 2 Top Product Per City | ☐ |
-- MAGIC | 3 Forecast Fill (Lowe's question) | ☐ |
-- MAGIC | 4 Month-over-Month Growth | ☐ |
-- MAGIC | 5 No Recent Activity | ☐ |
-- MAGIC | 6 Category Pivot + Ranking | ☐ |
-- MAGIC | 7 Full Root-Cause Query | ☐ |

