# Part 1: Comprehensive Key-Value Technical Matrix

This table extracts and classifies the key technical nouns, verbs, concepts, and system artifacts found across all slides and diagrams.

| Category | Keyword / Technical Term | Type | Key-Value Meaning & Operational Context |
| :--- | :--- | :--- | :--- |
| **Paradigm** | **Divide and Conquer** | Noun / Concept | Algorithmic strategy used for big data: **Divide** (break into sub-problems) $\rightarrow$ **Conquer** (solve recursively) $\rightarrow$ **Combine** (merge partial results). |
| **Paradigm** | **Parallelization Challenges** | Concept | Core distributed issues: Work assignment, stragglers (slow workers), partial result sharing, barrier synchronization, fault tolerance (worker failure). |
| **MapReduce Core** | **Input Split** | Noun | Logical split of input data assigned to a single mapper. Determined by data size and block size. |
| **MapReduce Core** | **Mapper (`Map()`)** | Noun / Verb | Reads $\langle k_1, v_1 \rangle$ from disk; extracts/transforms data into intermediate $\langle k_2, v_2 \rangle$ pairs. |
| **MapReduce Core** | **`Emit(k, v)`** | Verb / Function | Method called by Mapper and Reducer to produce an output key-value pair. |
| **MapReduce Core** | **Shuffling** | Verb / Phase | Transfer of intermediate key-value output from mapper local disks across the network to reducers. Groups values by key. |
| **MapReduce Core** | **Sorting** | Verb / Phase | Automatic sorting of intermediate keys before the Reducer executes. Data is **sorted by key**, never by value. |
| **MapReduce Core** | **Reducer (`Reduce()`)** | Noun / Verb | Takes $\langle k_2, \text{list}(v_2) \rangle$; aggregates, summarizes, or filters values per key; writes $\langle k_3, v_3 \rangle$ to persistent storage (HDFS). |
| **MapReduce Core** | **Barrier Synchronization** | Concept | A reducer cannot start execution until **all** mappers have finished processing. |
| **Optimization** | **Combiner** | Noun / Component | "Semi-reducer" or "local reduce". Runs locally on mapper output before shuffling to minimize intermediate data size and alleviate network congestion. |
| **Optimization** | **Partitioner** | Noun / Component | Determines which reducer receives which intermediate key. Uses `Hash(Key) mod N` (where $N$ = number of reducers). Ensures equal distribution. |
| **Data Structure** | **$\langle k_1, v_1 \rangle$** | Noun | Raw input key-value pair (e.g., line offset, raw text string). |
| **Data Structure** | **$\langle k_2, v_2 \rangle$** | Noun | Intermediate key-value pair emitted by Mapper (e.g., $\langle \text{word}, 1 \rangle$). |
| **Data Structure** | **$\langle k_2, \text{list}(v_2) \rangle$** | Noun | Grouped intermediate key with a list of values produced by the Shuffle phase (e.g., $\langle \text{"Car"}, [1, 1, 1] \rangle$). |
| **Data Structure** | **$\langle k_3, v_3 \rangle$** | Noun | Final key-value pair emitted by Reducer (e.g., $\langle \text{"Car"}, 3 \rangle$). |
| **Application** | **Word Count** | Use Case | Canonical MapReduce task: counts frequency of every word across documents. |
| **Application** | **Inverted Index** | Use Case | Information retrieval index: maps words to the list of documents containing them with frequencies ($\langle \text{term}, [\text{docID}, \text{count}] \rangle$). |
| **Execution** | **Master (Job Tracker / YARN RM)** | Noun / Node | Central node that coordinates job submission, assigns work splits to workers, and monitors task health. |
| **Execution** | **Worker (Task Tracker / NodeManager)** | Noun / Node | Cluster node executing assigned Map or Reduce tasks. |
| **Execution** | **Local Write** | Action | Mappers write intermediate $\langle k_2, v_2 \rangle$ files to their **local disk** (not HDFS). |
| **Execution** | **Remote Read** | Action | Reducers read their assigned key partitions from mapper local disks over the network. |
| **Hadoop / CLI** | **`hadoop fs -mkdir`** | Command | Creates a directory in the Hadoop Distributed File System (HDFS). |
| **Hadoop / CLI** | **`hadoop fs -put`** | Command | Copies local file system files into HDFS. |
| **Hadoop / CLI** | **`hadoop fs -ls`** | Command | Lists files and directories in HDFS. |
| **Hadoop / CLI** | **`hadoop fs -cat`** | Command | Prints contents of an HDFS file to console. |
| **Hadoop / CLI** | **`hadoop jar`** | Command | Submits and executes a packaged MapReduce application JAR on the cluster. |
| **Hadoop Output** | **`part-r-00000`** | Noun / File | Final reducer output file. Total number of output files equals the total number of reducers. |
| **AWS EMR** | **Amazon EMR** | Service | Elastic MapReduce: Managed AWS cloud platform for running Hadoop, Hive, and Spark clusters. |
| **AWS EMR** | **Master Node (EMR)** | Node Type | Coordinates cluster tasks, monitors nodes, runs NameNode & YARN ResourceManager. |
| **AWS EMR** | **Core Node (EMR)** | Node Type | Runs tasks (NodeManager) **and stores data** (HDFS DataNode). |
| **AWS EMR** | **Task Node (EMR)** | Node Type | Provides **compute-only** capacity; does **not** store HDFS data. Ideal for spot instances/dynamic auto-scaling. |
| **AWS EMR Storage** | **EMRFS (using S3)** | Storage Option | Decoupled object storage (`s3://...`). Highly durable, low cost, independent of cluster lifecycle. |
| **AWS EMR Storage** | **HDFS using EBS** | Storage Option | Persistent block storage volumes attached to EC2 instances. |
| **AWS EMR Storage** | **HDFS using Instance Store** | Storage Option | Ephemeral, non-persistent storage. Data lost on stop, hibernate, termination, or disk failure (reboot OK). |
| **EMR Lifecycle** | **`STARTING`** | State | Cluster instances are being provisioned. |
| **EMR Lifecycle** | **`BOOTSTRAPPING`** | State | Executes custom setup scripts/bootstrap actions before Hadoop services start. |
| **EMR Lifecycle** | **`RUNNING`** | State | Actively executing submitted steps/jobs. |
| **EMR Lifecycle** | **`WAITING`** | State | Cluster is idle, healthy, and awaiting instructions or interactive queries. |
| **EMR Lifecycle** | **`TERMINATING` / `TERMINATED`** | State | Cluster resources are being released or completely shut down. |
| **EMR Security** | **Key Pair (`.pem`)** | Security Noun | Private key cryptographic file used for SSH remote access into the Primary node. |
| **EMR Security** | **Security Group (Firewall)** | Security Noun | Virtual firewall where inbound TCP port 22 (SSH) must be opened. |

