# Databricks notebook source
# File: 00_data_setup.py
# Run this ONCE. Creates all 6 Delta tables in your workspace.
# After this, all .sql notebooks work directly.

# COMMAND ----------

# MAGIC %md
# MAGIC # ⚙️ SQL Mastery — Data Setup
# MAGIC ### Run this notebook ONCE. Never again.
# MAGIC All 6 tables will be created as Delta tables in your Databricks workspace.

# COMMAND ----------

# Create database
spark.sql("CREATE DATABASE IF NOT EXISTS sql_mastery")
spark.sql("USE sql_mastery")
print("✅ Database: sql_mastery")

# COMMAND ----------

# TABLE 1: customers
customers_data = [
    (1,  "Raj Sharma",      "Mumbai",    28, "Silver", "2020-03-15"),
    (2,  "Priya Mehta",     "Delhi",     34, "Gold",   "2018-07-01"),
    (3,  "Amit Kumar",      "Pune",      22, "Bronze", "2022-11-20"),
    (4,  "Sneha Patel",     "Mumbai",    29, "Gold",   "2019-05-10"),
    (5,  "Dev Nair",        "Bangalore", 31, "Silver", "2021-01-05"),
    (6,  "Aisha Khan",      "Delhi",     26, "Bronze", "2023-02-18"),
    (7,  "Kabir Singh",     "Chennai",   45, "Gold",   "2017-09-30"),
    (8,  "Meera Iyer",      "Mumbai",    38, "Silver", "2016-04-22"),
    (9,  "Rohan Gupta",     "Pune",      24, "Bronze", "2023-08-14"),
    (10, "Nisha Verma",     "Bangalore", 32, "Gold",   "2019-12-01"),
    (11, "Arjun Das",       "Delhi",     27, "Silver", "2021-06-25"),
    (12, "Tanya Roy",       "Mumbai",    41, "Gold",   "2015-11-08"),
    (13, "Siddharth Joshi", "Chennai",   35, "Bronze", "2022-04-17"),
    (14, "Kavya Reddy",     "Hyderabad", 29, "Silver", "2020-09-03"),
    (15, "Manish Tiwari",   "Mumbai",    47, "Gold",   "2014-07-19"),
]

spark.createDataFrame(customers_data,
    ["customer_id","name","city","age","tier","joined_date"]
).write.format("delta").mode("overwrite").saveAsTable("sql_mastery.customers")
print("✅ customers — 15 rows")

# COMMAND ----------

# TABLE 2: orders
orders_data = [
    (1,  1,  "2024-01-10", "completed", 2500.0),
    (2,  1,  "2024-02-15", "completed", 800.0),
    (3,  1,  "2024-03-20", "pending",   1200.0),
    (4,  2,  "2024-01-20", "completed", 5000.0),
    (5,  2,  "2024-02-28", "completed", 3400.0),
    (6,  3,  "2024-03-01", "pending",   1200.0),
    (7,  4,  "2024-01-05", "completed", 7500.0),
    (8,  4,  "2024-02-10", "completed", 2100.0),
    (9,  4,  "2024-03-10", "cancelled", 900.0),
    (10, 5,  "2024-01-15", "completed", 4200.0),
    (11, 5,  "2024-03-20", "pending",   2100.0),
    (12, 7,  "2024-01-25", "completed", 6300.0),
    (13, 7,  "2024-02-14", "completed", 1800.0),
    (14, 7,  "2024-03-05", "completed", 4500.0),
    (15, 8,  "2024-01-30", "completed", 9200.0),
    (16, 8,  "2024-02-20", "cancelled", 500.0),
    (17, 10, "2024-01-08", "completed", 11000.0),
    (18, 10, "2024-02-25", "completed", 3700.0),
    (19, 10, "2024-03-15", "pending",   5600.0),
    (20, 12, "2024-01-12", "completed", 15000.0),
    (21, 12, "2024-02-08", "completed", 8800.0),
    (22, 14, "2024-02-01", "completed", 2300.0),
    (23, 15, "2024-01-18", "completed", 22000.0),
    (24, 15, "2024-03-01", "completed", 9500.0),
    (25, 2,  "2024-03-10", "completed", 6700.0),
]

