# Databricks notebook source
# /// script
# [tool.databricks.environment]
# environment_version = "5"
# ///
# MAGIC %md
# MAGIC # spark03 — DataFrames
# MAGIC ---
# MAGIC Do this on Databricks, not GCP — serverless handles
# MAGIC DataFrame API fine (unlike sparkContext/RDD work).
# MAGIC No answer keys. Write everything yourself.

# COMMAND ----------

# MAGIC %md
# MAGIC ## 3.1 — Creating DataFrames

# COMMAND ----------

from pyspark.sql.functions import sum

# COMMAND ----------

# STUDY EXAMPLE — 3 ways to create a DataFrame
data = [(1, "Raj", "Mumbai", 5000),
        (2, "Priya", "Delhi", 3000),
        (3, "Amit", "Mumbai", 8000)]
columns = ["customer_id", "name", "city", "spend"]

df = spark.createDataFrame(data, columns)
df.show()
df.printSchema()

# COMMAND ----------

# Q1: Create a DataFrame for 5 products: product_id, name, category, price
# Use spark.createDataFrame(). Show it and print its schema.
# YOUR CODE:
data= [(1,"TV","Electronic",40000),
       (2,"Fridge","Electronic",40000),
       (3,"Sofa","Appliance",40000),
       (4,"Deskto","Electronic",20000),
       (5,"Phone","Electronic",80000)]
columns=['product_id', 'name', 'category', 'price']

df_2 = spark.createDataFrame(data, columns)
df_2.show()
df_2.printSchema()

# COMMAND ----------

# Q2: Read customers.csv into a DataFrame using spark.read
# (hint: spark.read.csv(path, header=True, inferSchema=True))
# Show the first 5 rows and print the schema
# YOUR CODE:
df_customers=spark.read\
    .format('csv')\
    .option('header','true')\
    .load('/Workspace/Users/sahuchandrasekhar4@gmail.com/de_learning/Data/customers.csv')
df_customers.show(5)

# COMMAND ----------

# MAGIC %md
# MAGIC ## 3.2 — Exploring a DataFrame

# COMMAND ----------

# STUDY EXAMPLE
# df_customers.show(5)          # display rows
# df_customers.count()           # row count
# df_customers.columns           # column names
df_customers.dtypes             # column types
df_customers.describe().show()  # summary stats

# COMMAND ----------

# Q1: On your customers DataFrame — print count, columns, dtypes,
# and describe()
# YOUR CODE:
df_customers.count()   

# COMMAND ----------

df_customers.columns  

# COMMAND ----------

df_customers.dtypes 

## Everything is showing as a string as i have not infered the schema here

# COMMAND ----------

# MAGIC %md
# MAGIC ## 3.3 — select() and filter() (SQL SELECT / WHERE equivalent)

# COMMAND ----------

# STUDY EXAMPLE
from pyspark.sql.functions import col

df.select("name", "city").show()
df.filter(col("spend") > 4000).show()
df.filter((col("city") == "Mumbai") & (col("spend") > 3000)).show()

# COMMAND ----------

# Q1: SQL: SELECT name, city FROM customers WHERE spend > 5000
# Write it using DataFrame select() + filter()
# YOUR CODE:
df.select('name','city').filter(df.spend>5000).show()

# COMMAND ----------

# Q2: SQL: SELECT * FROM customers WHERE city = 'Mumbai' OR city = 'Delhi'
# Write the DataFrame equivalent
# YOUR CODE:
df_c=df.filter((df.city == 'Mumbai')| (df.city == 'Delhi'))
df_c.show()

# COMMAND ----------

# MAGIC %md
# MAGIC ## 3.4 — groupBy() and agg()

# COMMAND ----------

# STUDY EXAMPLE
from pyspark.sql.functions import sum as _sum, avg, count

df.groupBy("city").agg(
    _sum("spend").alias("total_spend"),
    avg("spend").alias("avg_spend"),
    count("customer_id").alias("num_customers")
).show()

# COMMAND ----------

# Q1: SQL: SELECT city, COUNT(*), AVG(spend) FROM customers GROUP BY city
# Write the DataFrame equivalent
# YOUR CODE:
df.groupBy("city").agg(avg('spend'),count('*')).show()

# COMMAND ----------

