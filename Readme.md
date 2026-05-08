# ⚡ THE BIG DATA ENGINEER PLAYBOOK

### *Your personal guide to going from learner → builder*

-----

> *“You don’t rise to the level of your goals. You fall to the level of your systems.”*
> — James Clear

-----

## 🧭 HOW THIS WORKS

Forget daily quotas. Forget streaks. Here’s the only rule:

**A topic is DONE when you pass all 3 layers.**

```
 LAYER 1 — 👁️  WATCH      Understand the concept. Take mental notes.
 LAYER 2 — ⌨️  BUILD      Retype the code from scratch. No copy-paste.
 LAYER 3 — 🗣️  EXPLAIN    Write 3–5 lines at the top of your notebook in plain English.
```

Before starting anything new → open your **last notebook** and run it cold for 10 min.
That’s your revision. No flashcards needed.

**Practice is tied to topics, not days.** 2–3 focused tasks per topic beats 5 random questions daily. Every time.

-----

## 📊 YOUR PROGRESS SNAPSHOT

```
 ✅  DONE          ████████░░░░░░░░░░░░  Python Core + NumPy + Pandas
 📘  KNOW BASICS   ██░░░░░░░░░░░░░░░░░░  MySQL
 🔥  UP NEXT       ░░░░░░░░░░░░░░░░░░░░  Python for Data Eng → Big Data → Spark → Cloud
```

|Phase|What You’re Learning       |Status      |
|:---:|---------------------------|:----------:|
|4    |Python for Data Engineering|🔥 Start Here|
|5    |SQL Deep Dive              |⬜           |
|6    |Big Data Fundamentals      |⬜           |
|7    |Hadoop + HDFS              |⬜           |
|8    |MapReduce                  |⬜           |
|9    |YARN                       |⬜           |
|10   |Functional Programming     |⬜           |
|11   |Spark Core                 |⬜           |
|12   |Spark SQL                  |⬜           |
|13   |Spark Caching              |⬜           |
|14   |Spark Architecture         |⬜           |
|15   |Spark Projects             |⬜           |
|16   |Hive                       |⬜           |
|17   |Kafka                      |⬜           |
|18   |Docker                     |⬜           |
|19   |Airflow + ETL Pipeline     |⬜           |
|20   |Databricks                 |⬜           |
|21   |Azure End-to-End Project   |⬜           |
|22   |Azure Synapse              |⬜           |

-----

-----

## 🐍 PHASE 4 — Python for Data Engineering

### *Finish what you started. This unlocks everything.*

> The Pandas + analysis skills here are what you’ll use every single day in Spark.
> Don’t skip the SQLite and Logging — they show up in real pipelines constantly.

-----

### 📓 `py07_data_manipulation.ipynb`

**Topics:** Data Manipulation & Analysis · Data Source Reading

- [ ] 👁️ Watch: Data Manipulation & Analysis (25 min)
- [ ] 👁️ Watch: Data Source Reading (15 min)
- [ ] ⌨️ Build: Load a CSV → filter rows → group by a column → compute mean/sum → export result
- [ ] ⌨️ Build: Read the same data from JSON and Excel. Compare the approach.
- [ ] 🗣️ Explain at top of notebook: *“What is the difference between .loc and .iloc? When do I use groupby vs pivot_table?”*

**Practice Tasks**

```
1. Load any dataset (use Kaggle's Titanic CSV). Find avg age by Pclass.
2. Read a JSON file into a DataFrame. Filter rows where a column > threshold.
3. Export the cleaned DataFrame to a new CSV.
```

-----

### 📓 `py08_sqlite_logging.ipynb`

**Topics:** Python with SQLite · Logging · Multiple Loggers · Real World Logging

- [ ] 👁️ Watch: Python with SQLite (17 min)
- [ ] 👁️ Watch: Logging in Python (15 min)
- [ ] 👁️ Watch: Logging with Multiple Loggers (5 min)
- [ ] 👁️ Watch: Logging — Real World Examples (8 min)
- [ ] ⌨️ Build: Create a SQLite DB → create a table → insert 5 rows → query with WHERE clause
- [ ] ⌨️ Build: Add a logger to your SQLite script that logs every query to a file
- [ ] 🗣️ Explain: *“Why use SQLite over a CSV? What does a logger handler do vs a logger itself?”*

**Practice Tasks**

```
1. Create a 'students' table with name, age, grade. Insert 10 rows. Query top 3.
2. Write a Python function that logs INFO when a row is inserted, ERROR if it fails.
3. Set up 2 loggers: one for DB events, one for app events. Both write to different files.
```

-----

## 🔍 PHASE 5 — SQL Deep Dive

### *Make your MySQL basics bulletproof before Big Data.*

-----

### 📓 `sql01_intermediate.ipynb`

**Topics:** Intermediate SQL Concepts

- [ ] 👁️ Watch: SQL Section Intro + Tutorials
- [ ] ⌨️ Build: Write 10 queries using JOIN, GROUP BY, HAVING, subqueries
- [ ] 🗣️ Explain: *“What is the difference between WHERE and HAVING? When do I use a subquery vs a JOIN?”*

**Practice Tasks**

```
1. Write a query: top 5 customers by total order value using GROUP BY + ORDER BY.
2. Write a self-join query on an employee table (manager-employee relationship).
3. Use a subquery to find all products above average price.
```

-----

-----

## 🌍 PHASE 6 — Big Data Fundamentals

### *Before you touch a cluster — understand WHY it exists.*

> This is theory but don’t rush it. Every architecture decision in Hadoop, Spark, and Kafka makes sense only after this phase. Build strong mental models here.

-----

### 📓 `bigdata01_concepts.ipynb`

**Topics:** What is Big Data · 5 V’s · Distributed Systems · System Design · On-Premise vs Cloud

- [ ] 👁️ Watch: What is Big Data — Practical Example (18 min)
- [ ] 👁️ Watch: 5 V’s of Big Data (22 min)
- [ ] 👁️ Watch: Big Data and Distributed Systems (18 min)
- [ ] 👁️ Watch: Designing a Good Big Data System (11 min)
- [ ] 👁️ Watch: On-Premise vs Cloud (20 min)
- [ ] ⌨️ Build: Draw the 5 V’s with a code cell using `print()` or a markdown table — make it your own cheatsheet
- [ ] 🗣️ Explain: *“Why can’t a single machine handle Big Data? What does ‘distributed’ actually mean?”*

