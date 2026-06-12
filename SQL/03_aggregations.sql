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


select status,count(order_id) as or_count ,(count(total)/(select count(total) from orders))*100 as Perc_total from orders
group by status


-- COMMAND ----------

-- 🗣️ EXPLAIN: Why can't you SELECT a column that isn't in GROUP BY or an aggregate?
--             What rule does SQL enforce here and why?
-- YOUR ANSWER:it wont show us the result if its not in the select
-- SQL enforce to select column in group by which are already in select column


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

select city from customers
group by city
having count(customer_id)>1


-- COMMAND ----------

-- ⌨️ Q2: Find customers who have placed more than 2 orders
-- YOUR QUERY:

select o.customer_id,c.name,count(o.order_id) from orders o 
join customers c
on o.customer_id=c.customer_id
group by o.customer_id,c.name
having count(o.order_id)>2

-- COMMAND ----------

-- ⌨️ Q3: Find product categories where the average price is above 20000
-- YOUR QUERY:
select category,avg(price) from products
group by category
having avg(price)>20000

-- COMMAND ----------

-- 🗣️ EXPLAIN: Write Q2 using WHERE instead of HAVING. Run it. What error do you get?
--             Explain exactly why WHERE cannot be used here.
-- YOUR EXPERIMENT:
select o.customer_id,c.name,count(o.order_id) from orders o 
join customers c
on o.customer_id=c.customer_id
group by o.customer_id,c.name
where count(o.order_id)>2

-- YOUR ANSWER:
-- where cant be used as no filter condition can be applied 


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 3.3 — GROUP BY with CASE WHEN
-- MAGIC > Combine conditional bucketing with aggregation.

-- COMMAND ----------

select * from orders

-- COMMAND ----------

-- ⌨️ Q1: Count of orders by size bucket (Small / Medium / Large)
--        Use CASE WHEN inside GROUP BY
-- YOUR QUERY:


select category,count(category) from(select * , CASE

    when total >= 5000 then "Large"  
    when total < 5000 and total >= 2000 then "Medium" 
    when total < 2000 then "Low" 
    end as category

from orders)
group by category



-- COMMAND ----------

-- ⌨️ Q2: Total revenue for completed vs non-completed orders — show side by side
--        (hint: use SUM with CASE WHEN inside it — called conditional aggregation)
-- YOUR QUERY:

select sum(case when
            status ='completed' then total
            else 0
            end 
)as completed_sum
, sum(case when
            status ='pending' or status ='cancelled'  then total
            else 0
            end 
) as un_completed_sum
from orders



-- COMMAND ----------

select * from employees

-- COMMAND ----------

-- ⌨️ Q3: Count employees by seniority level based on hire year:
--        hired before 2018 → 'Senior'
--        hired 2018–2020   → 'Mid'
--        hired after 2020  → 'Junior'
-- YOUR QUERY:
select case when
    DATE(hire_date) < '2018-01-01' then "Senior"
    when DATE(hire_date)  >='2018-01-01' and DATE(hire_date)  <= '2020-12-31' then "mid"
    when DATE(hire_date)  >='2021-01-01' then "Junior"
    end as seniority_level,
count(name)
from employees
group by seniority_level

-- COMMAND ----------

-- 🗣️ EXPLAIN: What is conditional aggregation? 
--             Show the pattern: SUM(CASE WHEN ... THEN value ELSE 0 END)
-- YOUR ANSWER + EXAMPLE:
-- conditional aggrement when we use aggregation inside a condition that is called conditional aggregation likw we create the condition and aggregate like sum is applied there and then show the results

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 3.4 — SQL Execution Order
-- MAGIC > FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
-- MAGIC > Understanding this explains why certain queries fail.

-- COMMAND ----------

Select * from customers


-- COMMAND ----------

-- ⌨️ Q1: Write one query that uses WHERE, GROUP BY, HAVING, ORDER BY all together
--        Goal: cities with total order revenue > 5000, sorted by revenue desc
-- YOUR QUERY:
select c.city,sum(o.total) from customers c
join orders o on c.customer_id=o.customer_id
group by city
having sum(o.total)>5000
order by sum(o.total) desc



-- COMMAND ----------

-- ⌨️ Q2: Try using a SELECT alias in a WHERE clause — document what happens
-- YOUR EXPERIMENT + COMMENT: 
SELECT city AS location
FROM customers
WHERE city = 'Mumbai';
-- its not applicable as selct applical=ble only after from is apllied so it only takes mumbai as locationa d shows the values

-- COMMAND ----------

-- ⌨️ Q3: Try using a SELECT alias in ORDER BY — does it work in Spark SQL?
--        Then try in HAVING — does that work?
-- YOUR EXPERIMENT + COMMENT:  i dont know how it will work on sql need more clarity on this part i think i know how to get answersof it what will happen with it 
SELECT city AS location
FROM customers
Order by city;

SELECT city AS location
FROM customers
Group by city
Having city="Delhi";

-- COMMAND ----------

-- 🗣️ EXPLAIN: Write out the SQL execution order from memory.
--             Why can you use a SELECT alias in ORDER BY but not WHERE?
-- YOUR ANSWER:from where groupby having  select orderby limit


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✅ Module 3 Checklist
-- MAGIC | Topic | Queries Done? | Explained? |
-- MAGIC |-------|--------------|------------|
-- MAGIC | 3.1 GROUP BY Basics | ✅ | ✅  |
-- MAGIC | 3.2 HAVING | ✅  | ✅  |
-- MAGIC | 3.3 GROUP BY + CASE WHEN | ✅ | ✅  |
-- MAGIC | 3.4 Execution Order | ✅  | ✅  |
-- MAGIC
-- MAGIC **All done → push → move to 04_joins.sql**
