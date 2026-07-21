# Spark Live Class — Compiled Notes

### Source: 3 handwritten class PDFs, organized and clarified

-----

## ⚠️ Two Corrections to Rules You Already Hold

**1. reduceByKey breaks for AVG and MEDIAN**

```
Your notes: "For say median, avg, reduceByKey will give
             wrong answer"

Why this is true — reduceByKey requires the combining function
to be ASSOCIATIVE and safely combinable in pieces. SUM works:
  sum(A) + sum(B) = sum(A+B)  ✅ always correct

AVG does NOT work the same way:
  avg(partition_A) + avg(partition_B), then averaging those
  two averages ≠ the true overall average — UNLESS both
  partitions have exactly equal row counts.

  Example: Partition A = [10, 20]      → avg = 15
           Partition B = [100]         → avg = 100
  Naive "average of averages" = (15+100)/2 = 57.5
  TRUE average of [10,20,100] = 43.3   ← different, wrong

Fix: for AVG, don't reduce averages directly. Either:
  - Compute SUM and COUNT separately via reduceByKey,
    then divide sum/count at the end, OR
  - Just use groupByKey + compute avg after grouping, OR
  - Use DataFrame .agg(avg()) which handles this correctly
    internally

MEDIAN can't be reduced at all with reduceByKey — median
requires seeing ALL values sorted, not a pairwise combine.
Must use groupByKey (or DataFrame approxQuantile/percentile
functions) for median.
```

**2. spark.read isn’t always purely lazy**

```
This contradicts the simple "transformations are lazy, actions
are eager" rule — spark.read is a transformation but behaves
differently depending on HOW you call it:

┌─────────────────────────┬───────────┬──────────────────────┐
│ Scenario                 │ Behavior  │ Why                  │
├─────────────────────────┼───────────┼──────────────────────┤
│ header=True,             │ EAGER     │ Reads only the first  │
│ no inferSchema            │ (light)   │ line for column       │
│                           │           │ names. Triggers a     │
│                           │           │ small job (collect    │
│                           │           │ with limit 1).        │
├─────────────────────────┼───────────┼──────────────────────┤
│ inferSchema=True          │ EAGER     │ Scans the ENTIRE      │
│                           │ (heavy)   │ dataset to guess       │
│                           │           │ column types. Runs     │
│                           │           │ 2 jobs — one for       │
│                           │           │ column names, one      │
│                           │           │ for type inference.    │
├─────────────────────────┼───────────┼──────────────────────┤
│ Explicit schema provided  │ LAZY      │ No upfront job at all │
│ (you define StructType)   │ (true)    │ — matches the normal  │
│                           │           │ lazy rule. Validation  │
│                           │           │ happens only when an   │
│                           │           │ action runs later.     │
└─────────────────────────┴───────────┴──────────────────────┘

Practical takeaway your notes captured correctly:
"Avoid inferSchema → provide our own schema"
This isn't just style preference — inferSchema silently costs
you a full extra pass over your data before you've done
anything else. On a 500MB+ file this is real, measurable time.
```

-----

## 1. Why Spark — Core Value Props

```
1. Speed:
   - In-memory processing (avoids disk round-trips MapReduce
     forces between every stage)
   - DAG (Directed Acyclic Graph) — Spark plans the whole
     chain of operations before running anything, so it can
     optimize the execution order

2. Ease of Use:
   - Multi-language support (Java, Scala, Python, R)
   - Rich built-in libraries (SQL, Streaming, MLlib, GraphX)

3. Unified Framework:
   - One engine handles batch, streaming, SQL, ML, and graph
     processing — no need to stitch together separate tools
```

-----

## 2. Spark Ecosystem (Layered View)

```
Programming   → Java, Scala, Python, R           (languages)
Library       → Spark SQL, Spark Streaming,       (built on
                GraphX, MLlib                      Spark Core)
Engine        → Spark Core                        (the engine)
Management    → Hadoop YARN, Spark (standalone),  (resource
                Mesos                               schedulers)
Storage       → Local FS, HDFS, Amazon S3,        (where data
                NoSQL, other DBs                    physically lives)
```