**Practice Tasks**

```
1. In your notebook, write a real-world example for each of the 5 V's (not the textbook ones).
2. Compare AWS S3 vs on-premise HDFS — write 3 pros/cons each in a markdown cell.
3. Sketch (in text/table) what a good Big Data system looks like for an e-commerce company.
```

-----

### 📓 `bigdata02_storage_patterns.ipynb`

**Topics:** DB vs Data Warehouse vs Data Lake · ETL vs ELT · Data Engineer’s Role

- [ ] 👁️ Watch: Database vs Data Warehouse vs Data Lake (29 min)
- [ ] 👁️ Watch: ETL vs ELT (22 min)
- [ ] 👁️ Watch: What Does a Data Engineer Do (18 min)
- [ ] ⌨️ Build: Create a comparison table in markdown: DB / DW / Data Lake — schema, use case, example tools
- [ ] 🗣️ Explain: *“When would I use ETL vs ELT? What does a Data Engineer own that a Data Scientist doesn’t?”*

**Practice Tasks**

```
1. Map Snowflake, Redshift, S3, MySQL, Hive to: DB / Data Warehouse / Data Lake.
2. Design a simple ETL flow (text/diagram) for loading sales data into a warehouse.
3. Write what your day as a Data Engineer might look like (pipeline breaks, ingestion jobs, etc.)
```

-----

-----

## 🐘 PHASE 7 — Hadoop + HDFS

### *Your first distributed system. This is where it gets real.*

> You’ll be working on a real GCP cluster here. Don’t just watch — actually run every command. The muscle memory matters more than the theory.

-----

### 📓 `hadoop01_hdfs_architecture.ipynb`

**Topics:** Hadoop Intro · Properties · Ecosystem · HDFS Concepts · Architecture · Blocks · Replication · Rack Awareness

- [ ] 👁️ Watch: Introduction to Hadoop (6 min)
- [ ] 👁️ Watch: Properties of Hadoop (10 min)
- [ ] 👁️ Watch: Hadoop Ecosystem (38 min)
- [ ] 👁️ Watch: Intro to HDFS & Terminology (23 min)
- [ ] 👁️ Watch: HDFS Architecture (16 min)
- [ ] 👁️ Watch: Blocks in HDFS (12 min)
- [ ] 👁️ Watch: Replication Factor (10 min)
- [ ] 👁️ Watch: Rack Awareness (8 min)
- [ ] ⌨️ Build: Document the full HDFS read/write flow as a step-by-step numbered list in your notebook
- [ ] 🗣️ Explain: *“What is a NameNode vs DataNode? What happens if the NameNode goes down?”*

**Practice Tasks**

```
1. Draw HDFS architecture (text/ASCII): show NameNode, 3 DataNodes, blocks, replication.
2. Calculate: if block size = 128MB and replication = 3, how much space does a 1GB file use?
3. Explain rack awareness to a 10 year old — write it in a markdown cell.
```

-----

### 📓 `hadoop02_fault_tolerance.ipynb`

**Topics:** Node Failure · Temporary/Permanent DataNode Failure · Secondary NameNode · Standby NameNode · HA Architecture · Write & Read Requests

- [ ] 👁️ Watch: DataNode Failure — Temporary (12 min)
- [ ] 👁️ Watch: DataNode Failure — Permanent (14 min)
- [ ] 👁️ Watch: Secondary Name Node (17 min)
- [ ] 👁️ Watch: Standby Name Node (11 min)
- [ ] 👁️ Watch: Hadoop HA Architecture (20 min)
- [ ] 👁️ Watch: Data Write in HDFS (23 min)
- [ ] 👁️ Watch: Read Request in HDFS (11 min)
- [ ] ⌨️ Build: Write out the full data write pipeline in steps. Then the full read pipeline. Compare them.
- [ ] 🗣️ Explain: *“What is the difference between Secondary NameNode and Standby NameNode? Most people get this wrong.”*

**Practice Tasks**

```
1. Explain what happens step-by-step when a DataNode fails mid-write.
2. What is the role of the JournalNode in HA? Write 3 sentences.
3. Compare Active NameNode vs Standby NameNode in a 2-column table.
```

-----

### 📓 `hadoop03_cluster_commands.ipynb`

**Topics:** GCP Cluster Setup · Linux Commands · HDFS Commands

- [ ] 👁️ Watch: Create GCP Account (24 min)
- [ ] 👁️ Watch: GCP Hadoop Cluster Creation (29 min)
- [ ] 👁️ Watch: Exploring Hadoop Cluster (24 min)
- [ ] 👁️ Watch: GCP Cluster Best Practices (4 min)
- [ ] 👁️ Watch: Linux Commands 1 & 2 (~60 min)
- [ ] 👁️ Watch: HDFS Commands (30 min)
- [ ] ⌨️ Build: Create a cheatsheet cell with every HDFS command you used + what it does
- [ ] ⌨️ Build: Run at least 10 HDFS commands on your cluster. Screenshot or paste outputs into notebook.
- [ ] 🗣️ Explain: *“What is the difference between `hdfs dfs` and `hadoop fs`? Which commands do I use daily?”*

**Practice Tasks**

```
1. Upload a local file to HDFS → list it → check its block info → delete it.
2. Create a directory structure in HDFS: /user/yourname/data/raw/
3. Write a mini Linux cheatsheet: 15 commands you'll use on a cluster (ls, grep, cat, chmod, etc.)
```

-----

-----

## 🔀 PHASE 8 — MapReduce

### *Understand the engine Spark was built to replace.*

> MapReduce is “old” but understanding it deeply is why Spark will make perfect sense to you.

-----

### 📓 `mapreduce01_concepts.ipynb`

**Topics:** Distributed Processing · MapReduce Introduction · MR & Cluster

