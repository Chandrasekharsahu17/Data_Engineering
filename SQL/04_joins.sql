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
select o.order_id,c.name,c.city from orders o  join customers c
on o.customer_id=c.customer_id;

-- if we want to see all orders

-- select o.order_id,c.name,c.city from orders o  left join customers c
-- on o.customer_id=c.customer_id;

-- COMMAND ----------

-- ⌨️ Q2: Show order_items with product name, qty, unit_price
--        (join order_items with products)
-- YOUR QUERY:
select p.name,o.qty,o.unit_price from order_items o join products p 
on o.product_id=p.product_id



-- COMMAND ----------

select * from order_items,orders,customers,products





-- COMMAND ----------

-- ⌨️ Q3: 3-table join — customers + orders + order_items + products
--        Show: customer name, product name, qty, revenue (qty * unit_price)
-- YOUR QUERY:

select c.name,p.name,o_2.qty,o_2.qty*o_2.unit_price as revenue 
from order_items o_2 join orders o
on o_2.order_id = o.order_id
join customers c 
on o.customer_id=c.customer_id
join products p 
on o_2.product_id=p.product_id



-- COMMAND ----------

-- 🗣️ EXPLAIN: What rows does INNER JOIN drop?
--             Draw a simple Venn diagram in a comment showing what it keeps.
-- YOUR ANSWER:
-- INNER joins ALSO KNOWN AS JOINS keeps only what ever matching in both the tables and if null values are thre it doesnot match with the null values 

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
select c.name ,o.* from customers c left join orders o 
on c.customer_id=o.customer_id

-- COMMAND ----------

-- ⌨️ Q2: All products with their order_items — include products never ordered
-- YOUR QUERY:
select p.name, o.* from products p left join order_items o 
on p.product_id=o.product_id


-- COMMAND ----------

-- ⌨️ Q3: Find customers who have NEVER placed an order
--        (LEFT JOIN + WHERE order_id IS NULL)
-- YOUR QUERY:
select c.name from customers c left join orders o on c.customer_id=o.customer_id
where o.order_id is null

-- COMMAND ----------

-- 🗣️ EXPLAIN: What is the anti-join pattern? Write the pattern and give a real use case.
-- YOUR ANSWER:where we get all records from one table and we dont have matching column to join 

-- all names from customers and no columns from Order_items

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 4.3 — FULL OUTER JOIN and RIGHT JOIN

-- COMMAND ----------

-- ⌨️ Q1: RIGHT JOIN — show all orders even if customer record is missing
-- YOUR QUERY:
select o.*,c.name from customers c right join orders o 
on o.customer_id=o.customer_id


-- COMMAND ----------

-- ⌨️ Q2: FULL OUTER JOIN — all customers + all orders (even unmatched on both sides)
--        Spark SQL supports FULL OUTER JOIN directly
-- YOUR QUERY:i have not learnt spark sql i will write normal sql
select c.*, o.* from customers c full join orders o 
on c.customer_id=o.customer_id


-- COMMAND ----------

-- ⌨️ Q3: Find rows that exist in customers but NOT orders AND rows in orders but NOT customers
--        (symmetric difference using FULL OUTER JOIN + WHERE)
-- YOUR QUERY:
select c.*, o.* from customers c full join orders o 
on c.customer_id=o.customer_id
where o.order_id is null

-- COMMAND ----------

-- 🗣️ EXPLAIN: Why is RIGHT JOIN rarely used in practice?
--             How do you convert any RIGHT JOIN to a LEFT JOIN?
-- YOUR ANSWER:which eve table comes in left and we can coniser all keys from there so mostly we use left join not right (guess)


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
select e.name,m.name as manager from employees e
left join employees m on e.manager_id=m.emp_id

-- COMMAND ----------

-- ⌨️ Q2: Find employees who earn MORE than their manager
-- YOUR QUERY:
SELECT
    e.name        AS employee,
    e.salary      AS emp_salary,
    m.name        AS manager,
    m.salary      AS mgr_salary
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id
where e.salary > m.salary;


-- COMMAND ----------

-- ⌨️ Q3: Find all pairs of employees in the same department
--        (avoid duplicates — only show where e1.emp_id < e2.emp_id)
-- YOUR QUERY:
select * from employees