---

# Part 2: High-Level Summary of the Entire Lecture

This lecture covers the architectural concepts, dataflow mechanics, application examples, and cloud operationalization of the **MapReduce** framework:

1. **Foundations & Core Motivation:**  
   Processing massive datasets requires a **Divide-and-Conquer** strategy (Divide into sub-problems $\rightarrow$ Conquer concurrently $\rightarrow$ Combine results). Writing parallel distributed code from scratch is difficult due to straggler nodes, worker crashes, network congestion, and barrier coordination. The **MapReduce** framework abstracts these low-level distributed computing challenges, providing automated parallelization, fault tolerance, and load balancing.

2. **The MapReduce Dataflow Pipeline:**
   - **Input Splitting:** Large files are split into manageable blocks and assigned to Mappers.
   - **Map Phase:** Reads disk data as $\langle k_1, v_1 \rangle$, processes records independently, and emits intermediate $\langle k_2, v_2 \rangle$ pairs to local disk.
   - **Combiner (Optional / Local Aggregation):** Acts as a "semi-reducer" on the mapper machine to reduce intermediate data volume before network transfer.
   - **Partitioner (Routing):** Assigns intermediate keys across reducers using hash modulo arithmetic (`hash(key) % numReducers`).
   - **Shuffle & Sort Phase:** Transfers intermediate data across the network (shuffle) and groups/orders all records with the same key (sort) into $\langle k_2, \text{list}(v_2) \rangle$.
   - **Reduce Phase:** Aggregates, iterates over value lists per key, and writes final output $\langle k_3, v_3 \rangle$ to distributed storage (HDFS).