- [ ] 👁️ Watch: Intro to Distributed Processing (12 min)
- [ ] 👁️ Watch: MapReduce Introduction (17 min)
- [ ] 👁️ Watch: MapReduce & Cluster (12 min)
- [ ] ⌨️ Build: Write the Map and Reduce steps for a word count problem using plain Python dicts (simulate it)
- [ ] 🗣️ Explain: *“What is shuffling? Why is it the most expensive step in MapReduce?”*

**Practice Tasks**

```
1. Simulate MapReduce word count in pure Python — map() then reduce() manually.
2. Draw the full MR flow: Input → Split → Map → Shuffle → Reduce → Output.
3. What is a Combiner and why does it exist? Write an analogy.
```

-----

### 📓 `mapreduce02_practicals.ipynb`

**Topics:** MR Practicals · 1/2 Reducers · Combiner · 0 Reducer · Big Log File · Input Split

- [ ] 👁️ Watch: MR Practical Part 1 & 2 (~40 min)
- [ ] 👁️ Watch: MR with 1 Reducer (40 min)
- [ ] 👁️ Watch: MR with 2 Reducers (29 min)
- [ ] 👁️ Watch: Combiner in MR (13 min)
- [ ] 👁️ Watch: MR with 0 Reducer (16 min)
- [ ] 👁️ Watch: MR on Big Log File (21 min)
- [ ] 👁️ Watch: Input Split in MR (7 min)
- [ ] ⌨️ Build: Run the word count MR job on your GCP cluster. Then run with 2 reducers. Compare output.
- [ ] 🗣️ Explain: *“When would I use 0 reducers? What changes when I increase reducers from 1 to 2?”*

**Practice Tasks**

```
1. Run MR job on a log file → extract ERROR lines → count by error type.
2. Add a Combiner to your word count. Check if output changes. Why or why not?
3. Change reducer count to 0. What gets skipped? Document your observation.
```

-----

-----

## 🧶 PHASE 9 — YARN

### *The traffic controller of your cluster.*

-----

### 📓 `yarn01_resource_management.ipynb`

**Topics:** YARN Introduction · Components · Analogy · Step-by-Step Process

- [ ] 👁️ Watch: YARN Introduction (6 min)
- [ ] 👁️ Watch: Components of YARN (22 min)
- [ ] 👁️ Watch: YARN Analogy (6 min)
- [ ] 👁️ Watch: YARN Process Step by Step (28 min)
- [ ] ⌨️ Build: Map the YARN components (ResourceManager, NodeManager, ApplicationMaster, Container) to a restaurant analogy in your own words
- [ ] 🗣️ Explain: *“What does ApplicationMaster do that ResourceManager doesn’t? Where does your code actually run?”*

**Practice Tasks**

```
1. Write the step-by-step of what happens when you submit a Spark job to YARN.
2. Compare YARN to a traditional job scheduler. What problem did YARN solve?
3. What happens if the NodeManager on one node crashes during a job?
```

-----

-----

## ⚗️ PHASE 10 — Functional Programming

### *The mindset shift that makes Spark feel natural.*

-----

### 📓 `fp01_hof_lambda_map_filter.ipynb`

**Topics:** Higher Order Functions · Lambda · Map / Filter / Reduce

- [ ] 👁️ Watch: Higher Order Functions (27 min)
- [ ] 👁️ Watch: Lambda Functions (12 min)
- [ ] 👁️ Watch: Map, Filter and Reduce (17 min)
- [ ] ⌨️ Build: Rewrite 3 `for` loops using `map()`, `filter()`, and `reduce()` each
- [ ] ⌨️ Build: Write a HOF that takes a function as argument and applies it to a list
- [ ] 🗣️ Explain: *“Why does Spark use functional programming? What is lazy evaluation in this context?”*

**Practice Tasks**

```
1. Given a list of salaries, use map() to apply 10% raise, filter() to keep > 50k, reduce() to total.
2. Write a function compose(f, g) that returns f(g(x)) — function composition.
3. Rewrite the above using lambda functions only (no def).
```

-----

-----

## ⚡ PHASE 11 — Apache Spark Core

### *The most important phase in this entire course. Take your time here.*

> Spark is your primary tool as a Data Engineer. Don’t rush. Each notebook here is a building block. If you understand RDDs deeply, DataFrames will feel easy.

-----

### 📓 `spark01_introduction.ipynb`

**Topics:** Spark Intro · Common Questions · Limitations of MR · Spark Features · Ecosystem

- [ ] 👁️ Watch: Spark Introduction (11 min)
- [ ] 👁️ Watch: Spark Common Questions (29 min)
- [ ] 👁️ Watch: Limitations of MapReduce (8 min)
- [ ] 👁️ Watch: What is Spark & Its Features (16 min)
- [ ] 👁️ Watch: Spark Ecosystem (10 min)
- [ ] ⌨️ Build: Create a side-by-side comparison table: MapReduce vs Spark (speed, storage, API, fault tolerance)
- [ ] 🗣️ Explain: *“Why is Spark faster than MapReduce? What does ‘in-memory computation’ actually mean?”*

**Practice Tasks**

```
1. List 5 real use cases where you'd pick Spark over MapReduce.
2. Name all Spark ecosystem components and write 1-line descriptions.
3. What does the Spark Driver do vs an Executor? Draw it.
```

-----

### 📓 `spark02_rdd_core.ipynb`

**Topics:** What is RDD · How Spark Reads Data · Partitioning · RDD Operations Pt1 & Pt2 · Transformation vs Action · Lazy Evaluation

- [ ] 👁️ Watch: What is Spark RDD (12 min)
- [ ] 👁️ Watch: How Spark Reads Data (17 min)
- [ ] 👁️ Watch: Spark Read Data & Partitioning (19 min)
- [ ] 👁️ Watch: Spark RDD Operations Pt 1 & 2 (~41 min)
- [ ] 👁️ Watch: Transformation vs Action (17 min)
- [ ] 👁️ Watch: Why Is Spark Lazy (16 min)
- [ ] ⌨️ Build: Create an RDD → apply map, filter, flatMap → collect results → count
- [ ] ⌨️ Build: Show that Spark does nothing until an action is called (use `.explain()` or print DAG)
- [ ] 🗣️ Explain: *“What is an RDD partition? What is a DAG and why does Spark build one before executing?”*