**Two levels of Spark API, noted separately:**

```
Spark higher level  → developed to make life easy,
                       least flexible, easiest to use
                       (DataFrame, Spark SQL, MLlib)

Spark core/low level → RDD — most flexible, but most
                        manual work required
```

-----

## 3. Features of Apache Spark — Full List

```
1. Speed        → in-memory processing, DAG-based execution
2. Scalable      → scales from 1 machine to 1000+ machines
3. Fault Tolerant → automatically recovers lost data on failure
                     (via RDD lineage — see Section 5)
4. Multi-language/Polyglot → supports multiple programming
                              languages
5. Unified Framework → one engine for batch + streaming +
                        SQL + ML + graph
6. Integration with existing systems → works with HDFS,
                                        YARN, Kafka natively
```

**The universal data flow pattern:**

```
   Read  →  Process  →  Write
             ↑    ↑
      transformation  action
      (builds the plan) (triggers execution)
```

-----

## 4. All Transformations & Actions — Reference Table

```
TRANSFORMATIONS (lazy — build a plan, no execution):
map                mapPartitions        mapPartitionsWithIndex
cartesian          sortByKey            join
flatMap            cogroup              union
intersection       filter               distinct
repartition        pipe                 sample
groupByKey         reduceByKey          aggregateByKey
coalesce           repartitionAndSortWithinPartitions

ACTIONS (eager — trigger real execution, return a result):
reduce             take                 collect
takeSample         count                takeOrdered
countByKey         first                foreach
saveAsTextFile     saveAsSequenceFile   saveAsObjectFile
```

-----

## 5. What is an RDD — Full Breakdown

```
R = Resilient   → can quickly RECOVER from failure
D = Distributed → data is split into partitions across machines
D = Dataset      → a collection of data

"Resilient" specifically means: if a partition is lost
(machine crashes), Spark can rebuild JUST that partition
without recomputing everything — because of LINEAGE.
```

**Lineage — how recovery actually works:**

```
   file
    │
    ▼
  rdd1  ──┐
    │      │
    ▼      │  This chain of transformations IS the lineage.
  rdd2      │  If rdd4 is lost, Spark doesn't need a backup
    │        │  copy — it just REPLAYS the recorded steps
    ▼        │  (file → rdd1 → rdd2 → rdd3 → rdd4) to
  rdd3       │  rebuild it from scratch.
    │        │
    ▼        │
  rdd4  ←────┘  (lost — but Spark knows exactly how
    │            to recreate it)
    ▼
  rdd5

Key point noted: RDDs are IMMUTABLE — you never modify an
RDD in place, every transformation creates a brand new RDD.
This immutability is WHY lineage-based recovery works at all
— nothing changes underneath you unexpectedly.
```

**Properties of RDD:**

```
1. Immutable      — can't be changed after creation
2. Lazy evaluated — nothing runs until an action is called
3. Partitioned    — data is split across the cluster
```

**Characteristics of RDD:**

```
1. Fundamental data structure (the base building block of Spark)
2. Resilient       (see lineage above)
3. Fault Tolerant   (recovers automatically)
4. Lazily evaluated (transformations don't run immediately)
```

-----

## 6. SparkContext vs SparkSession

```
Diagram context: multiple partitions (P0, P1, P2...) are
processed across worker machines, coordinated by a single
entry point into the cluster.

┌────────────────────┬──────────────────────────────────────┐
│ SparkContext (sc)   │ SparkSession (spark)                  │
├────────────────────┼──────────────────────────────────────┤
│ Older entry point    │ Introduced in Spark 2.0 — unified     │
│                       │ entry point                           │
│ Primarily RDDs only   │ Wraps SparkContext + SQLContext +     │
│                       │ HiveContext together                  │
│ One active sc per JVM │ Gives access to BOTH DataFrame and    │
│                       │ Dataset APIs                          │
│ More low-level        │ Can have multiple sessions in the     │
│ control               │ same app                              │
│                       │ Recommended for all modern Spark work │
└────────────────────┴──────────────────────────────────────┘

"Normal Spark" (running without any specialized context):
- No SQL or Hive support
- Very limited compared to using SparkSession
- Essentially never what you actually want to use
```

