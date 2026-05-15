# ⚡ SQL MASTERY ROADMAP
### *From Zero to Pro · Parallel Track with Big Data Engineering*

---

> *"SQL is not a skill you learn once. It's a muscle you build by writing, breaking, and fixing queries every single day."*

---

## 🧭 HOW THIS WORKS

**Topic-based, not day-based.** One topic = done when you pass all 3 layers:

```
👁️  STUDY    →  Read the concept. Understand the why.
⌨️  WRITE    →  Write 3 queries yourself on the dataset.
🗣️  EXPLAIN  →  Answer the explain question in plain English.
```

**One topic per sitting.** Some days you do 2. Some days you do 0. That's fine.  
**Target:** 45–60 days to complete all modules working in parallel with your DE course.

**All practice runs on Databricks** using the shared dataset loaded from your GitHub repo.

---

## 📁 REPO STRUCTURE

```
sql-mastery/
│
├── README.md                     ← This file
├── ROADMAP.md                    ← Full topic-by-topic plan (below)
│
├── data/                         ← All raw CSV datasets
│   ├── customers.csv
│   ├── orders.csv
│   ├── products.csv
│   ├── order_items.csv
│   ├── employees.csv
│   └── departments.csv
│
├── 00_setup/
│   └── load_data.ipynb           ← Run this FIRST in Databricks
│
├── 01_basics/
│   └── 01_basics.ipynb
├── 02_filtering/
│   └── 02_filtering.ipynb
├── 03_aggregations/
│   └── 03_aggregations.ipynb
├── 04_joins/
│   └── 04_joins.ipynb
├── 05_subqueries/
│   └── 05_subqueries.ipynb
├── 06_window_functions/
│   └── 06_window_functions.ipynb
├── 07_ctes/
│   └── 07_ctes.ipynb
├── 08_string_date_functions/
│   └── 08_string_date_functions.ipynb
├── 09_advanced_sql/
│   └── 09_advanced_sql.ipynb
├── 10_performance/
│   └── 10_performance.ipynb
└── 11_projects/
    ├── project01_ecommerce_analysis.ipynb
    ├── project02_hr_analytics.ipynb
    └── project03_open_ended.ipynb
```

---

## 📊 THE DATASET — E-Commerce + HR

Everything runs on **one shared dataset** with 6 tables:

```
customers     → customer_id, name, city, age, tier, joined_date
orders        → order_id, customer_id, order_date, status, total
products      → product_id, name, category, price, stock
order_items   → item_id, order_id, product_id, qty, unit_price
employees     → emp_id, name, dept_id, salary, manager_id, hire_date
departments   → dept_id, dept_name, location, budget
```

Load it once from `00_setup/load_data.ipynb`. Then use `%sql` in every other notebook.

---
---

## 🗺️ THE FULL ROADMAP

---

### 📦 MODULE 1 — SQL Basics
**Target:** ~Days 1–5 · 5 topics

---

#### ✦ Topic 1.1 — SELECT, FROM, LIMIT
> The entry point. Every query starts here.

**Study:** What is SQL? What is a table? What is a query?

**Write these 3 queries:**
```
Q1. Select all columns from customers
Q2. Select only name and city from customers
Q3. Select the first 5 products ordered by price
```

**🗣️ Explain:** *"What is the difference between SELECT * and SELECT col1, col2? Why should you avoid SELECT * in production?"*

---

#### ✦ Topic 1.2 — WHERE Clause
> Filter rows. The most used clause in SQL.

**Study:** Comparison operators, AND, OR, NOT, IN, BETWEEN, LIKE

**Write these 3 queries:**
```
Q1. Find all customers from 'Mumbai'
Q2. Find orders with total between 1000 and 5000
Q3. Find products where name starts with 'L' and price > 20000
```

**🗣️ Explain:** *"What is the difference between IN and BETWEEN? When would you use OR vs IN?"*

---

#### ✦ Topic 1.3 — ORDER BY and DISTINCT
> Sort and deduplicate results.