**Practice Tasks**

```
1. Create RDD from a list of 100 numbers. Filter evens. Square them. Sum all. (1 chain)
2. Load a text file as RDD. Count unique words. Find the top 10 most frequent.
3. Show the difference between map() and flatMap() with a concrete example.
```

-----

### 📓 `spark03_transformations.ipynb`

**Topics:** Narrow vs Wide Transformations · Jobs Stages Tasks in UI · GroupByKey vs ReduceByKey · Repartition vs Coalesce

- [ ] 👁️ Watch: Narrow vs Wide Transformations (25 min)
- [ ] 👁️ Watch: Jobs, Stages & Tasks in Spark UI (22 min)
- [ ] 👁️ Watch: GroupByKey vs ReduceByKey Pt 1 & 2 (~39 min)
- [ ] 👁️ Watch: Increasing/Decreasing Partitions (12 min)
- [ ] 👁️ Watch: Repartition vs Coalesce (16 min)
- [ ] ⌨️ Build: Run a `groupByKey` job AND a `reduceByKey` job on same data. Compare shuffle in Spark UI.
- [ ] ⌨️ Build: Repartition an RDD to 8 parts. Then coalesce to 4. Check partition counts at each step.
- [ ] 🗣️ Explain: *“Why is groupByKey dangerous? When would I ever use repartition vs coalesce?”*

**Practice Tasks**

```
1. Write a word count using groupByKey. Then rewrite with reduceByKey. Compare performance.
2. Create an RDD with 2 partitions → repartition to 10 → coalesce to 5. Print partition count.
3. Identify which transformations cause a shuffle. List them all.
```

-----

### 📓 `spark04_dataframes.ipynb`

**Topics:** Higher Level APIs · DataFrame Intro · Reading from HDFS · Schema Enforcement · Read Modes · Write in Spark · Spark Operations · Data Types · Date Types

- [ ] 👁️ Watch: Higher Level APIs — DataFrame & Tables (~22 min)
- [ ] 👁️ Watch: DataFrames in Spark (9 min)
- [ ] 👁️ Watch: Reading from HDFS (20 min)
- [ ] 👁️ Watch: Spark Read — Transformation or Action (19 min)
- [ ] 👁️ Watch: Schema Enforcement (21 min)
- [ ] 👁️ Watch: Read Modes (16 min)
- [ ] 👁️ Watch: Write in Spark (12 min)
- [ ] 👁️ Watch: Spark Operations (28 min)
- [ ] 👁️ Watch: Handling Data Types in PySpark (22 min)
- [ ] 👁️ Watch: Handling Date Types (25 min)
- [ ] ⌨️ Build: Read CSV → enforce schema manually → select, filter, groupBy, agg → write as Parquet
- [ ] ⌨️ Build: Try all 3 read modes (PERMISSIVE, DROPMALFORMED, FAILFAST) on a corrupt CSV
- [ ] 🗣️ Explain: *“Why should I always define schema explicitly? What is the cost of inferSchema=True?”*

**Practice Tasks**

```
1. Read a CSV with 3 corrupt rows. Try each read mode. Document what happens.
2. Read a CSV → cast age column to IntegerType → filter nulls → write to Parquet partitioned by city.
3. Work with a date column: parse string → extract year/month/day → filter last 30 days.
```

-----

### 📓 `spark05_execution.ipynb`

**Topics:** Executing Code in Spark · Word Count · Ways to Run Spark · Data Generation · Project Steps

- [ ] 👁️ Watch: Executing Code in Spark (29 min)
- [ ] 👁️ Watch: Word Count Program in Spark (16 min)
- [ ] 👁️ Watch: Ways to Run Spark (29 min)
- [ ] 👁️ Watch: Data Generation + Project Steps (18 min)
- [ ] ⌨️ Build: Run word count in 3 ways: spark-shell, spark-submit, notebook
- [ ] 🗣️ Explain: *“When do I use spark-submit vs a notebook? What is local mode vs cluster mode?”*

**Practice Tasks**

```
1. Run the same word count job using spark-shell and then spark-submit. Note differences.
2. Generate a synthetic dataset of 10,000 rows using Python/Faker. Load it into Spark.
3. List the ways to run Spark and when you'd pick each one.
```

-----

-----

## 🗃️ PHASE 12 — Spark SQL

### *SQL meets distributed computing.*

-----

### 📓 `sparksql01_tables.ipynb`

**Topics:** Spark Tables · Temp Tables · Global Temp Tables · Persistent Tables · Spark SQL · Managed vs External · Creating DataFrames

- [ ] 👁️ Watch: Spark Tables (6 min)
- [ ] 👁️ Watch: Temporary Tables (10 min)
- [ ] 👁️ Watch: Global Temporary Tables (10 min)
- [ ] 👁️ Watch: Persistent Tables (15 min)
- [ ] 👁️ Watch: Spark SQL (16 min)
- [ ] 👁️ Watch: Managed vs External Tables (28 min)
- [ ] 👁️ Watch: Creating DataFrames (13 min)
- [ ] ⌨️ Build: Create a temp view → query it with SQL → create a global temp view → access from another session
- [ ] ⌨️ Build: Create a managed table AND an external table. Drop both. See what happens to the data.
- [ ] 🗣️ Explain: *“When do I use SQL vs DataFrame API in Spark? What’s the performance difference?”*

**Practice Tasks**

```
1. Load CSV → createOrReplaceTempView → run 5 SQL queries (filter, join, group, having, order).
2. Create a managed table. Drop it. Check HDFS — is the data gone?
3. Create an external table pointing to a CSV on HDFS. Drop it. Check HDFS — data still there?
```

-----

-----

## 🧊 PHASE 13 — Spark Caching

### *Speed up your pipelines by being strategic.*

-----

### 📓 `sparkcache01_persist.ipynb`

**Topics:** Persist vs Cache · Difference · Common Questions · RDD Caching · DF Caching · Table Caching