-----

## 7. Narrow vs Wide Transformations — Full Detail

```
Transformations = operations that create a NEW RDD from an
                   existing one

┌─────────────────────────┬───────────────────────────────┐
│ NARROW                   │ WIDE                            │
├─────────────────────────┼───────────────────────────────┤
│ Data NOT shuffled across │ Data IS shuffled across          │
│ partitions                │ partitions                      │
│                           │                                  │
│ FASTER — no shuffle       │ SLOWER — shuffling means I/O +   │
│                           │ network cost                     │
│                           │                                  │
│ Examples: map, filter,    │ Examples: groupByKey,            │
│ flatMap                   │ reduceByKey, sortByKey           │
│                           │                                  │
│ Depends on ONE parent      │ Depends on MULTIPLE partitions   │
│ partition only             │                                  │
└─────────────────────────┴───────────────────────────────┘
```

**Worked example from notes — 300MB file, 3 partitions:**

```
Partition 1: Delhi,1  Mumbai,1
Partition 2: Delhi,1  Blr,1
Partition 3: Blr,1    Kolkata,1

After map (narrow — no movement, stays in place):
  each partition still holds its own local (city,1) pairs

After groupByKey/reduceByKey (wide — shuffle happens):
  All "Delhi" pairs from every partition get physically moved
  to the SAME target partition:
  Delhi,1
  Delhi,1
     ↓  (combined)
  (Delhi, 2)
```

**The practical rule of thumb, straight from the notes:**

```
Either:
→ Try to have VERY FEW wide transformations in your pipeline
→ Narrow down the data FIRST (filter early!) so that
  whatever DOES eventually get shuffled is as small as
  possible
```

-----

## 8. ReduceByKey vs GroupByKey — Mechanics + Real Evidence

```
Definition, straight from your notes:

ReduceByKey → "Aggregating the value of keys DURING the
               shuffle phase" — combines locally first,
               then shuffles the already-combined result

GroupByKey  → "Group all the key values and we CAN
               aggregate ON TOP of them" — shuffles
               everything raw first, combines only after
```

**Diagram walkthrough (3 partitions, keys a and b):**

```
ReduceByKey:
  P1: (a,1)          P2: (a,1)→(a,2)     P3: (a,1)→(a,3)
      (b,1)              (b,1)→(b,2)         (b,1)→(b,3)
  ↓ each partition COMBINES ITS OWN matching keys FIRST
  Only the small combined results get shuffled:
      (a,1) (a,2) (a,3) → shuffled → combined → (a,6)
      (b,1) (b,2) (b,3) → shuffled → combined → (b,6)

GroupByKey:
  P1: (a,1) (b,1)     P2: (a,1) (b,1)     P3: (a,1) (b,1)
  ↓ NO local combine — every raw record ships as-is
  ALL 6 raw (a,1)/(b,1) pairs travel across the network,
  THEN get grouped into lists:
      (a,1)(a,1)(a,1)(a,1)(a,1)(a,1) → (a,6)
      (b,1)(b,1)(b,1)(b,1)(b,1)(b,1) → (b,6)
```

**Real measured proof from the class screenshots (matches
your own GCP experiment exactly):**

```
ReduceByKey job:  Shuffle Read/Write = 933.0 B
GroupByKey job:   Shuffle Read/Write = 57.9 KiB

Same final answer, ~60x more data physically moved by
GroupByKey — this is the concrete, measured version of
the theory above. Your own earlier GCP screenshots showed
this exact same pattern independently.
```

**⚠️ The gotcha these notes add (see top of doc):**

```
"For say median, avg — reduceByKey will give WRONG answer"

Only use reduceByKey when your combine function is truly
associative and doesn't depend on knowing partition sizes
(SUM, COUNT, MAX, MIN all safe). AVG and MEDIAN need
different handling — see the correction box at the top.
```

-----

## 9. Repartition vs Coalesce