**Write these 3 queries:**
```
Q1. Get all products sorted by price descending
Q2. Get distinct cities where customers live
Q3. Get top 3 most expensive products per category (order by category ASC, price DESC)
```

**🗣️ Explain:** *"Does ORDER BY happen before or after WHERE in SQL execution? Does it matter?"*

---

#### ✦ Topic 1.4 — NULL Handling
> NULLs are not zero. They are unknown. This trips everyone up.

**Study:** IS NULL, IS NOT NULL, COALESCE, NULLIF, IFNULL

**Write these 3 queries:**
```
Q1. Find orders where customer_id is NULL
Q2. For all employees, show salary — if NULL replace with 0
Q3. Find customers where city is not null AND tier is not null
```

**🗣️ Explain:** *"Why does WHERE salary = NULL not work? What is COALESCE and when do you use it?"*

---

#### ✦ Topic 1.5 — Aliases and Basic Expressions
> Rename columns, do math inside queries.

**Write these 3 queries:**
```
Q1. Show product name and price with 18% GST added as 'price_with_gst'
Q2. Show employee name and salary, rename salary to 'monthly_pay'
Q3. Calculate 'annual_salary' = salary * 12 for all employees
```

**🗣️ Explain:** *"Can you use an alias in a WHERE clause? Try it — what error do you get and why?"*

---

### 📦 MODULE 2 — Filtering & Functions
**Target:** ~Days 6–10 · 5 topics

---

#### ✦ Topic 2.1 — String Functions
> Manipulate text in SQL.

**Study:** UPPER, LOWER, LENGTH, TRIM, SUBSTRING, CONCAT, REPLACE, LIKE patterns

**Write these 3 queries:**
```
Q1. Show all customer names in UPPERCASE, with their city in lowercase
Q2. Find products where the name contains 'pro' (case insensitive)
Q3. Extract the first 3 characters of every customer name as 'code'
```

**🗣️ Explain:** *"What is the difference between LIKE '%abc%' and LIKE 'abc%'? Which is faster and why?"*

---

#### ✦ Topic 2.2 — Date Functions
> Working with dates is a daily DE skill.

**Study:** DATE, YEAR, MONTH, DAY, DATEDIFF, DATE_ADD, NOW(), CURRENT_DATE, strftime (Spark: date_format, datediff, months_between)

**Write these 3 queries:**
```
Q1. Show all orders placed in January 2024
Q2. Calculate how many days ago each order was placed
Q3. Find customers who joined in the last 2 years
```

**🗣️ Explain:** *"In Spark SQL, how do you extract month from a date column? How is it different from standard SQL?"*

---

#### ✦ Topic 2.3 — CASE WHEN
> Conditional logic inside SQL. One of the most powerful tools.

**Write these 3 queries:**
```
Q1. Add a 'price_range' column: <5000='Budget', <30000='Mid', else='Premium'
Q2. Add 'order_size': total<1000='Small', <5000='Medium', else='Large'
Q3. Count how many orders fall into each size category (combine CASE + GROUP BY)
```

**🗣️ Explain:** *"What is the difference between CASE WHEN and IIF/IF? Can you use CASE WHEN inside an aggregation?"*

---

#### ✦ Topic 2.4 — Math Functions
> Numbers are everywhere in data.

**Study:** ROUND, FLOOR, CEIL, ABS, MOD, POWER, SQRT

**Write these 3 queries:**
```
Q1. Round all product prices to the nearest 100
Q2. Find the absolute difference between each order total and the average order total
Q3. Show employees with salary rounded to 2 decimal places and their salary squared
```

**🗣️ Explain:** *"What is the difference between FLOOR and ROUND for negative numbers? Give an example."*

---

#### ✦ Topic 2.5 — Aggregate Functions
> COUNT, SUM, AVG, MIN, MAX — the bread and butter of analytics.

**Write these 3 queries:**
```
Q1. Total revenue, avg order value, min and max order from orders table
Q2. Count of products per category
Q3. Average salary per department (use dept_id for now)
```