- [ ] 👁️ Watch: Persist and Caching (10 min)
- [ ] 👁️ Watch: Difference Between Persist & Cache (9 min)
- [ ] 👁️ Watch: Common Questions about Caching (17 min)
- [ ] 👁️ Watch: RDD Caching — Small & Big File (~35 min)
- [ ] 👁️ Watch: Caching DataFrame in Spark (16 min)
- [ ] 👁️ Watch: Caching DF — Large File Pt 1 & 2 (~36 min)
- [ ] 👁️ Watch: Spark Table Caching (27 min)
- [ ] ⌨️ Build: Read a large file → run a transformation WITHOUT cache → measure time → cache it → rerun → compare
- [ ] 🗣️ Explain: *“What storage levels exist in Spark? When should I NOT cache?”*

**Practice Tasks**

```
1. Run same aggregation 3 times without cache. Then cache + rerun 3 times. Record timings.
2. Cache an RDD at MEMORY_AND_DISK level. Unpersist it. Verify it's gone in Spark UI.
3. When would caching HURT performance? Write 2 real scenarios.
```

-----

-----

## 🏗️ PHASE 14 — Spark Architecture

### *Understand what’s happening under the hood.*

-----

### 📓 `sparkarch01_cluster_modes.ipynb`

**Topics:** Run Modes · Distributed Nature · Architecture & Components · Standalone Cluster · YARN on Spark · Deployment Modes

- [ ] 👁️ Watch: Spark Architecture — Run Mode (7 min)
- [ ] 👁️ Watch: Distributed Nature & In-Memory Computation (6 min)
- [ ] 👁️ Watch: Spark Architecture & Components (25 min)
- [ ] 👁️ Watch: Spark on Standalone Cluster (19 min)
- [ ] 👁️ Watch: YARN Revision — Components & Step by Step (~50 min)
- [ ] 👁️ Watch: YARN on Spark Architecture + UI (34 min)
- [ ] 👁️ Watch: Standalone vs YARN (7 min)
- [ ] 👁️ Watch: Deployment Modes in Spark (20 min)
- [ ] ⌨️ Build: Draw full Spark on YARN architecture: Driver → AM → RM → NM → Executors → Tasks
- [ ] 🗣️ Explain: *“What is the difference between client mode and cluster mode deployment? Which do I use in production?”*

**Practice Tasks**

```
1. Submit a Spark job in client mode. Then in cluster mode. Observe where the Driver runs.
2. In Spark UI, find: how many executors, how many cores, how many stages for your last job.
3. Compare Standalone vs YARN: when would a company use each?
```

-----

-----

## 🏆 PHASE 15 — Spark Projects

### *This is where you become a practitioner, not just a learner.*

> These projects are the most valuable part of the course. Treat each like a real work assignment. Read the data, question it, clean it, transform it, optimize it.

-----

### 📓 `sparkproj01_customer_pipeline.ipynb`

**Topics:** Read Data · Process Customer Data · Actionable Insights

- [ ] 👁️ Watch: Read Data (12 min)
- [ ] 👁️ Watch: Process Customer Data (32 min)
- [ ] 👁️ Watch: Actionable Insights from Dataset (36 min)
- [ ] ⌨️ Build: Reproduce the full pipeline end-to-end from scratch without looking
- [ ] 🗣️ Explain: *“What transformations did I apply and why? What business question does each insight answer?”*

**Practice Tasks**

```
1. After completing, modify the pipeline to add one new insight not in the video.
2. Write the pipeline output to Parquet partitioned by customer region.
3. Add logging to your pipeline: log row count before and after each transformation.
```

-----

### 📓 `sparkproj02_ecommerce.ipynb`

**Topics:** E-commerce Dataset · Data Exploration · Ingestion · Cleaning · Joins · Window Functions · Aggregations · Enrichment

- [ ] 👁️ Watch: E-commerce Dataset Project (26 min)
- [ ] 👁️ Watch: Data Exploration & Understanding (22 min)
- [ ] 👁️ Watch: Data Ingestion into Dataproc Cluster (18 min)
- [ ] 👁️ Watch: Data Exploration 1 & 2 (~40 min)
- [ ] 👁️ Watch: Data Cleaning & Transformation (70 min)
- [ ] 👁️ Watch: Data Integration — Joining Datasets (26 min)
- [ ] 👁️ Watch: Optimized Joins & Window Functions (20 min)
- [ ] 👁️ Watch: Advanced Data Aggregations (25 min)
- [ ] 👁️ Watch: Advanced Enrichment (30 min)
- [ ] ⌨️ Build: Full pipeline. Ingest → Explore → Clean → Join → Aggregate → Enrich → Write
- [ ] 🗣️ Explain: *“What window functions did I use? What is rank() vs dense_rank() vs row_number()?”*

**Practice Tasks**

```
1. Use a window function to rank top 5 products by sales within each category.
2. Find customers who placed orders in 3 consecutive months (use lag/lead).
3. Join orders + customers + products. Calculate CLV (customer lifetime value) per user.
```

-----

### 📓 `sparkproj03_optimization.ipynb`

**Topics:** Spark Config Optimization · Join Optimization · Data Serving Layer

- [ ] 👁️ Watch: Spark Configuration Optimization (18 min)
- [ ] 👁️ Watch: Join Optimization Strategies (15 min)
- [ ] 👁️ Watch: Data Serving Layer (20 min)
- [ ] ⌨️ Build: Take your e-commerce pipeline → identify the slowest stage in Spark UI → apply one optimization
- [ ] 🗣️ Explain: *“What is broadcast join? When do I use it? What spark configs affect performance most?”*

**Practice Tasks**

```
1. Enable AQE (Adaptive Query Execution). Rerun your pipeline. Did it help?
2. Broadcast a small lookup table in a join. Compare time with and without broadcast.
3. Tune spark.executor.memory and spark.executor.cores. Document the effect.
```

-----

-----

## 🐝 PHASE 16 — Apache Hive

### *SQL on HDFS. The data warehouse layer.*

-----

### 📓 `hive01_basics.ipynb`

**Topics:** Hive Intro · How Hive Works · Architecture · Query Flow · Creating & Querying Tables · Metadata