-- COMMAND ----------

-- 🗣️ EXPLAIN: What is a self join and when would you use it?
--             Give 2 real-world scenarios beyond org charts.
-- YOUR ANSWER:when we join a table witht the same table and when we need info from same table 
-- lets say this managaer wala table and another would be total person in school lets say children and parents in same table and children parents id is also in same row but name is in different column and we want to map how many childern are studying from each parents 


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 4.5 — CROSS JOIN

-- COMMAND ----------

-- ⌨️ Q1: Cross join departments and products — show all combinations
--        How many rows do you get? Why?
-- YOUR QUERY + COMMENT: 80 rows will be result
select * from products p join departments 


-- COMMAND ----------

-- ⌨️ Q2: Create a size × tier combination list using VALUES
SELECT sizes.size, tiers.tier
FROM (VALUES ('S'), ('M'), ('L'), ('XL')) AS sizes(size)
CROSS JOIN (VALUES ('Bronze'), ('Silver'), ('Gold')) AS tiers(tier)
ORDER BY sizes.size, tiers.tier;
-- Now write your OWN cross join combining two real tables

-- YOUR QUERY:
SELECT Phones.Phone, colours.colour
FROM (VALUES ('Iphone 16'), ('Iphone 17'), ('Iphone 17 Pro'), ('IPhone SliM')) AS Phones(Phone)
CROSS JOIN (VALUES ('white'), ('red'), ('Black')) AS colours(colour)
ORDER BY Phones.Phone, colours.colour;


-- COMMAND ----------

-- 🗣️ EXPLAIN: When is CROSS JOIN useful vs dangerous?
--             What happens to row count: table A (100 rows) CROSS JOIN table B (50 rows)?
-- YOUR ANSWER:it is useful when we need a lot of result like multipication on every row with other row like thsirt a with all size we need rows and it is danagerous it can generate very much rows our can generate a vast amount of storage
-- 5000 rows will be generated


-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## ✦ Topic 4.6 — Multi-table JOINs

-- COMMAND ----------

-- ⌨️ Q1: 4-table join: customers → orders → order_items → products
--        Show: customer name, product name, qty, line_total (qty * unit_price)
-- YOUR QUERY:
select c.name,p.name,o_2.qty,o_2.qty*o_2.unit_price as revenue 
from order_items o_2 join orders o
on o_2.order_id = o.order_id
join customers c 
on o.customer_id=c.customer_id
join products p 
on o_2.product_id=p.product_id

-- COMMAND ----------

-- ⌨️ Q2: employees → departments → manager (self join)
--        Show: employee name, dept name, dept location, manager name
-- YOUR QUERY:
select e.name,d.dept_name,m.name as manager_name from employees e
left join departments d on e.dept_id=d.dept_id
left join employees m on e.manager_id=m.emp_id

-- COMMAND ----------

-- ⌨️ Q3: Find the top product by total revenue per city
--        (customers → orders → order_items → products, group, rank)
-- YOUR QUERY:
select p.name ,c.city,sum(o_2.qty * o_2.unit_price) as revenue from customers c
join orders o on c.customer_id=o.customer_id
join order_items o_2 on o.order_id=o_2.order_id
join products p on o_2.product_id=p.product_id
group by c.city,p.name
order by city,revenue desc

-- COMMAND ----------

-- 🗣️ EXPLAIN: Does the ORDER of tables in FROM/JOIN matter for results?
--             Does it matter for performance in Spark? Why?
-- YOUR ANSWER:yes it matters a lot left side of join the rightside of join decide which table to take completely


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
-- MAGIC | 4.1 INNER JOIN | ✅ | ✅  |
-- MAGIC | 4.2 LEFT JOIN | ✅  | ✅  |
-- MAGIC | 4.3 FULL OUTER / RIGHT | ✅ | ✅  |
-- MAGIC | 4.4 Self JOIN | ✅  | ✅  |
-- MAGIC | 4.5 CROSS JOIN | ✅ | ✅  |
-- MAGIC | 4.6 Multi-table JOINs | ✅  | ✅  |
-- MAGIC | 4.7 Pitfalls & EXISTS | ☐ | ☐ |
-- MAGIC
-- MAGIC **All done → push → 05_subqueries.sql**