**🗣️ Explain:** *"What is the difference between COUNT(*), COUNT(col), and COUNT(DISTINCT col)? When does each give a different result?"*

---

### 📦 MODULE 3 — GROUP BY & HAVING
**Target:** ~Days 11–14 · 4 topics

---

#### ✦ Topic 3.1 — GROUP BY Basics
> Group rows and aggregate them.

**Write these 3 queries:**
```
Q1. Total orders and total revenue per customer
Q2. Number of products per category with avg price
Q3. Count of orders per status (completed, pending, cancelled)
```

**🗣️ Explain:** *"Why can't you SELECT a column that isn't in GROUP BY or an aggregate function? What does this rule protect you from?"*

---

#### ✦ Topic 3.2 — HAVING
> Filter groups — not rows.

**Write these 3 queries:**
```
Q1. Cities with more than 1 customer
Q2. Customers who have placed more than 2 orders
Q3. Product categories where average price > 10000
```

**🗣️ Explain:** *"Write the same query using WHERE instead of HAVING. Does it work? Why or why not? What is the execution order?"*

---

#### ✦ Topic 3.3 — GROUP BY with CASE WHEN
> Combine conditional logic with grouping.

**Write these 3 queries:**
```
Q1. Count of orders by size bucket (Small/Medium/Large) using CASE inside GROUP BY
Q2. Sum of revenue for completed vs non-completed orders side by side
Q3. Count of employees by seniority (Junior/Mid/Senior based on hire year)
```

**🗣️ Explain:** *"Can you GROUP BY a CASE WHEN expression? Show an example that works."*

---

#### ✦ Topic 3.4 — Execution Order of SQL
> Understanding this unlocks why certain queries fail.

**Study:** FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT

**Write these 3 queries:**
```
Q1. A query that uses WHERE, GROUP BY, HAVING, and ORDER BY all together
Q2. Try using a SELECT alias in a WHERE clause — document what happens
Q3. Try using a SELECT alias in a HAVING clause — does it work in Spark SQL?
```

**🗣️ Explain:** *"Draw the SQL execution order. Why can't you use a SELECT alias in WHERE? Why can you sometimes use it in ORDER BY?"*

---

### 📦 MODULE 4 — JOINs
**Target:** ~Days 15–21 · 7 topics
> This is the most important module. Take your time.

---

#### ✦ Topic 4.1 — INNER JOIN
> Only matching rows from both tables.

**Write these 3 queries:**
```
Q1. Show all orders with customer name and city
Q2. Show order_items with product name, qty, unit_price
Q3. Show all orders with customer name AND product names (3-table join)
```

**🗣️ Explain:** *"What rows does INNER JOIN drop? Draw a Venn diagram in a comment."*

---

#### ✦ Topic 4.2 — LEFT JOIN
> All rows from left table, matched rows from right.

**Write these 3 queries:**
```
Q1. All customers and their orders (including customers with no orders)
Q2. All products and their order_items (including products never ordered)
Q3. Find customers who have NEVER placed an order (LEFT JOIN + IS NULL trick)
```

**🗣️ Explain:** *"What is the anti-join pattern? When would you use it in a real pipeline?"*

---

#### ✦ Topic 4.3 — RIGHT JOIN and FULL OUTER JOIN
> Less common but important to understand.

**Write these 3 queries:**
```
Q1. RIGHT JOIN: all orders, even if customer record is missing
Q2. Simulate FULL OUTER JOIN in Spark SQL (UNION of LEFT + RIGHT with DISTINCT)
Q3. Find rows that exist in one table but NOT the other (symmetric difference)
```

**🗣️ Explain:** *"Why is RIGHT JOIN rarely used in practice? How do you convert any RIGHT JOIN to a LEFT JOIN?"*

---

#### ✦ Topic 4.4 — Self JOIN
> A table joined to itself. Used for hierarchies and comparisons.