- [ ] 👁️ Watch: Introduction to Hive (7 min)
- [ ] 👁️ Watch: How Hive Simplifies Big Data (9 min)
- [ ] 👁️ Watch: Common Questions / Misconceptions (22 min)
- [ ] 👁️ Watch: Connecting via Terminal & Beeline (21 min)
- [ ] 👁️ Watch: Creating and Querying Table (24 min)
- [ ] 👁️ Watch: Accessing Metadata in Hive (17 min)
- [ ] 👁️ Watch: Hive Architecture & Components (21 min)
- [ ] 👁️ Watch: Hive Query Flow (10 min)
- [ ] 👁️ Watch: Derby DB in Hive (10 min)
- [ ] ⌨️ Build: Create a Hive table on top of an HDFS file → run 5 queries → check metadata in metastore
- [ ] 🗣️ Explain: *“How is Hive different from a regular database? What is a Hive metastore?”*

**Practice Tasks**

```
1. Create an external Hive table on a CSV in HDFS. Run GROUP BY query.
2. Access Hive metastore. Find table metadata (location, schema, partitions).
3. What happens when you run a Hive query? Draw the execution flow.
```

-----

-----

## 📨 PHASE 17 — Apache Kafka

### *Real-time data. This changes how you think about pipelines.*

-----

### 📓 `kafka01_architecture.ipynb`

**Topics:** Kafka Intro · Why Kafka · Architecture · Ways to Run · Confluent Setup

- [ ] 👁️ Watch: Introduction to Apache Kafka (9 min)
- [ ] 👁️ Watch: Why Kafka & Use Cases (14 min)
- [ ] 👁️ Watch: Kafka Architecture (27 min)
- [ ] 👁️ Watch: Ways to Run Kafka (10 min)
- [ ] 👁️ Watch: Creating Confluent Kafka Cluster (22 min)
- [ ] ⌨️ Build: Document Kafka architecture: Topic → Partition → Offset → Producer → Consumer → Broker
- [ ] 🗣️ Explain: *“What is a consumer group? What is the role of an offset? Why does partition order matter?”*

**Practice Tasks**

```
1. Draw Kafka architecture with 1 topic, 3 partitions, 2 consumers in a group.
2. What happens if consumers > partitions? What if consumers < partitions?
3. Explain Kafka retention and why it's different from a message queue like RabbitMQ.
```

-----

### 📓 `kafka02_producers_consumers.ipynb`

**Topics:** Producing Messages · Multiple Messages · Callback Poll Flush · Consuming Messages · Confluent CLI

- [ ] 👁️ Watch: Producing Messages to Kafka (31 min)
- [ ] 👁️ Watch: Kafka Producers — Multiple Messages (17 min)
- [ ] 👁️ Watch: Callback, Poll and Flush (4 min)
- [ ] 👁️ Watch: Consuming Messages from Kafka (24 min)
- [ ] 👁️ Watch: Confluent Kafka on CLI (35 min)
- [ ] ⌨️ Build: Write a Python Producer → send 50 messages → write a Consumer → read and print all
- [ ] 🗣️ Explain: *“What is poll()? Why must I call flush() before closing a producer?”*

**Practice Tasks**

```
1. Produce 100 JSON messages (fake user events). Consume and print only 'purchase' events.
2. Add a callback to your producer that prints success/failure for each message.
3. Use Confluent CLI to describe your topic, list consumer groups, reset offsets.
```

-----

-----

## 🐳 PHASE 18 — Docker

### *Package once. Run anywhere.*

-----

### 📓 `docker01_containers.ipynb`

**Topics:** What are Containers · Images vs Containers · Docker vs VMs · Installation · Creating Images · Commands · Docker Hub · Docker Compose

- [ ] 👁️ Watch: What are Docker & Containers (12 min)
- [ ] 👁️ Watch: Docker Images vs Containers (6 min)
- [ ] 👁️ Watch: Docker vs Virtual Machines (8 min)
- [ ] 👁️ Watch: Docker Installation (12 min)
- [ ] 👁️ Watch: Creating Docker Image (14 min)
- [ ] 👁️ Watch: Docker Basic Commands (19 min)
- [ ] 👁️ Watch: Push Docker Image to Docker Hub (9 min)
- [ ] 👁️ Watch: Docker Compose (18 min)
- [ ] ⌨️ Build: Write a Dockerfile for a Python script → build it → run it → push to Docker Hub
- [ ] ⌨️ Build: Write a docker-compose.yml with 2 services (e.g. Python app + Postgres)
- [ ] 🗣️ Explain: *“What is a Docker layer? What is the difference between CMD and ENTRYPOINT?”*

**Practice Tasks**

```
1. Dockerize one of your Python scripts. Build → run → verify output.
2. Create docker-compose with Airflow (or any two services). Start both with one command.
3. Write a cheatsheet of 10 docker commands you'll use regularly.
```

-----

-----

## 🌬️ PHASE 19 — Apache Airflow + ETL Pipeline

### *Orchestrate your pipelines like a pro.*

-----

### 📓 `airflow01_dags.ipynb`

**Topics:** Airflow Intro · Key Components · Why Airflow · Astro Setup · First DAG · Math DAG · TaskFlow API

- [ ] 👁️ Watch: Introduction to Apache Airflow (12 min)
- [ ] 👁️ Watch: Key Components of Airflow (8 min)
- [ ] 👁️ Watch: Why Airflow for Big Data & MLOps (7 min)
- [ ] 👁️ Watch: Setting Up Airflow with Astro (15 min)
- [ ] 👁️ Watch: Building First DAG (14 min)
- [ ] 👁️ Watch: Mathematical Calculation DAG (21 min)
- [ ] 👁️ Watch: TaskFlow API (10 min)
- [ ] ⌨️ Build: Write a DAG with 4 tasks. Run it. Inspect logs for each task in Airflow UI.
- [ ] 🗣️ Explain: *“What is a DAG? What is the difference between a task and an operator?”*

**Practice Tasks**

```
1. Create a DAG that: generates data → cleans it → writes to CSV → sends a success log.
2. Rewrite the same DAG using TaskFlow API (@task decorator).
3. Intentionally fail one task. See how Airflow handles retries and alerts.
```

-----

### 📓 `airflow02_etl_pipeline.ipynb`

**Topics:** ETL Intro · Problem Statement · Defining DAG · Postgres Setup · NASA API · Transform & Load · Final ETL · Deployment