3. **Cluster Execution Mechanics:**  
   A centralized **Master** node manages job coordination, monitors worker heartbeats, assigns splits, and reschedules failed tasks. **Workers** execute map tasks, store temporary results on **local disk**, and execute reduce tasks by fetching data remotely over the network before writing final results to HDFS.

4. **Canonical Use Cases:**
   - **Word Count:** Counting term frequencies across documents.
   - **Inverted Indexing:** Mapping terms to document locations and per-document occurrence frequencies ($\text{term} \rightarrow [\text{docID}, \text{count}]$).

5. **Cloud Deployment on AWS EMR (Elastic MapReduce):**
   - **Architecture Node Roles:**
     - **Master Node:** Management, orchestration, NameNode/YARN ResourceManager.
     - **Core Node:** Compute (NodeManager) + Persistent/Distributed Storage (DataNode).
     - **Task Node:** Compute-only; scales processing without risking data loss or triggering HDFS rebalancing.
   - **Storage Strategies:** EMRFS (S3) decouples compute from storage; EBS provides reliable block storage; Instance Store provides fast ephemeral scratch storage susceptible to data loss upon instance stopping/terminating.
   - **EMR Cluster Lifecycle:** Advances through `STARTING` $\rightarrow$ `BOOTSTRAPPING` $\rightarrow$ `RUNNING` $\rightarrow$ `WAITING` (ready for use) $\rightarrow$ `TERMINATING` $\rightarrow$ `TERMINATED`.

---

# Part 3: Mid-Term Exam Preparation Kit

---

## 1. Core Pipeline & System Architecture Block Drawings

### Diagram 1: The Logical MapReduce Data Transformation Pipeline

```
+-----------------------------------------------------------------------------------------+
|                                    INPUT DATASET                                        |
+-----------------------------------------------------------------------------------------+
                                             |
                         [ Splitting into Input Splits ]
                                             |
        +------------------------------------+------------------------------------+
        |                                    |                                    |
        v                                    v                                    v
  [ Split 1 ]                          [ Split 2 ]                          [ Split 3 ]
        |                                    |                                    |
        v                                    v                                    v
+---------------+                    +---------------+                    +---------------+
|   Mapper 1    |                    |   Mapper 2    |                    |   Mapper 3    |
| <k1, v1>      |                    | <k1, v1>      |                    | <k1, v1>      |
| -> list<k2,v2>|                    | -> list<k2,v2>|                    | -> list<k2,v2>|
+---------------+                    +---------------+                    +---------------+
        |                                    |                                    |
        v                                    v                                    v
+---------------+                    +---------------+                    +---------------+
| Combiner*     |                    | Combiner*     |                    | Combiner*     |
| (Local Reduce)|                    | (Local Reduce)|                    | (Local Reduce)|
+---------------+                    +---------------+                    +---------------+
        |                                    |                                    |
        v                                    v                                    v
+---------------+                    +---------------+                    +---------------+
|  Partitioner  |                    |  Partitioner  |                    |  Partitioner  |
| Hash(k2) mod R|                    | Hash(k2) mod R|                    | Hash(k2) mod R|
+---------------+                    +---------------+                    +---------------+
        \                                    |                                   /
         \___________________________________|__________________________________/
                                             |
                                             v
                     =================================================
                               SHUFFLE & SORT PHASE (Network)
                     - Routes same keys to the same Reducer
                     - Sorts data by Key: <k2, list(v2)>
                     =================================================
                                             |
                        +--------------------+--------------------+
                        |                                         |
                        v                                         v
               +------------------+                      +------------------+
               |    Reducer 1     |                      |    Reducer 2     |
               | <k2, list(v2)>   |                      | <k2, list(v2)>   |
               | -> list<k3, v3>  |                      | -> list<k3, v3>  |
               +------------------+                      +------------------+
                        |                                         |
                        v                                         v
               [ part-r-00000 ]                          [ part-r-00001 ]
               (Output on HDFS)                          (Output on HDFS)

* Note: Combiner is optional.
```

---

### Diagram 2: Physical Job Execution Architecture