**Write these 3 queries:**
```
Q1. Show each employee with their manager's name
Q2. Find employees who earn more than their manager
Q3. Find all pairs of employees in the same department (non-self pairs)
```

**🗣️ Explain:** *"What is a self join and when would you use it in real data? Give 2 real-world use cases."*

---

#### ✦ Topic 4.5 — CROSS JOIN
> Every row in table A × every row in table B.

**Write these 3 queries:**
```
Q1. Cross join departments and products (show all combinations)
Q2. Generate a 'size × color' combination table using CROSS JOIN on two value lists
Q3. Use CROSS JOIN to create a date spine (all dates in a range crossed with all products)
```

**🗣️ Explain:** *"When is CROSS JOIN useful vs dangerous? What happens to row count with a CROSS JOIN?"*

---

#### ✦ Topic 4.6 — Multi-table JOINs
> Joining 3+ tables in one query.

**Write these 3 queries:**
```
Q1. customers → orders → order_items → products (4-table join)
     Show: customer name, product name, qty, revenue per line item
Q2. employees → departments → manager (employees self-join)
     Show: emp name, dept name, dept location, manager name
Q3. Find the top product (by revenue) per city of customer
```

**🗣️ Explain:** *"What is the order of JOINs in SQL execution? Does the order of tables in FROM matter for results? For performance?"*

---

#### ✦ Topic 4.7 — JOIN Performance & Pitfalls
> Understanding what goes wrong and why.

**Write these 3 queries:**
```
Q1. A query with a JOIN that accidentally creates row duplication — identify why and fix it
Q2. A query using EXISTS instead of JOIN — find customers who have at least 1 order
Q3. A query using IN with a subquery vs JOIN — compare results and write a comment
```

**🗣️ Explain:** *"What is a JOIN explosion? How does adding a LEFT JOIN to a table with duplicate keys cause unexpected row counts?"*

---

### 📦 MODULE 5 — Subqueries
**Target:** ~Days 22–26 · 5 topics

---

#### ✦ Topic 5.1 — Scalar Subqueries
> A subquery that returns exactly one value.

**Write these 3 queries:**
```
Q1. Find products priced above the average product price
Q2. Show each order with a column 'vs_avg' = (total - avg_total)
Q3. Find the customer who placed the highest single order
```

**🗣️ Explain:** *"What happens if a scalar subquery returns more than 1 row? What error do you get?"*

---

#### ✦ Topic 5.2 — Subqueries in FROM
> Use a subquery as a temporary table.

**Write these 3 queries:**
```
Q1. Get the average of each customer's total spend, then find customers above that average
Q2. Rank products by revenue using a subquery in FROM, then filter top 3
Q3. Find departments where the highest paid employee earns > 2x the lowest paid
```

**🗣️ Explain:** *"What is a derived table? How is it different from a CTE? Which is easier to read?"*

---

#### ✦ Topic 5.3 — Correlated Subqueries
> Subquery references outer query — runs once per row.

**Write these 3 queries:**
```
Q1. Find employees who earn more than the average salary of their own department
Q2. Find customers whose total spend is above the average spend of their city
Q3. For each product, show whether its price is above or below its category average
```

**🗣️ Explain:** *"Why are correlated subqueries slow? What makes them different from regular subqueries? How would you rewrite one using a JOIN?"*

---

#### ✦ Topic 5.4 — IN, NOT IN, EXISTS, NOT EXISTS
> Set-based filtering.

**Write these 3 queries:**
```
Q1. Find customers who have ordered at least one 'Electronics' product (use IN)
Q2. Find customers who have NEVER ordered (use NOT EXISTS)
Q3. Compare: rewrite Q2 using NOT IN — does it give the same result if there are NULLs?
```

**🗣️ Explain:** *"Why is NOT IN dangerous when the subquery can return NULLs? Show the bug with an example."*

---

#### ✦ Topic 5.5 — Subquery vs JOIN vs CTE
> Knowing when to use each.