- [ ] 👁️ Watch: Introduction to ETL Pipeline (9 min)
- [ ] 👁️ Watch: ETL Problem Statement & Setup (13 min)
- [ ] 👁️ Watch: Defining ETL DAG (10 min)
- [ ] 👁️ Watch: Postgres Table Setup (10 min)
- [ ] 👁️ Watch: NASA API Integration (10 min)
- [ ] 👁️ Watch: Transformation & Load Pipeline (6 min)
- [ ] 👁️ Watch: Final ETL Implementation (14 min)
- [ ] 👁️ Watch: Deployment in Astro Cloud & AWS (23 min)
- [ ] ⌨️ Build: Rebuild the NASA ETL pipeline. Then swap NASA API for any other free API.
- [ ] 🗣️ Explain: *“What does each task in the ETL DAG do? How is error handled at the load step?”*

**Practice Tasks**

```
1. Rebuild the NASA ETL pipeline from scratch without looking.
2. Add a new task: after loading, query Postgres and log the row count.
3. Deploy your DAG to Astro Cloud. Trigger it manually. Check run history.
```

-----

-----

## 🧱 PHASE 20 — Databricks

### *Spark + collaboration + cloud, all in one.*

-----

### 📓 `databricks01_platform.ipynb`

**Topics:** What is Databricks · Why Databricks · UI · Architecture · DBFS · Read Data

- [ ] 👁️ Watch: What is Databricks (5 min)
- [ ] 👁️ Watch: Why Databricks (10 min)
- [ ] 👁️ Watch: Community Account Creation (12 min)
- [ ] 👁️ Watch: Databricks UI Walkthrough (23 min)
- [ ] 👁️ Watch: Databricks Architecture (14 min)
- [ ] 👁️ Watch: Databricks File System (21 min)
- [ ] 👁️ Watch: Read Data in Databricks (12 min)
- [ ] ⌨️ Build: Upload a CSV to DBFS → read it in a notebook → run 5 transformations
- [ ] 🗣️ Explain: *“What is DBFS? How is Databricks different from running Spark yourself on a cluster?”*

**Practice Tasks**

```
1. Upload your e-commerce dataset to DBFS. Read it. Schema-check. Show first 20 rows.
2. Mount an external storage (or use DBFS). Write a Parquet file. Read it back.
3. What is a Databricks cluster? What happens when it auto-terminates?
```

-----

### 📓 `databricks02_projects.ipynb`

**Topics:** Process Customer Data · Customer Order Insights

- [ ] 👁️ Watch: Process Customer Data (32 min)
- [ ] 👁️ Watch: Customer Order Insights (36 min)
- [ ] ⌨️ Build: Rebuild both projects from scratch in Databricks. Same logic, your own code.
- [ ] 🗣️ Explain: *“What did I learn here that I couldn’t do in a local Spark session?”*

**Practice Tasks**

```
1. Add a visualization in Databricks (bar chart of top customers).
2. Schedule your notebook to run daily using Databricks Jobs.
3. Export your results from DBFS to a downloadable CSV.
```

-----

-----

## ☁️ PHASE 21 — Azure End-to-End Project

### *Production-grade. Real cloud. Real pipeline.*

> This is where everything clicks together. ADF ingests → ADLS stores → Databricks transforms → Synapse serves. Bronze → Silver → Gold.

-----

### 📓 `azure01_ingestion.ipynb`

**Topics:** Azure Setup · ADF · ADLS Gen2 · Medallion Architecture · Ingestion (batch + real-time + parameterized)

- [ ] 👁️ Watch: Creating Azure Account (7 min)
- [ ] 👁️ Watch: Azure Cloud Overview (8 min)
- [ ] 👁️ Watch: Project Architecture (11 min)
- [ ] 👁️ Watch: Dataset Overview — Olist Dataset (7 min)
- [ ] 👁️ Watch: SQL DB & Data Ingestion (25 min)
- [ ] 👁️ Watch: Azure Data Factory (19 min)
- [ ] 👁️ Watch: ADLS Gen2 Storage Account (10 min)
- [ ] 👁️ Watch: Medallion Architecture (5 min)
- [ ] 👁️ Watch: Ingestion with ADF (14 min)
- [ ] 👁️ Watch: Real Time Ingestion with ADF (26 min)
- [ ] 👁️ Watch: Parameterized Ingestion with ADF (15 min)
- [ ] ⌨️ Build: Set up ADF pipeline → ingest Olist data → land in Bronze layer of ADLS Gen2
- [ ] 🗣️ Explain: *“What is the Medallion Architecture? What goes in Bronze vs Silver vs Gold?”*

**Practice Tasks**

```
1. Create a parameterized ADF pipeline that can ingest any table from your SQL DB.
2. Verify your data landed correctly in ADLS Gen2 Bronze container. Check file format.
3. Draw the full ingestion architecture you built: source → ADF → ADLS → layers.
```

-----

### 📓 `azure02_transform_enrich.ipynb`

**Topics:** Azure Databricks · MongoDB Ingestion · ADLS Connection · Data Cleaning · Enrichment · Joins · Visualization · Silver Layer Export

- [ ] 👁️ Watch: Azure Databricks Setup & Overview (~18 min)
- [ ] 👁️ Watch: MongoDB Ingestion to Databricks (8 min)
- [ ] 👁️ Watch: ADLS Gen2 to Databricks Connection (13 min)
- [ ] 👁️ Watch: Data Enrichment, Cleaning & Insights (~30 min)
- [ ] 👁️ Watch: Spark Transformations (~5 min)
- [ ] 👁️ Watch: Joining & Enriching Data (~15 min)
- [ ] 👁️ Watch: Visualizing Data in Databricks (7 min)
- [ ] 👁️ Watch: Exporting Data to Silver Layer (11 min)
- [ ] ⌨️ Build: Connect Databricks to ADLS → read Bronze → clean → join → write to Silver
- [ ] 🗣️ Explain: *“What cleaning steps were essential? What does the Silver layer guarantee about data quality?”*

**Practice Tasks**