```
                  +-----------------------+
                  |     User Program      |
                  +-----------------------+
                              | (1) Submit Job
                              v
                  +-----------------------+
                  |      MASTER NODE      |
                  | (Coordinates & Tracks)|
                  +-----------------------+
                     /                 \
     (2) Schedule   /                   \ (2) Schedule
        Map Tasks  /                     \   Reduce Tasks
                  v                       v
      +------------------------+      +------------------------+
      |      WORKER (Map)      |      |     WORKER (Reduce)    |
      |                        |      |                        |
(3)   | [Reads Split from HDFS]|      |                        |
Read  |          |             |      |                        |
      |          v             |      |                        |
      |       [Map()]          | (5)  |                        |
      |          |             |Remote|                        |
(4)   |          v             | Read |        [Reduce()]      |
Local | [Write to Local Disk]  |----->|            |           |
Write | (Intermediate Files)   |      |            v           | (6) Write
      +------------------------+      |  [Write to Output HDFS]|----> HDFS Output
                                      +------------------------+
```

---

### Diagram 3: AWS EMR Cluster Node Role Topology

```
+-----------------------------------------------------------------------------------+
|                                 AWS EMR CLUSTER                                   |
|                                                                                   |
|  +-----------------------------------------------------------------------------+  |
|  | MASTER NODE (EC2 Instance)                                                  |  |
|  | - Cluster Manager & Orchestrator                                            |  |
|  | - Tracks task execution status & worker health                              |  |
|  | - Runs: HDFS NameNode, YARN ResourceManager                                 |  |
|  +-----------------------------------------------------------------------------+  |
|                                         |                                         |
|            +----------------------------+----------------------------+            |
|            |                                                         |            |
|            v                                                         v            |
|  +-----------------------------------+     +-----------------------------------+  |
|  | CORE NODE (EC2 Instance)          |     | TASK NODE (EC2 Instance - Opt.)   |  |
|  | [COMPUTE + STORAGE]               |     | [COMPUTE ONLY]                    |  |
|  | - Executes Map & Reduce tasks     |     | - Executes Map & Reduce tasks     |  |
|  | - Stores persistent/HDFS data     |     | - NO DATA STORAGE (No DataNode)   |  |
|  | - Runs: DataNode, NodeManager     |     | - Runs: NodeManager only          |  |
|  | - CANNOT be scaled down casually  |     | - Can safely scale up/down or use |  |
|  |   without data rebalancing.       |     |   cheap Spot Instances!           |  |
|  +-----------------------------------+     +-----------------------------------+  |
+-----------------------------------------------------------------------------------+
```

---

## 2. High-Yield Short-Answer Questions & Answers

### Q1: What is the primary purpose of the Combiner, and how does it optimize performance?

**Answer:**  
A Combiner is an optional **local reducer** that runs directly on the mapper node. It aggregates intermediate key-value pairs before they are sent over the network. This minimizes the volume of intermediate data, saving network bandwidth and reducing network congestion during the Shuffle phase.

### Q2: Why are intermediate key-value pairs written to local disk rather than to HDFS?

**Answer:**  
Intermediate key-value pairs are **temporary/ephemeral** artifacts needed only as input for the Reducer. Writing them to HDFS would incur unnecessary replication overhead, consuming network and disk bandwidth. If a mapper fails, the Master simply reruns that specific map task.

### Q3: Why is there a synchronization barrier between the Map phase and the Reduce phase?

**Answer:**  
A Reducer can only produce a correct, complete aggregation if it has processed **all** values associated with its assigned keys. Because any mapper could potentially emit any key, the Reducers cannot begin processing until **every mapper has completed** its work and all key partitions have been sorted and shuffled.

### Q4: How does the Partitioner decide which Reducer receives a specific key?

**Answer:**  
The Partitioner divides the intermediate key space using a hashing function:  
$$\text{Reducer Index} = \text{Hash}(\text{Key}) \pmod N$$  
where $N$ is the total number of Reducers. This guarantees that all instances of the same key go to the exact same Reducer while evenly distributing the keys across available Reducers.

### Q5: In Hadoop, what dictates the total number of final output files (e.g., `part-r-00000`)?