# Q2: Group by city, get total spend, then filter to cities with
# total spend > 10000 (this is a HAVING equivalent — you'll need
# to do groupBy/agg first, THEN filter the result)
# YOUR CODE:

df_2 = df.groupBy("city").agg(sum("spend").alias("total"))

df_2.filter(df_2.total>10000).show()



# COMMAND ----------

# MAGIC %md
# MAGIC ## 3.5 — orderBy()

# COMMAND ----------

# STUDY EXAMPLE
df.orderBy(col("spend").desc()).show()
df.orderBy("city", col("spend").desc()).show()

# COMMAND ----------

# Q1: SQL: SELECT * FROM customers ORDER BY spend DESC LIMIT 3
# Write the DataFrame equivalent (hint: .limit() after orderBy)
# YOUR CODE:



# COMMAND ----------

# MAGIC %md
# MAGIC ## 3.6 — withColumn() (adding/modifying columns)

# COMMAND ----------

# STUDY EXAMPLE
from pyspark.sql.functions import when

df_tiered = df.withColumn(
    "tier",
    when(col("spend") > 6000, "Gold")
    .when(col("spend") > 3000, "Silver")
    .otherwise("Bronze")
)
df_tiered.show()

# COMMAND ----------

# Q1: Add a column 'high_value' that is True if spend > 5000, else False
# YOUR CODE:


# COMMAND ----------

# Q2: Add a column 'name_upper' with the name in uppercase
# (hint: from pyspark.sql.functions import upper)
# YOUR CODE:


# COMMAND ----------

# MAGIC %md
# MAGIC ## 3.7 — join()

# COMMAND ----------

# STUDY EXAMPLE
orders_data = [(1, 101, 1500), (1, 102, 2000), (2, 103, 500)]
orders_df = spark.createDataFrame(orders_data, ["customer_id", "order_id", "amount"])

joined = df.join(orders_df, on="customer_id", how="left")
joined.show()

# COMMAND ----------

# Q1: Inner join your customers df with orders_df on customer_id.
# Select only name, order_id, amount from the result.
# YOUR CODE:


# COMMAND ----------

# Q2: Left join customers to orders. Which customers have NULL order
# columns? What does that tell you about their order history?
# YOUR CODE:


# COMMAND ----------

# MAGIC %md
# MAGIC ---
# MAGIC ## EXPLAIN BLOCK
# MAGIC
# MAGIC **Q1: You spent weeks on RDDs (map, filter, reduceByKey). Why does Spark
# MAGIC also have a separate DataFrame API? What does DataFrame give you that
# MAGIC RDD doesn't?**
# MAGIC ```
# MAGIC Your answer:
# MAGIC ```
# MAGIC
# MAGIC **Q2: DataFrames have a SCHEMA (column names + types) and RDDs don't.
# MAGIC Why does that let Spark optimize DataFrame queries better than
# MAGIC equivalent RDD code? (Hint: think about what Spark can and can't
# MAGIC know in advance without a schema.)**
# MAGIC ```
# MAGIC Your answer:
# MAGIC ```
# MAGIC
# MAGIC **Q3: filter() on a DataFrame vs filter() on an RDD — is filter() still
# MAGIC a narrow transformation here? Does groupBy().agg() still trigger a
# MAGIC shuffle, same as groupByKey/reduceByKey did on RDDs?**
# MAGIC ```
# MAGIC Your answer:
# MAGIC ```
# MAGIC
# MAGIC **Q4: When would you still reach for RDDs instead of DataFrames, given
# MAGIC DataFrames are higher-level and usually faster?**
# MAGIC ```
# MAGIC Your answer:
# MAGIC ```

# COMMAND ----------

# MAGIC %md
# MAGIC ---
# MAGIC ## Checklist
# MAGIC | Topic | Done? |
# MAGIC |-------|-------|
# MAGIC | 3.1 Creating DataFrames | ☐ |
# MAGIC | 3.2 Exploring | ☐ |
# MAGIC | 3.3 select() / filter() | ☐ |
# MAGIC | 3.4 groupBy() / agg() | ☐ |
# MAGIC | 3.5 orderBy() | ☐ |
# MAGIC | 3.6 withColumn() | ☐ |
# MAGIC | 3.7 join() | ☐ |