```
1. Read from Bronze. Find nulls, duplicates, type mismatches. Fix all three.
2. Join orders + customers + products. Add a derived column (e.g. revenue = qty × price).
3. Write cleaned data to Silver as Parquet. Partition by order_date.
```

-----

-----

## 🔷 PHASE 22 — Azure Synapse Analytics

### *Serve the Gold layer. This is what the business sees.*

-----

### 📓 `synapse01_gold_layer.ipynb`

**Topics:** Synapse Overview · UI · Lake Access · SQL Pools · CETAS · External Tables · Workflow

- [ ] 👁️ Watch: Synapse Overview & Account Creation (12 min)
- [ ] 👁️ Watch: Synapse UI Overview (13 min)
- [ ] 👁️ Watch: Synapse to Lake Access (7 min)
- [ ] 👁️ Watch: Dedicated vs Serverless SQL Pool (3 min)
- [ ] 👁️ Watch: Access Lake Data (8 min)
- [ ] 👁️ Watch: Create Gold View and Schema (2 min)
- [ ] 👁️ Watch: CETAS Understanding (11 min)
- [ ] 👁️ Watch: Create External Serving Table (4 min)
- [ ] 👁️ Watch: Synapse Workflow (3 min)
- [ ] ⌨️ Build: Connect Synapse to Silver layer → write CETAS query → create Gold external table → query it
- [ ] 🗣️ Explain: *“What is CETAS? Why create external tables instead of loading data into Synapse directly?”*

**Practice Tasks**

```
1. Write a CETAS query that creates a Gold table: top 10 products by revenue per region.
2. Query your Gold table from Synapse Studio using Serverless SQL Pool.
3. What is the difference between Dedicated SQL Pool and Serverless? When do you use each?
```

-----

-----

## 🎓 YOU MADE IT.

```
Bronze → Silver → Gold
Raw → Processed → Served
Learner → Builder → Engineer
```

> *The person who finishes this course isn’t the one who watched every video.
> It’s the one who built every notebook, broke things, fixed them, and kept going.*

-----

## 📁 ALL YOUR NOTEBOOKS — QUICK REFERENCE

|Notebook Name                        |Phase|Topics Covered                                      |
|-------------------------------------|:---:|----------------------------------------------------|
|`py07_data_manipulation.ipynb`       |4    |Pandas, Data Analysis, CSV/JSON Reading             |
|`py08_sqlite_logging.ipynb`          |4    |SQLite, Python Logging                              |
|`sql01_intermediate.ipynb`           |5    |Joins, Subqueries, GROUP BY, HAVING                 |
|`bigdata01_concepts.ipynb`           |6    |5 V’s, Distributed Systems, Cloud vs On-Prem        |
|`bigdata02_storage_patterns.ipynb`   |6    |DB/DW/Lake, ETL vs ELT, Data Engineer Role          |
|`hadoop01_hdfs_architecture.ipynb`   |7    |HDFS, NameNode, DataNode, Blocks, Replication       |
|`hadoop02_fault_tolerance.ipynb`     |7    |Node Failure, HA, Write/Read Flow                   |
|`hadoop03_cluster_commands.ipynb`    |7    |GCP Cluster, Linux, HDFS CLI                        |
|`mapreduce01_concepts.ipynb`         |8    |MR Intro, Map/Shuffle/Reduce, Combiner Theory       |
|`mapreduce02_practicals.ipynb`       |8    |MR Practicals, Reducers, Log File, Input Split      |
|`yarn01_resource_management.ipynb`   |9    |YARN Components, Step-by-Step Process               |
|`fp01_hof_lambda_map_filter.ipynb`   |10   |HOFs, Lambda, Map/Filter/Reduce                     |
|`spark01_introduction.ipynb`         |11   |Spark vs MR, Features, Ecosystem                    |
|`spark02_rdd_core.ipynb`             |11   |RDDs, Partitioning, Lazy Eval, Actions vs Transforms|
|`spark03_transformations.ipynb`      |11   |Narrow/Wide, GroupByKey vs ReduceByKey, Repartition |
|`spark04_dataframes.ipynb`           |11   |DataFrames, Schema, Read Modes, Write, Date Types   |
|`spark05_execution.ipynb`            |11   |Running Spark, Word Count, Data Generation          |
|`sparksql01_tables.ipynb`            |12   |Temp/Persistent/External Tables, Spark SQL          |
|`sparkcache01_persist.ipynb`         |13   |Cache vs Persist, Storage Levels, RDD/DF Caching    |
|`sparkarch01_cluster_modes.ipynb`    |14   |Architecture, YARN, Standalone, Deploy Modes        |
|`sparkproj01_customer_pipeline.ipynb`|15   |Customer Data Processing, Insights                  |
|`sparkproj02_ecommerce.ipynb`        |15   |E-commerce: Ingest → Clean → Join → Aggregate       |
|`sparkproj03_optimization.ipynb`     |15   |Configs, Broadcast Join, AQE, Serving Layer         |
|`hive01_basics.ipynb`                |16   |Hive Architecture, Tables, Metadata, Beeline        |
|`kafka01_architecture.ipynb`         |17   |Topics, Partitions, Brokers, Confluent Setup        |
|`kafka02_producers_consumers.ipynb`  |17   |Producer/Consumer Code, CLI, Callbacks              |
|`docker01_containers.ipynb`          |18   |Containers, Images, Dockerfile, Docker Compose      |
|`airflow01_dags.ipynb`               |19   |DAGs, Operators, TaskFlow API                       |
|`airflow02_etl_pipeline.ipynb`       |19   |ETL DAG, NASA API, Postgres, Astro Deploy           |
|`databricks01_platform.ipynb`        |20   |Databricks, DBFS, Architecture                      |
|`databricks02_projects.ipynb`        |20   |Customer & Order Insights in Databricks             |
|`azure01_ingestion.ipynb`            |21   |ADF, ADLS Gen2, Medallion, Bronze Layer             |
|`azure02_transform_enrich.ipynb`     |21   |Databricks on Azure, Silver Layer, Joins            |
|`synapse01_gold_layer.ipynb`         |22   |Synapse, CETAS, External Tables, Gold Layer         |

-----

*Built for focus. Built for progress. Built for you. — May 2026*