**Write these 3 queries:**
```
Q1. Write the same query 3 ways: using subquery, JOIN, and CTE
     Goal: customers with more than 2 completed orders
Q2. Which version is most readable? Add a comment explaining your choice.
Q3. A query that can ONLY be done with a subquery (not a simple JOIN)
```

**🗣️ Explain:** *"What are the tradeoffs between subquery, JOIN, and CTE? When would you pick each in a production pipeline?"*

---

### 📦 MODULE 6 — Window Functions
**Target:** ~Days 27–33 · 7 topics
> The most powerful SQL feature for analytics. Spend serious time here.

---

#### ✦ Topic 6.1 — What is a Window Function?
> Aggregation without collapsing rows.

**Study:** OVER(), PARTITION BY, ORDER BY inside OVER

**Write these 3 queries:**
```
Q1. Show each order AND the total revenue of that customer alongside it (don't group)
Q2. Show each employee AND the avg salary of their department alongside it
Q3. Show each product AND the max price in its category alongside it
```

**🗣️ Explain:** *"What is the key difference between GROUP BY and OVER()? Why does OVER() not reduce row count?"*

---

#### ✦ Topic 6.2 — ROW_NUMBER, RANK, DENSE_RANK
> Numbering and ranking rows.

**Write these 3 queries:**
```
Q1. Rank employees by salary within each department (RANK)
Q2. Assign row numbers to orders per customer sorted by date (ROW_NUMBER)
Q3. Find the 2nd highest paid employee in each department (use RANK or DENSE_RANK + filter)
```

**🗣️ Explain:** *"What is the difference between RANK and DENSE_RANK? Give an example with ties where they produce different output."*

---

#### ✦ Topic 6.3 — Running Totals and Moving Averages
> SUM OVER and AVG OVER with ORDER BY.

**Write these 3 queries:**
```
Q1. Running total of order revenue per customer, sorted by order date
Q2. Running count of orders across all time (no partition — global running total)
Q3. 3-row moving average of daily revenue (use ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
```

**🗣️ Explain:** *"What is a window frame? What does ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW mean?"*

---

#### ✦ Topic 6.4 — LAG and LEAD
> Access previous or next row's value.

**Write these 3 queries:**
```
Q1. For each order per customer, show the previous order total using LAG
Q2. Calculate month-over-month revenue change using LAG on monthly totals
Q3. For each employee, show who was hired just before them (LAG on hire_date)
```

**🗣️ Explain:** *"What does LAG return for the first row in a partition? How do you handle that NULL?"*

---

#### ✦ Topic 6.5 — FIRST_VALUE, LAST_VALUE, NTH_VALUE
> Access specific rows within a window.

**Write these 3 queries:**
```
Q1. For each order, show the customer's very first order total using FIRST_VALUE
Q2. For each employee, show the highest salary in their department using FIRST_VALUE with ORDER BY DESC
Q3. Show the 2nd most expensive product in each category using NTH_VALUE
```

**🗣️ Explain:** *"Why does LAST_VALUE often give unexpected results? What frame specification do you need to fix it?"*

---

#### ✦ Topic 6.6 — NTILE and PERCENT_RANK
> Bucketing and percentiles.

**Write these 3 queries:**
```
Q1. Divide customers into 4 equal groups (quartiles) by total spend using NTILE(4)
Q2. Find what percentile each employee's salary falls in using PERCENT_RANK
Q3. Find customers in the top 25% by order count
```

**🗣️ Explain:** *"What is the difference between NTILE and PERCENT_RANK? When would you use each?"*

---

#### ✦ Topic 6.7 — Window Functions in Practice
> Real analytical patterns.

**Write these 3 queries:**
```
Q1. Find the first order ever placed by each customer (ROW_NUMBER trick)
Q2. Find customers whose last order was more than 90 days ago (churn signal)
Q3. Calculate each product's % contribution to its category's total revenue
```

**🗣️ Explain:** *"Write a query that finds the top 3 products by revenue in each category. There are 3 different ways — write them all."*