spark.createDataFrame(orders_data,
    ["order_id","customer_id","order_date","status","total"]
).write.format("delta").mode("overwrite").saveAsTable("sql_mastery.orders")
print("✅ orders — 25 rows")

# COMMAND ----------

# TABLE 3: products
products_data = [
    (1,  "MacBook Pro",         "Electronics", 125000.0, 10),
    (2,  "iPhone 15",           "Electronics", 79000.0,  25),
    (3,  "Samsung Galaxy S24",  "Electronics", 74000.0,  30),
    (4,  "iPad Pro",            "Electronics", 95000.0,  15),
    (5,  "Sony WH-1000XM5",     "Electronics", 29000.0,  40),
    (6,  "Mechanical Keyboard", "Accessories", 8500.0,   55),
    (7,  "Logitech MX Master",  "Accessories", 6500.0,   60),
    (8,  "Dell 27 Monitor",     "Electronics", 28000.0,  20),
    (9,  "Standing Desk",       "Furniture",   35000.0,  8),
    (10, "Ergonomic Chair",     "Furniture",   22000.0,  12),
    (11, "USB-C Hub",           "Accessories", 2500.0,   100),
    (12, "Webcam HD",           "Accessories", 4500.0,   45),
    (13, "NoiseFit Watch",      "Wearables",   8000.0,   35),
    (14, "Fire TV Stick",       "Electronics", 4500.0,   80),
    (15, "Kindle Paperwhite",   "Electronics", 14000.0,  50),
    (16, "Echo Dot",            "Smart Home",  4000.0,   90),
    (17, "Smart Bulb 4-Pack",   "Smart Home",  1800.0,   120),
    (18, "Air Purifier",        "Appliances",  18000.0,  18),
    (19, "Robot Vacuum",        "Appliances",  32000.0,  10),
    (20, "Portable Speaker",    "Electronics", 6000.0,   65),
]

spark.createDataFrame(products_data,
    ["product_id","name","category","price","stock"]
).write.format("delta").mode("overwrite").saveAsTable("sql_mastery.products")
print("✅ products — 20 rows")

# COMMAND ----------

# TABLE 4: order_items
order_items_data = [
    (1,  1,  5,  1, 29000.0),
    (2,  1,  11, 2, 2500.0),
    (3,  2,  6,  1, 8500.0),
    (4,  3,  13, 1, 8000.0),
    (5,  3,  17, 2, 1800.0),
    (6,  4,  1,  1, 125000.0),
    (7,  5,  8,  1, 28000.0),
    (8,  5,  7,  1, 6500.0),
    (9,  6,  13, 1, 8000.0),
    (10, 7,  2,  1, 79000.0),
    (11, 7,  5,  1, 29000.0),
    (12, 8,  4,  1, 95000.0),
    (13, 9,  11, 3, 2500.0),
    (14, 10, 3,  1, 74000.0),
    (15, 11, 16, 2, 4000.0),
    (16, 12, 1,  1, 125000.0),
    (17, 12, 6,  1, 8500.0),
    (18, 13, 14, 2, 4500.0),
    (19, 14, 2,  1, 79000.0),
    (20, 14, 12, 1, 4500.0),
    (21, 15, 1,  1, 125000.0),
    (22, 15, 4,  1, 95000.0),
    (23, 16, 17, 4, 1800.0),
    (24, 17, 1,  1, 125000.0),
    (25, 17, 8,  1, 28000.0),
    (26, 18, 5,  2, 29000.0),
    (27, 19, 9,  1, 35000.0),
    (28, 19, 10, 1, 22000.0),
    (29, 20, 1,  1, 125000.0),
    (30, 20, 4,  1, 95000.0),
    (31, 21, 2,  1, 79000.0),
    (32, 21, 3,  1, 74000.0),
    (33, 22, 6,  2, 8500.0),
    (34, 23, 9,  1, 35000.0),
    (35, 23, 10, 1, 22000.0),
    (36, 23, 1,  1, 125000.0),
    (37, 24, 1,  1, 125000.0),
    (38, 25, 2,  1, 79000.0),
    (39, 25, 5,  1, 29000.0),
]

