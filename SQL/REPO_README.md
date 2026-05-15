# ⚡ sql-mastery
### 45–60 Day SQL Plan · Scratch to Pro · Runs on Databricks

---

## 🚀 One-Time Setup (Do This First)

### Step 1 — Connect Databricks to GitHub
1. Databricks → top right → **User Settings**
2. Click **Git Integration**
3. Select **GitHub** → paste your Personal Access Token
   *(GitHub → Settings → Developer Settings → Personal Access Tokens → New token → check `repo`)*

### Step 2 — Clone this repo into Databricks
1. Left sidebar → **Repos** → **Add Repo**
2. Paste: `https://github.com/YOUR_USERNAME/sql-mastery`
3. Click **Create Repo**

### Step 3 — Run the data setup
1. Open `00_data_setup.py` in Databricks
2. Attach to your cluster
3. Click **Run All**
4. You'll see ✅ for all 6 tables

### Step 4 — Start learning
Open `01_basics.sql` and start writing queries.

---

## 📁 Files

| File | Purpose |
|------|---------|
| `00_data_setup.py` | Creates all 6 Delta tables — run once |
| `01_basics.sql` | Module 1: SELECT, WHERE, ORDER BY, NULL, Aliases |
| `02_filtering.sql` | Module 2: String, Date, CASE WHEN, Math, Aggregates |
| `03_aggregations.sql` | Module 3: GROUP BY, HAVING, Execution Order |
| `04_joins.sql` | Module 4: All JOIN types + Pitfalls |
| `05_subqueries.sql` | Module 5: Scalar, Correlated, IN/EXISTS |
| `06_window_functions.sql` | Module 6: RANK, LAG, Running Totals *(unlocked after review)* |
| `07_ctes.sql` | Module 7: WITH, UNION, PIVOT, Recursive *(unlocked after review)* |
| `08_string_date.sql` | Module 8: Advanced functions *(unlocked after review)* |
| `09_performance.sql` | Module 9: EXPLAIN, Broadcast, Delta *(unlocked after review)* |
| `10_advanced.sql` | Module 10: MERGE, SCD, Sessionization *(unlocked after review)* |
| `11_projects.sql` | Module 11: 25 real business questions *(unlocked after review)* |
| `TRACKER.md` | Your progress — update and push after every topic |
| `ROADMAP.md` | Full 55-topic plan with all questions |

---

## 📊 The Dataset — 6 Tables

```
customers    15 rows   customer profiles, city, tier, join date
orders       25 rows   order headers, status, total
products     20 rows   catalog across Electronics/Accessories/Furniture/Smart Home/Wearables/Appliances
order_items  39 rows   line items linking orders ↔ products
employees    15 rows   staff with manager hierarchy across 4 departments
departments   4 rows   Engineering / Product / Data / Marketing with budgets
```

---

## ⚡ Daily Workflow

```
1. Open Databricks → Repos → sql-mastery
2. Pull latest changes
3. Open the current module .sql file
4. Write your queries
5. Update TRACKER.md
6. Commit + Push to GitHub
```

---

## 🧠 The Rules

```
✅ Topic is DONE only when: Study + All 3 Queries Written + Explain Answered
❌ Never skip the EXPLAIN question
❌ Never copy-paste queries — write them yourself
✅ Stuck? Google → Ask Claude → never leave a cell blank
✅ Send completed notebook for review before moving to next module
```

---
*Started: May 2026*