```
┌──────────────┬─────────────────────────┬──────────────────────┐
│ Aspect         │ Repartition               │ Coalesce               │
├──────────────┼─────────────────────────┼──────────────────────┤
│ Definition     │ Shuffles data across all   │ Combines adjacent      │
│                 │ nodes to increase OR       │ partitions WITHOUT     │
│                 │ decrease partition count   │ a full shuffle          │
│                 │                             │                        │
│ Shuffling       │ YES — full shuffle          │ NO — only merges       │
│                 │ across the cluster          │ neighboring partitions  │
│                 │                             │                        │
│ Performance     │ Slower (shuffle overhead)   │ Faster (no shuffle)     │
│                 │                             │                        │
│ Scalability      │ Can INCREASE or            │ Can ONLY decrease       │
│                 │ decrease partitions         │ partitions              │
│                 │                             │                        │
│ When to use     │ After reading unbalanced    │ When shrinking          │
│                 │ data (uneven partitions)    │ partitions after a      │
│                 │                             │ filter operation        │
└──────────────┴─────────────────────────┴──────────────────────┘
```

**Visual metaphor from the notes:**

```
Repartition: like fully reshuffling a deck — every card
  (partition) gets redistributed to potentially any new
  position, workers exchange data broadly with each other

Coalesce: like just merging neighboring stacks together —
  partition 1 + partition 2 → combined, no cross-cluster
  shuffling needed, cheaper because it only touches
  adjacent/local data
```

-----

## 10. DataFrame — What It Actually Is

```
"DF is a distributed collection of data organized into
NAMED COLUMNS, similar to a table in a DB."

Another way it was framed: "RDD with some STRUCTURE"
(schema + metadata added on top of the raw distributed data)

Note: "not persistent" — a DataFrame isn't automatically
saved anywhere; it exists in the Spark session's memory/plan
until you explicitly write it out.
```

**RDD vs DataFrame — direct comparison:**

```
┌────────────────┬──────────────┬─────────────────────┐
│ Feature          │ RDD            │ DataFrame              │
├────────────────┼──────────────┼─────────────────────┤
│ Schema Support   │ No schema      │ Schema-aware            │
│ Ease of Use       │ Low            │ High                    │
│ Performance       │ Less optimized  │ Catalyst-optimized      │
└────────────────┴──────────────┴─────────────────────┘

"Catalyst-optimized" means: because DataFrame operations
carry a known schema, Spark's Catalyst query optimizer can
rewrite/reorder your operations for better performance
BEFORE running them — something it can't safely do with raw
RDDs, since Spark has no idea what shape that data is in.
```

-----

## 11. Spark SQL

```
"Module for structured data processing. Provides an
interface for running SQL queries on DataFrame & table."

Spark Table = made of two parts:
  - Data      (distributed — lives across the cluster)
  - Metadata/Schema (the "DB" part — column names, types)

Universal pattern noted again here:
  Input → Process → Store/Export
```

-----

## 12. spark.read — Practical Usage

```
spark.read
  .format(...)         → what file type (csv, parquet, json...)
  .option("header", ...) → does the file have a header row
  .option("inferSchema", ...) → GUESS column types automatically
                                  ⚠️ AVOID — see correction #2 above
  .load(...)             → the actual file path (usually in HDFS)

Best practice from the notes:
  "Avoid inferSchema → provide our own schema instead"

Why: providing an explicit schema (StructType with named,
typed fields) skips the expensive full-file scan that
inferSchema requires, AND keeps spark.read fully lazy
(see the eager/lazy table in Correction #2 above).
```

-----

## Summary — What’s Genuinely New From These Notes

```
1. reduceByKey silently gives WRONG results for AVG/MEDIAN
   — never encountered this limitation before in your
   spark02 work. This is a real interview trap.

2. spark.read is NOT uniformly lazy — inferSchema forces
   eager, expensive execution. Explicit schema keeps it lazy.

3. The exact shuffle numbers (933B vs 57.9KiB) in this
   class's screenshots match your own GCP experiment almost
   exactly — strong independent confirmation you measured
   the real thing, not a fluke.

4. Repartition vs Coalesce table — this topic (spark02
   BUILD 8) was still unattempted in your notebook as of
   last check. These notes give you everything needed to
   fill that section now.
```