spark.createDataFrame(order_items_data,
    ["item_id","order_id","product_id","qty","unit_price"]
).write.format("delta").mode("overwrite").saveAsTable("sql_mastery.order_items")
print("✅ order_items — 39 rows")

# COMMAND ----------

# TABLE 5: employees
employees_data = [
    (1,  "Vikram Rao",      1, 120000.0, None, "2017-03-10"),
    (2,  "Anjali Singh",    1, 95000.0,  1,    "2019-07-15"),
    (3,  "Rahul Mehta",     1, 82000.0,  1,    "2020-11-01"),
    (4,  "Divya Nair",      2, 105000.0, None, "2018-05-20"),
    (5,  "Karan Patel",     2, 78000.0,  4,    "2020-08-14"),
    (6,  "Shreya Das",      2, 72000.0,  4,    "2021-03-22"),
    (7,  "Aditya Kumar",    3, 130000.0, None, "2016-09-05"),
    (8,  "Pooja Iyer",      3, 98000.0,  7,    "2019-01-30"),
    (9,  "Nikhil Sharma",   3, 87000.0,  7,    "2020-06-18"),
    (10, "Preethi Reddy",   3, 76000.0,  8,    "2022-02-10"),
    (11, "Suresh Gupta",    4, 88000.0,  None, "2018-11-25"),
    (12, "Rekha Joshi",     4, 71000.0,  11,   "2021-07-08"),
    (13, "Manish Tiwari",   4, 68000.0,  11,   "2022-09-14"),
    (14, "Sonal Verma",     1, 89000.0,  1,    "2020-04-28"),
    (15, "Arjun Bose",      2, 85000.0,  4,    "2021-10-05"),
]

from pyspark.sql.types import StructType, StructField, IntegerType, StringType, DoubleType

schema = StructType([
    StructField("emp_id",     IntegerType()),
    StructField("name",       StringType()),
    StructField("dept_id",    IntegerType()),
    StructField("salary",     DoubleType()),
    StructField("manager_id", IntegerType()),
    StructField("hire_date",  StringType()),
])

spark.createDataFrame(employees_data, schema
).write.format("delta").mode("overwrite").saveAsTable("sql_mastery.employees")
print("✅ employees — 15 rows")

# COMMAND ----------

# TABLE 6: departments
departments_data = [
    (1, "Engineering", "Mumbai",    5000000.0),
    (2, "Product",     "Bangalore", 3500000.0),
    (3, "Data",        "Hyderabad", 4200000.0),
    (4, "Marketing",   "Delhi",     2800000.0),
]

spark.createDataFrame(departments_data,
    ["dept_id","dept_name","location","budget"]
).write.format("delta").mode("overwrite").saveAsTable("sql_mastery.departments")
print("✅ departments — 4 rows")

# COMMAND ----------

# VERIFY everything loaded
print("\n📊 All tables in sql_mastery:\n")
spark.sql("SHOW TABLES IN sql_mastery").show()

print("\n📋 Row counts:\n")
for t in ["customers","orders","products","order_items","employees","departments"]:
    count = spark.sql(f"SELECT COUNT(*) as cnt FROM sql_mastery.{t}").collect()[0]["cnt"]
    print(f"  {t:<15} → {count} rows")

print("\n✅ Setup complete! You can now open any .sql notebook and start querying.")