**Answer:**  
The number of final output files is **equal to the number of Reducers**. Each Reducer writes its own partitioned result file directly to persistent storage (HDFS/S3).

### Q6: In AWS EMR, what is the fundamental difference between a Core Node and a Task Node?

**Answer:**

- **Core Node:** Provides **both compute and storage** (runs YARN NodeManager and HDFS DataNode). Shrinking core nodes requires careful HDFS data rebalancing to avoid data loss.
- **Task Node:** Provides **compute only** (runs YARN NodeManager only). It stores no persistent HDFS data and can be added or terminated dynamically without risk of data loss.

### Q7: Why is "HDFS on Instance Store" considered risky for persistent big data workloads?

**Answer:**  
Instance Store is ephemeral scratch storage tied to the physical host. If the virtual instance stops, hibernates, terminates, or suffers an underlying hardware drive failure, all data on that drive is **permanently lost** (only a normal OS reboot preserves data).

### Q8: What does the `WAITING` status signify in the AWS EMR cluster lifecycle?

**Answer:**  
It indicates that cluster provisioning and bootstrapping actions have completed successfully. The cluster is healthy, active, and currently idle—waiting for submitted jobs (steps) or interactive user queries.

---

## 3. Exam-Style Long-Answer & Scenario Questions

### Long Question 1: Trace the MapReduce Data Flow for an Inverted Index

**Problem:**  
You are given the following three short documents:

- **Doc A:** `Clinton Trump Clinton`
- **Doc B:** `Clinton Sanders`
- **Doc C:** `Clinton Barack Trump`

Explain the role of each stage in building an **Inverted Index** (mapping each unique word to the documents it appears in and its count within that document), specifying the exact key-value pairs at each transition.

**Model Answer:**

1. **Input Splitting Phase:**  
   Each document is treated as an input record:
   - Split 1: $\langle \text{Doc A}, \text{"Clinton Trump Clinton"} \rangle$
   - Split 2: $\langle \text{Doc B}, \text{"Clinton Sanders"} \rangle$
   - Split 3: $\langle \text{Doc C}, \text{"Clinton Barack Trump"} \rangle$

2. **Map Phase:**  
   Each Mapper loops over every word in the document and emits $\langle \text{word}, \text{docID} \rangle$:
   - **Mapper A:** $\langle \text{"Clinton"}, \text{A} \rangle$, $\langle \text{"Trump"}, \text{A} \rangle$, $\langle \text{"Clinton"}, \text{A} \rangle$
   - **Mapper B:** $\langle \text{"Clinton"}, \text{B} \rangle$, $\langle \text{"Sanders"}, \text{B} \rangle$
   - **Mapper C:** $\langle \text{"Clinton"}, \text{C} \rangle$, $\langle \text{"Barack"}, \text{C} \rangle$, $\langle \text{"Trump"}, \text{C} \rangle$

3. **Shuffle and Sort Phase:**  
   The framework routes all identical keys to the same Reducer and sorts keys alphabetically:
   - $\langle \text{"Barack"}, [\text{C}] \rangle$
   - $\langle \text{"Clinton"}, [\text{A}, \text{A}, \text{B}, \text{C}] \rangle$
   - $\langle \text{"Sanders"}, [\text{B}] \rangle$
   - $\langle \text{"Trump"}, [\text{A}, \text{C}] \rangle$

4. **Reduce Phase:**  
   The Reducer aggregates the document IDs into occurrence frequencies per document:
   - For **Barack:** Iterates $[\text{C}] \rightarrow \langle \text{"Barack"}, [(\text{C}, 1)] \rangle$
   - For **Clinton:** Counts instances in $[\text{A}, \text{A}, \text{B}, \text{C}] \rightarrow \langle \text{"Clinton"}, [(\text{A}, 2), (\text{B}, 1), (\text{C}, 1)] \rangle$
   - For **Sanders:** Iterates $[\text{B}] \rightarrow \langle \text{"Sanders"}, [(\text{B}, 1)] \rangle$
   - For **Trump:** Iterates $[\text{A}, \text{C}] \rightarrow \langle \text{"Trump"}, [(\text{A}, 1), (\text{C}, 1)] \rangle$

5. **Final Output:**  
   The aggregated postings lists are written to persistent storage (HDFS).

---