---

### 📦 MODULE 7 — CTEs & Advanced Querying
**Target:** ~Days 34–38 · 5 topics

---

#### ✦ Topic 7.1 — WITH Clause (CTE)
> Readable, reusable named subqueries.

**Write these 3 queries:**
```
Q1. CTE → total revenue per customer → filter customers with revenue > 5000
Q2. CTE → avg salary per dept → join back to show each employee vs dept avg
Q3. CTE that counts orders per customer, then another CTE that filters top 3 customers
```

**🗣️ Explain:** *"When would you use a CTE over a subquery? What are the limits of CTEs?"*

---

#### ✦ Topic 7.2 — Chained CTEs
> Multiple CTEs in one query.

**Write these 3 queries:**
```
Q1. CTE1: monthly revenue. CTE2: month-over-month change. Final: months where growth > 10%
Q2. CTE1: customer tiers by spend. CTE2: order count per tier. Final: avg order value per tier
Q3. Chain 3 CTEs to build a full customer profile: spend + order_count + last_order_date
```

**🗣️ Explain:** *"Can a CTE reference another CTE defined before it in the same WITH block? Show an example."*

---

#### ✦ Topic 7.3 — UNION and UNION ALL
> Combine result sets vertically.

**Write these 3 queries:**
```
Q1. UNION ALL: combine list of customer names and employee names into one list
Q2. UNION (dedup): find all cities that appear in EITHER customers OR departments
Q3. Use UNION ALL to create a summary: one row per metric (total orders, total revenue, avg order)
```

**🗣️ Explain:** *"What is the difference between UNION and UNION ALL? Which is faster and why? When does UNION give wrong results?"*

---

#### ✦ Topic 7.4 — PIVOT (Spark SQL)
> Turn rows into columns.

**Study:** Spark SQL PIVOT syntax

**Write these 3 queries:**
```
Q1. Pivot order counts: rows=customers, columns=order status (completed/pending/cancelled)
Q2. Pivot revenue: rows=category, columns=month (Jan/Feb/Mar)
Q3. Un-pivot the result of Q1 back to rows using UNPIVOT or STACK
```

**🗣️ Explain:** *"What is the Spark SQL syntax for PIVOT? How is it different from standard SQL?"*

---

#### ✦ Topic 7.5 — Recursive CTEs
> Traverse hierarchies — org charts, category trees.

**Write these 3 queries:**
```
Q1. Use recursive CTE to build the org chart: find all reports under a given manager
Q2. Find the management chain from any employee up to the CEO (depth of hierarchy)
Q3. Count employees at each level of the hierarchy
```

**🗣️ Explain:** *"What is the anchor member and recursive member in a recursive CTE? What stops it from running infinitely?"*

---

### 📦 MODULE 8 — String & Date Functions (Deep Dive)
**Target:** ~Days 39–42 · 4 topics

---

#### ✦ Topic 8.1 — Advanced String Functions
**Write these 3 queries:**
```
Q1. Parse email addresses: extract username and domain into separate columns
Q2. Clean product names: remove special characters, trim, title-case
Q3. Build a full address string from city + pincode + country columns
```
**🗣️ Explain:** *"In Spark SQL, what is the difference between regexp_extract and regexp_replace? Give examples of each."*

---

#### ✦ Topic 8.2 — Advanced Date Functions
**Write these 3 queries:**
```
Q1. Find orders placed on weekends (use DAYOFWEEK)
Q2. Calculate age of each customer from their join date to today
Q3. Group orders by week number and find the busiest week
```
**🗣️ Explain:** *"What is the difference between date_diff and months_between in Spark SQL? When would you use each?"*

---

#### ✦ Topic 8.3 — Type Casting and Conversion
**Write these 3 queries:**
```
Q1. Cast a string column to integer — handle failures gracefully with TRY_CAST
Q2. Convert a Unix timestamp (epoch) to a readable date
Q3. Format dates in DD-MM-YYYY format for a report output
```
**🗣️ Explain:** *"What happens when you CAST a string 'abc' to INTEGER in Spark SQL? How do you handle it safely?"*

---

#### ✦ Topic 8.4 — JSON in SQL (Spark)
> Modern pipelines store semi-structured data in JSON columns.

**Write these 3 queries:**
```
Q1. Extract a field from a JSON string column using get_json_object
Q2. Parse a JSON array column and explode it into rows
Q3. Read a nested JSON and flatten it into a table structure
```
**🗣️ Explain:** *"What is the difference between get_json_object and from_json in Spark SQL? When do you use each?"*

---

### 📦 MODULE 9 — Query Optimization & Performance
**Target:** ~Days 43–47 · 5 topics

---

#### ✦ Topic 9.1 — EXPLAIN and Query Plans
**Write these 3 queries:**
```
Q1. Run EXPLAIN on a simple SELECT — read and explain the output
Q2. Run EXPLAIN on a JOIN query — identify the join strategy used
Q3. Run EXPLAIN on a window function query — find the most expensive step
```
**🗣️ Explain:** *"What does EXPLAIN show you? What is a 'full table scan' and why is it slow?"*

---

#### ✦ Topic 9.2 — Partitioning in Spark SQL
**Write these 3 queries:**
```
Q1. Write a query that filters on order_date — explain why partitioning by date helps
Q2. Create a Delta table partitioned by category — compare query time with and without
Q3. Use SHOW PARTITIONS to list partitions of a table
```
**🗣️ Explain:** *"What is partition pruning? Why does filtering on a non-partition column kill performance?"*

---

#### ✦ Topic 9.3 — Broadcast Joins
**Write these 3 queries:**
```
Q1. Force a broadcast join using /*+ BROADCAST(products) */ hint
Q2. Run the same join without broadcast — check EXPLAIN for difference
Q3. Write a rule: when should you broadcast a table vs not?
```
**🗣️ Explain:** *"What is a broadcast join? When does Spark do it automatically? What is the default size threshold?"*

---

#### ✦ Topic 9.4 — Common Performance Anti-Patterns
**Write these 3 queries:**
```
Q1. Rewrite a correlated subquery as a JOIN (10x faster pattern)
Q2. Rewrite SELECT * with only needed columns — explain why this matters in columnar storage
Q3. Use CACHE TABLE and re-run a query — compare performance
```
**🗣️ Explain:** *"List 5 SQL anti-patterns that kill query performance. For each, write the fix."*

---

#### ✦ Topic 9.5 — Delta Tables and Z-Ordering
**Write these 3 queries:**
```
Q1. Create a Delta table from your orders data
Q2. Run OPTIMIZE and ZORDER BY order_date — explain what it does
Q3. Run VACUUM to clean old files — what does it do?
```
**🗣️ Explain:** *"What is Z-ordering in Delta Lake? How does it improve query performance?"*

---

### 📦 MODULE 10 — Advanced SQL Patterns
**Target:** ~Days 48–52 · 5 topics

---

#### ✦ Topic 10.1 — Slowly Changing Dimensions (SCD)
**Write these 3 queries:**
```
Q1. Detect changed rows between yesterday's snapshot and today's data
Q2. Implement SCD Type 1: update in place when customer address changes
Q3. Implement SCD Type 2: insert new row with effective dates when address changes
```
**🗣️ Explain:** *"What is SCD Type 1 vs Type 2? Which preserves history and why does a DE care?"*

---

#### ✦ Topic 10.2 — MERGE (Upsert)
**Write these 3 queries:**
```
Q1. MERGE new orders into existing orders table — insert if new, update if exists
Q2. MERGE with DELETE: remove rows that no longer exist in source
Q3. MERGE with conditional updates: only update if salary increased
```
**🗣️ Explain:** *"What is a MERGE statement? How is it different from INSERT + UPDATE separately?"*

---