### Long Question 2: Parallelization Challenges & Framework Solutions

**Problem:**  
In distributed computing, parallelizing tasks introduces several fundamental systems-level challenges. Identify four of these challenges and explain in detail how MapReduce solves them automatically without developer intervention.

**Model Answer:**

1. **Worker Failure ("What if workers die?"):**
   - _Problem:_ A machine in a commodity cluster can fail mid-computation.
   - _MapReduce Solution:_ The Master periodically pings workers via heartbeats. If a worker stops responding, the Master marks it as dead. Any map tasks completed by that worker on its local disk are marked reset and rescheduled on another node; in-progress reduce tasks are similarly reassigned.

2. **Stragglers ("What if some workers are slower than others?"):**
   - _Problem:_ A faulty, overloaded, or poorly connected machine slows down the entire batch job due to the synchronization barrier.
   - _MapReduce Solution:_ The framework monitors worker progress. Near the end of a phase, the Master initiates **speculative execution**, launching duplicate backup copies of the remaining in-progress tasks on other available nodes. Whichever worker finishes first provides the output, and the duplicate task is killed.

3. **Routing and Grouping ("What if workers need to share partial results?"):**
   - _Problem:_ Mappers produce partial results for many keys; Reducers need all values for a single key.
   - _MapReduce Solution:_ The framework automatically manages the **Shuffle & Sort** phase. Mappers partition data locally by key using a partitioner function (`Hash(Key) % N`). The system initiates remote reads over HTTP to transfer partitions directly to the assigned Reducer, abstracting networking code entirely.

4. **Load Balancing ("How do we assign work units to workers?"):**
   - _Problem:_ Having more work units than available worker nodes, or uneven distribution of tasks.
   - _MapReduce Solution:_ Input files are broken into small logical chunks (typically 64MB or 128MB splits). Work is assigned dynamically: as soon as a worker finishes one task, the Master assigns it the next available split.

---

### Long Question 3: Cloud Architectural Design (AWS EMR)

**Problem:**  
Your organization needs to process a 50 TB batch dataset once every weekend. A junior cloud engineer proposes creating an AWS EMR cluster consisting of 1 Master node and 10 Core nodes using ephemeral Instance Store storage to keep costs low.  
Evaluate this architectural design. What critical operational flaws exist, and how would you redesign the architecture using AWS EMR best practices?

**Model Answer:**

**Flaws in Proposed Design:**

1. **Extreme Risk of Data Loss (Instance Store):** Instance Store is ephemeral. If an instance experiences hardware degradation, stops, or terminates, data stored in HDFS is wiped out permanently.
2. **Coupled Compute and Storage Costs:** Running 10 Core nodes all weekend means paying for high compute capacity even if compute is only required for a fraction of the time. Conversely, you cannot shut down the cluster during weekdays without losing your data.
3. **No Dynamic Elasticity:** Core nodes store HDFS blocks. Dynamically downsizing Core nodes during low-demand periods causes severe HDFS rebalancing penalties or potential block under-replication.

**Recommended Redesign:**

1. **Decouple Storage from Compute (EMRFS on Amazon S3):**  
   Store the raw 50 TB dataset and final results in **Amazon S3** using EMRFS (`s3://...`). S3 provides 99.999999999% (11 9's) durability at a much lower storage cost and persists indefinitely, independent of cluster existence.
2. **Adopt Master + Minimal Core + Elastic Task Node Topology:**
   - **1 Master Node** (General-purpose EC2, e.g., `m4.large`).
   - **Minimum Core Nodes** (e.g., 2 Core nodes with attached EBS volumes) purely to maintain essential persistent cluster services.
   - **Task Nodes (Elastic Scaling):** Provision the remaining compute power using **Task Nodes**. Because Task Nodes store zero HDFS data, they can be configured with **Spot Instances** (saving up to 70–90% in cost) and managed via **Managed Scaling** to automatically spin up when processing begins and terminate as soon as steps complete.
3. **Transient Cluster Workflow:**  
   Set the cluster to **Auto-Terminate** upon job completion (`Processing successful? -> TERMINATING -> TERMINATED`). When data arrives next weekend, launch the cluster automatically, process data directly from S3, save results back to S3, and shut down.