#### ✦ Topic 10.3 — Array and Map Functions (Spark)
**Write these 3 queries:**
```
Q1. EXPLODE an array column into separate rows
Q2. Use COLLECT_LIST to aggregate product names per order into an array
Q3. Use MAP functions to create key-value pairs from two columns
```
**🗣️ Explain:** *"What is the difference between EXPLODE and POSEXPLODE in Spark SQL?"*

---

#### ✦ Topic 10.4 — Analytical Patterns
**Write these 3 queries:**
```
Q1. Cohort analysis: group customers by join month, track their order activity monthly
Q2. Funnel analysis: count customers at each stage (viewed → added to cart → ordered)
Q3. Retention: find customers who ordered in month 1 AND month 2 (retained)
```
**🗣️ Explain:** *"What is cohort analysis and why do product teams care about it? How does SQL enable it?"*

---

#### ✦ Topic 10.5 — Sessionization
**Write these 3 queries:**
```
Q1. Assign a session_id to user events where gap > 30 minutes = new session
Q2. Calculate session duration: time from first to last event in each session
Q3. Find the most common sequence of pages visited per session
```
**🗣️ Explain:** *"What is sessionization in web analytics? How do LAG and conditional SUM help build session IDs?"*

---

### 🏆 MODULE 11 — End-to-End Projects
**Target:** ~Days 53–60

---

#### ✦ Project 1 — E-Commerce Analytics (`project01_ecommerce_analysis.ipynb`)
```
Answer these 10 business questions using SQL only:

1.  Top 5 customers by lifetime value
2.  Month-over-month revenue growth (%)
3.  Best-selling product in each category
4.  Customer churn: who hasn't ordered in 60+ days?
5.  Average time between a customer's first and second order
6.  Revenue contribution % per product (out of total)
7.  Which city drives the most revenue?
8.  Orders with items from more than 2 categories
9.  Top 3 products by revenue in each customer tier
10. Weekly revenue trend for the last 12 weeks
```

---

#### ✦ Project 2 — HR Analytics (`project02_hr_analytics.ipynb`)
```
Answer these 10 business questions using SQL only:

1.  Org chart: full reporting hierarchy from CEO down
2.  Departments where avg salary > company avg
3.  Salary band distribution across departments
4.  Employees who have been here longest in each dept
5.  Pay gap: ratio of max to min salary per department
6.  Which manager has the most direct reports?
7.  Employees earning more than their manager
8.  Year-over-year headcount growth per department
9.  Budget utilization: total salaries vs dept budget
10. Identify departments at risk: avg tenure < 2 years
```

---

#### ✦ Project 3 — Open Ended (`project03_open_ended.ipynb`)
```
You define the question. You write the SQL. You explain the insight.

Pick any 5 questions that weren't in Project 1 or 2.
Write them yourself — like a real analyst would.
Then answer them.
```

---

## ⏱️ TIME ESTIMATE SUMMARY

| Module | Topics | Est. Days |
|--------|--------|-----------|
| 1 — Basics | 5 | 5 |
| 2 — Filtering & Functions | 5 | 5 |
| 3 — GROUP BY & HAVING | 4 | 4 |
| 4 — JOINs | 7 | 7 |
| 5 — Subqueries | 5 | 5 |
| 6 — Window Functions | 7 | 7 |
| 7 — CTEs & Advanced | 5 | 5 |
| 8 — String & Date | 4 | 4 |
| 9 — Optimization | 5 | 5 |
| 10 — Advanced Patterns | 5 | 5 |
| 11 — Projects | 3 | 8 |
| **TOTAL** | **55 topics** | **~60 days** |

---

## 📌 RULES

```
1. Never skip the EXPLAIN question — it's the most important part
2. Write all 3 queries yourself — no copy paste from solutions
3. If stuck → Google → Ask Claude → never leave a cell empty
4. Send any notebook back for review anytime
5. Mark topics ✅ only when all 3 layers are done
```

---

*Built for parallel learning alongside the Big Data Engineering course · May 2026*
