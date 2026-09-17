---

# Part 1: Comprehensive Key-Value Glossary Table

This table captures **every technical noun, keyword, command, and operative verb** appearing across the lecture slides, diagrams, architectural charts, and configuration specs.

| Category / Component | Term / Keyword / Verb | Technical Meaning & Function in Lecture |
| :--- | :--- | :--- |
| **Foundational Concepts** | **Commodity Hardware** | Standard, readily available, low-cost PC hardware; easily replaceable; failure is assumed as normal. |
| | **Scale-Out vs. Scale-Up** | Scale-out (horizontal): adding more nodes to a cluster. Scale-up (vertical): adding more RAM/CPU to a single machine. Hadoop scales *out*. |
| | **Data Locality** | *"Move workers to the data, don't move data to workers."* Executes tasks on the physical node where data blocks reside to minimize network I/O. |
| | **Fault Tolerance** | Ability to gracefully recover from hardware failures without loss of data via automatic data block replication. |
| **Hadoop Core** | **Hadoop 1.0 (MRv1)** | Monolithic architecture; bundled resource allocation and processing into `JobTracker` and `TaskTracker`. Batch-only. |
| | **Hadoop 2.0 (YARN/MRv2)** | Layered architecture; decouples resource management (`YARN`) from compute engines (`MapReduce`, `Spark`, `Tez`, etc.). Multi-use platform. |
| | **Hadoop Common** | Shared utilities, Java RPC, serialization, and persistent data structures supporting all Hadoop subprojects. |
| **HDFS Architecture** | **HDFS** | *Hadoop Distributed File System*; master/slave architecture for storing massive files across commodity machines. |
| | **NameNode** | Master node daemon for HDFS. Maintains metadata (file names, permissions, block IDs, locations, replica counts) in RAM. |
| | **DataNode** | Slave node daemon for HDFS. Stores actual data blocks on local physical disks; serves read/write requests; sends Heartbeats & Block Reports. |
| | **Secondary NameNode** | Helper daemon that periodically merges EditLogs with FsImage checkpoints to prevent NameNode log bloat (does *not* act as an active failover!). |
| | **Block** | Splitting unit of large files. Default is **128 MB** (or 64 MB in older setups) to maximize sequential disk read throughput. |
| | **Replication Factor** | Number of copies stored per block (default = 3). Can be configured per file during creation or changed dynamically. |
| | **Heartbeat** | Periodic signal sent by DataNodes to NameNode to prove they are alive. |
| | **Block Report** | Periodic list sent by DataNodes to NameNode cataloging all local blocks hosted. |
| | **Safemode** | Read-only initialization mode where NameNode checks block reports from DataNodes before accepting writes. |
| | **Port 50070** | Default HTTP Web UI port for the HDFS NameNode. |
| **Rack Awareness** | **Rack Awareness Policy** | Network topology-aware placement of block replicas across switches to prevent total data loss during rack failure. |
| | **Network Distance ($d$)** | Distance metric between nodes: <br>• Same node: $d = 0$<br>• Different node, same rack: $d = 2$<br>• Different rack, same data center: $d = 4$<br>• Different data centers: $d = 6$ |
| | **Topology Notation** | Node hierarchy formatted as `/datacenter/rack/node` (e.g., `/d1/r1/n1`). |
| **HDFS I/O Flow** | **DistributedFileSystem** | Java client API interface managing RPC calls between Client and NameNode. |
| | **FSDataOutputStream** | Client output stream that streams write packets through a pipeline of DataNodes (`DN1` $\rightarrow$ `DN2` $\rightarrow$ `DN3`). |
| | **FSDataInputStream** | Client input stream that reads blocks directly from the closest DataNode based on rack distance. |
| | **Pipeline Acknowledgment** | Reverse pipeline confirmation (`DN3` $\rightarrow$ `DN2` $\rightarrow$ `DN1` $\rightarrow$ `Client`) confirming a packet is safely flushed to disk. |
| **HDFS CLI Commands** | `hdfs dfs -ls /` | Lists all directories and files in HDFS. |
| | `hdfs dfs -mkdir <folder>` | Creates a new directory in HDFS. |
| | `hdfs dfs -cat <path>` | Prints file contents to the terminal. |
| | `hdfs dfs -copyFromLocal` | Copies files/directories from local Linux filesystem into HDFS. |
| | `hdfs dfs -copyToLocal` | Copies files from HDFS to local Linux filesystem. |
| | `hdfs dfs -moveFromLocal` | Moves (cuts & pastes) files from local Linux filesystem to HDFS. |
| | `hdfs dfs -cp` | Copies files internally within HDFS. |
| | `hdfs dfs -rmr` | Recursively deletes a directory and its contents from HDFS. |
| | `hdfs dfs -du` | Displays disk usage and file sizes in a directory. |
| | `hdfs dfs -setrep <num>` | Changes the replication factor of a specific file/directory. |
| | `hdfs dfs -chmod <mode>` | Changes file access permissions (e.g., `775`). |
| | `hdfs fsck /` | Filesystem Check; audits HDFS health, corrupt blocks, and missing replicas. |
| | `hdfs balancer` | Rebalances data across DataNodes when usage deviates beyond a threshold (default 10%). |
| | `hdfs dfsadmin -setBalancerBandwidth` | Throttles network bandwidth consumed by the balancer tool during cluster rebalancing. |
| **Storage Formats** | **CSV / Plain Text** | Unstructured/delimited text; human readable, universal exchange format, but uncompressed and slow to scan. |
| | **JSON / XML** | Semi-structured text; JSON lacks explicit record delimiters, making parsing computationally heavy. |
| | **Sequence Files** | Binary key-value storage format; supports block-level compression; non-columnar. |
| | **Row-Oriented Format** | Stores records row-by-row; optimal when queries retrieve most or all columns of a record. |
| | **Columnar Format** | Stores data column-by-column; optimal for analytical OLAP queries selecting a small subset of columns; enables high compression. |
| | **RCFile** | *Record Columnar File*; hybrid format designed for MapReduce; faster than text, but slow write times. |
| | **ORC File** | *Optimized Row Columnar*; specialized for Hive; achieves smallest storage footprint (up to 78% reduction) and fastest queries; limited outside Hive. |
| | **Parquet File** | Universal open-source columnar storage; optimized for nested data across Spark, Impala, Hive, and Pig (~62% compression). |
| **YARN Architecture** | **YARN** | *Yet Another Resource Negotiator*; the distributed operating system / resource layer of Hadoop 2.0. |
| | **ResourceManager (RM)** | Global cluster master daemon; schedules and allocates CPU (vCores) and memory (RAM) across all applications. |
| | **NodeManager (NM)** | Per-machine agent daemon; launches, monitors, and enforces resource boundaries of local Containers; reports node health to RM. |
| | **ApplicationMaster (AM)** | Per-job master process; negotiates resource containers from RM and coordinates individual task execution across NodeManagers. |
| | **Container** | Dynamically allocated slice of physical resources (Memory + CPU vCores) on a slave node where a task executes. |
| | **Port 8088** | Default HTTP Web UI port for YARN ResourceManager. |
| **Hadoop Ecosystem** | **MapReduce** | Distributed batch processing engine (Map phase $\rightarrow$ Shuffle/Sort $\rightarrow$ Reduce phase). |
| | **Apache Spark** | In-memory, general distributed compute engine supporting ETL, SQL, ML, Graph, and Streaming. |
| | **Apache Hive** | Distributed data warehouse system providing HiveQL (SQL-like) translated into MapReduce/Tez jobs. |
| | **Apache Pig** | High-level data-flow programming platform and procedural scripting language (Pig Latin). |
| | **Apache HBase** | Distributed, column-oriented NoSQL database built on top of HDFS for real-time random read/write access. |
| | **Apache Tez** | Framework executing complex task graphs as Directed Acyclic Graphs (DAGs) on YARN; replaces raw MapReduce. |
| | **Apache ZooKeeper** | Distributed, highly available coordination service providing distributed locks, consensus, and config sync. |
| | **Apache Ambari** | Open-source web-based management UI and RESTful API tool for cluster provisioning, monitoring, and config versioning. |
| | **Apache Flume** | Ingestion service tailored for high-volume streaming logs and semi-structured data into HDFS. |
| | **Apache Sqoop** | Ingestion tool for bi-directional bulk data transfer between Relational Databases (RDBMS) and HDFS. |
| | **Apache Mahout / MLlib** | Scalable machine learning and data mining libraries. |
| | **Apache Solr / Lucene** | Distributed text search, indexing, and real-time document retrieval engines. |
| | **Apache Oozie** | Workflow workflow-scheduler system for managing dependent Hadoop jobs. |
| **Distributions** | **Vanilla Apache Hadoop** | Raw, unbundled open-source Apache distribution. |
| | **Cloudera CDP** | Commercial enterprise data platform integrating security, governance (SDX), and multi-cloud analytics. |
| | **Hortonworks HDP** | Prior leading open-source Hadoop distribution managed via Ambari; merged into Cloudera. |
| | **AWS EMR** | *Elastic MapReduce*; cloud-managed Hadoop/Spark cluster scaling EC2 instances on S3/HDFS. |
| | **Azure HDInsight** | Cloud-managed analytics service deploying Hadoop, Spark, Hive LLAP, and Kafka on Azure. |
| **Physical Cluster Specs** | **Master Node (H1)** | Dell PowerEdge T140, 8C/16T Xeon, 16GB RAM, PERC H330 controller, **2x 2TB RAID 1** (mirroring required for metadata protection), CentOS 7 GNOME. |
| | **Slave Nodes (H2-H4)** | Dell PowerEdge T140, 8C/16T Xeon, 16GB RAM, **3x 2TB NO RAID** (raw JBOD; HDFS software handles replication), Ambari Agent only. |
| | **Jump Host / Bastion (W1)** | Windows Server Standard 64-bit, 2x 2TB RAID 1, dual-homed NIC: Public Port 1 for remote access, Private Port 2 (192.168.77.1) for internal cluster switch. Runs Bitvise SFTP and Anonymizer. |
| | **Managed Switch (SW1)** | Cisco SG350-10 managed gigabit switch (IP: 192.168.77.1); connected via CAT6 / CAT7 ethernet cables. |
| | **Cluster File System** | EXT4 partitions; `noatime` (NoAccessTime) recommended to avoid writing disk timestamps on file reads. |
| **Data Lake Concepts** | **Data Lake** | Central storage repository storing vast amounts of raw data in native formats without predefined schema until query time. |
| | **Enterprise Data Warehouse (EDW)**| Highly curated, schema-enforced relational repository optimized for structured business reporting. |
| | **Schema-on-Read** | Schema definition applied dynamically by compute engines when reading/querying raw data (characteristic of Data Lakes). |
| | **Schema-on-Write** | Data must conform strictly to a predefined schema before being inserted into storage (characteristic of EDW). |
| | **AWS Data Lake Stack** | Ingestion (Direct Connect, Snowball, Kinesis) $\rightarrow$ Storage (S3, Redshift) $\rightarrow$ Compute (EMR, Glue, Athena, SageMaker) $\rightarrow$ Governance (IAM, Cognito). |

---

# Part 2: Comprehensive Lecture Summary

This lecture covers the complete architecture of the Apache Hadoop Big Data Framework, transitioning from classical monolithic implementations to modern resource-managed, cloud-integrated ecosystems.

### 1. The Core Philosophy of Hadoop

Hadoop was engineered to overcome the two primary bottlenecks of massive dataset processing: **RAM limitations** and **network bandwidth congestion**. Rather than purchasing expensive enterprise mainframes (scaling up), Hadoop links hundreds or thousands of low-cost commodity PCs (scaling out). Because commodity components fail frequently, fault tolerance is shifted entirely from hardware to the software layer. Hadoop solves the network bottleneck through **Data Locality**: instead of transferring gigabytes or terabytes of data across switches to compute nodes, the execution tasks (code) are sent directly to the machine holding the physical disk blocks.

### 2. Storage Layer: Hadoop Distributed File System (HDFS)

HDFS uses a master/slave model:

- **NameNode (Master):** Keeps all filesystem namespace metadata in memory for ultra-fast lookup (directory tree, file ownership, block locations).
- **DataNodes (Slaves):** Store the physical data split into fixed-sized chunks called **Blocks** (typically 128 MB).
- **Replication & Fault Tolerance:** Each block is replicated (default factor = 3) across nodes. The NameNode orchestrates placement using **Rack Awareness**: placing replicas on different racks to survive entire top-of-rack switch crashes while balancing network distance ($d=0, 2, 4, 6$).
- **Data Flow:**
  - _Writing:_ The client obtains block assignments from the NameNode and streams data packets through a daisy-chained pipeline of DataNodes (`DN1` $\rightarrow$ `DN2` $\rightarrow$ `DN3`), waiting for backward acknowledgments before flushing.
  - _Reading:_ The client queries the NameNode for block locations and streams data directly from the topologically closest DataNode, entirely bypassing the NameNode for data payload transfer.
- **Maintenance:** Tools like `hdfs fsck` identify missing or corrupt blocks, while `hdfs balancer` rebalances block distributions when disks deviate beyond threshold margins (default 10%).

### 3. Storage Optimization: Hadoop File Formats

Selecting the correct file format is critical for storage footprint and execution latency:

- **Row-Oriented (CSV, JSON, SequenceFiles):** Keep entire rows contiguous. Good for writes and queries needing all columns, but inefficient for aggregations.
- **Columnar (RCFile, ORC, Parquet):** Store values of the same column contiguously in stripes/row groups. Queries reading a few columns read only the relevant disk offsets (projection pushdown). They yield dramatic disk savings (e.g., ORC reducing a 585 GB text dataset down to 131 GB—a 78% reduction) due to column-specific dictionary encoding and run-length compression.

### 4. Compute & Resource Management: Hadoop 1.0 vs. Hadoop 2.0 (YARN)

- **Hadoop 1.0 Limitation:** The `JobTracker` was an architectural bottleneck and Single Point of Failure (SPOF). It managed cluster resources while simultaneously supervising every running task. Furthermore, the cluster was hardwired strictly for batch MapReduce programs.
- **Hadoop 2.0 (YARN):** Completely separated resource management from compute execution:
  - **ResourceManager (RM):** Manages overall cluster resource allocation.
  - **NodeManager (NM):** Runs on each slave, enforcing resource limits on isolated **Containers**.
  - **ApplicationMaster (AM):** Instantiated per-job; negotiates containers from the RM and coordinates task execution directly with NodeManagers.
  - _Result:_ Hadoop became a multi-tenant platform hosting MapReduce, interactive SQL (`Hive`, `Tez`, `Impala`), graph/in-memory processing (`Spark`), and real-time streaming (`Flink`, `Storm`).

### 5. Practical Cluster Architecture & Deployment

Enterprise deployment requires strict infrastructure segregation:

- **Master Node (H1):** Needs hardware reliability. Uses **RAID 1** (disk mirroring) to safeguard the NameNode’s filesystem metadata (FsImage/EditLogs).
- **Slave Nodes (H2–H4):** Configured as **NO RAID (JBOD)**. Hardware RAID is deliberately avoided because HDFS natively manages block redundancy across nodes; hardware RAID adds unnecessary hardware cost, degrades write performance, and complicates drive replacement.
- **Jump Host / Bastion Node (W1):** A dual-homed machine (Public IP facing the Internet for VPN/RDP/SFTP access; Private IP facing the internal 1 Gbps / 10 Gbps switch). It isolates the internal cluster from public threats and hosts data anonymization utilities.
- **OS/Disk Config:** Linux (CentOS 7) on 64-bit architecture, EXT4 filesystem mounted with `noatime` to eliminate unnecessary disk write operations on file reads.

### 6. Modern Evolution: The Data Lake vs. Data Warehouse

- **Data Warehouse (EDW):** Relies on **Schema-on-Write** (data must be cleansed, transformed, and modeled before loading). Stores structured data expensively for historical BI reporting.
- **Data Lake:** Implements **Schema-on-Read** (raw data in any format—unstructured, semi-structured, audio, clickstream—is ingested "just-in-case" into inexpensive storage like HDFS or AWS S3). Schemas are only bound when the data is queried by analytical engines (`Spark`, `Athena`, `Presto`).

---

# Part 3: Visual ASCII / Text Architecture & Pipeline Block Diagrams

Use these text diagrams to quickly review and sketch the workflows for exam questions.

### Diagram 1: Hadoop 1.0 vs. Hadoop 2.0 (YARN) Architecture

```
HADOOP 1.0 (Monolithic / Batch Only)
+-------------------------------------------------------------+
|        MapReduce (Cluster Resource Mgmt + Execution)        |
+-------------------------------------------------------------+
|              HDFS (Distributed File System)                 |
+-------------------------------------------------------------+
Bottlenecks: JobTracker does everything; Batch-only; Fixed Map/Reduce slots.

                      ⬇ EVOLVED INTO ⬇

HADOOP 2.0 (Layered / Multi-Tenant Platform)
+-------------------------------------------------------------+
|    User APIs: Hive / Spark / Pig / HBase / Storm / Flink    |
+-------------------------------------------------------------+
|   Execution Engines: Tez / Spark / MapReduce v2 (MRv2)      |
+-------------------------------------------------------------+
|         YARN (Yet Another Resource Negotiator)              |
|        - Decoupled Cluster Resource Management -            |
+-------------------------------------------------------------+
|              HDFS2 (Distributed Storage)                    |
+-------------------------------------------------------------+
```

---

### Diagram 2: HDFS Component & Master-Slave Topology

```
                         +--------------------------+
                         |       Master Node        |
                         |   NameNode (Port 50070)  |
                         |   [Stores File Metadata] |
                         +------------+-------------+
                                      |
              +-----------------------+-----------------------+
     Heartbeats / Block Reports       |        Heartbeats / Block Reports
              |                       |                       |
              v                       v                       v
     +-----------------+     +-----------------+     +-----------------+
     |   DataNode 1    |     |   DataNode 2    |     |   DataNode 3    |
     | [Local Disk: B1]|     | [Local Disk: B1]|     | [Local Disk: B2]|
     | [Local Disk: B2]|     | [Local Disk: B3]|     | [Local Disk: B3]|
     +-----------------+     +-----------------+     +-----------------+
     |<------------- Rack 1 ------------->|     |<---- Rack 2 --->|
```

---

### Diagram 3: HDFS Data Write Pipeline (Step-by-Step)

```
[ Client Node ]
   |
   |-- (1) create() ------------> [ DistributedFileSystem ]
   |                                     |
   |                                     |-- (2) RPC: create file --------> [ NameNode ]
   |                                     |<-- Granted + DN list (DN1,2,3) --+
   |-- (3) Get FSDataOutputStream <------+
   |
   |================== (4) Stream Data Packets ===================>
   v                                                                |
+------------+       write packet        +------------+       write packet        +------------+
| DataNode 1 | ------------------------> | DataNode 2 | ------------------------> | DataNode 3 |
+------------+                           +------------+                           +------------+
   |                                            |                                        |
   |<-- (5) ack --------------------------------+<-- (5) ack ----------------------------+
   |
   v
[ Client Node ]
   |
   |-- (6) close() -------------> [ FSDataOutputStream ]
                                         |
                                         |-- (7) complete() --------------> [ NameNode ]
```

---

### Diagram 4: HDFS Data Read Pipeline (Step-by-Step)

```
[ Client Node ]
   |
   |-- (1) open() --------------> [ DistributedFileSystem ]
   |                                     |
   |                                     |-- (2) getBlockLocations() ------> [ NameNode ]
   |                                     |<-- Returns DN locations sorted ---+
   |                                          by Rack Distance (closest 1st)
   |-- (3) Returns FSDataInputStream <----+
   |
   |-- (4) read() block 1 stream direct -----------------------------> [ Closest DataNode ]
   |                                                                  (e.g., Local Node)
   |-- (5) read() block 2 stream direct -----------------------------> [ Next Closest DataNode ]
   |                                                                  (e.g., Same Rack Node)
   |-- (6) close() -------------> [ FSDataInputStream ]
```

---

### Diagram 5: YARN Application Submission & Container Execution

```
[ Client ]
   |
   |--- (1) Submit Application
   v
[ ResourceManager (Master Node) ]
   |
   |--- (2) Instruct to launch ApplicationMaster
   v
[ NodeManager (Slave 1) ]
   |---> Starts [ Container: ApplicationMaster (AM) ]
                    |
                    |--- (3) Registers with RM
                    |--- (4) Computes resource requirements (vCores, RAM)
                    |--- (5) Requests Resource Containers (Heartbeats)
                    v
         [ ResourceManager ]
                    |
                    |--- (6) Allocates & queues requests
                    |--- (7) Grants Container Leases to AM
                    v
     [ ApplicationMaster ]
        |             |
        |             +---------------------------------------+
        v                                                     v
[ NodeManager (Slave 1) ]                             [ NodeManager (Slave 2) ]
   * Launches Task Container 1                           * Launches Task Container 2
   * (e.g., Map Task on local block)                     * (e.g., Map Task on local block)
```

---

### Diagram 6: Physical Cluster Hardware & Network Topology

```
                       [ Public Internet ]
                                | (Port 22 / 443 / VPN)
                                v
               +----------------------------------+
               |        W1: Jump Host / Bastion   |
               |        - Windows Server 64-bit   |
               |        - Bitvise SFTP / RDP      |
               |        - Dual-Homed Server       |
               +----------------+-----------------+
          Port 1 (Public IP)    | Port 2 (Private IP: 192.168.77.1)
                                v
      +----------------------------------------------------+
      |       SW1: Cisco Managed Switch (192.168.77.1)     |
      +-------+--------------------+-------------------+---+
              |                    |                   |
  Port 11     |        Port 12     |       Port 13     |       Port 14
              v                    v                   v                   v
     +-----------------+  +-----------------+ +-----------------+ +-----------------+
     | H1: Master Node |  | H2: Slave Node  | | H3: Slave Node  | | H4: Slave Node  |
     | - 192.168.77.11 |  | - 192.168.77.12 | | - 192.168.77.13 | | - 192.168.77.14 |
     | - NameNode / RM |  | - DataNode / NM | | - DataNode / NM | | - DataNode / NM |
     | - Ambari Server |  | - Ambari Agent  | | - Ambari Agent  | | - Ambari Agent  |
     | - RAID 1 (2x2TB)|  | - NO RAID (JBOD)| | - NO RAID (JBOD)| | - NO RAID (JBOD)|
     +-----------------+  +-----------------+ +-----------------+ +-----------------+
```

---

### Diagram 7: Data Lake Architecture Pipeline

```
[ DATA SOURCES ]           [ DATA LAKE (Central Store) ]          [ CONSUMERS / ANALYTICS ]
+--------------+           +---------------------------+          +-----------------------+
|  RDBMS / SQL | --Sqoop-->|                           |          | Batch Processing      |
+--------------+           |    Low-Cost Storage       |          | (Hadoop / Spark)      |
|  Sensors/IoT |           |    (HDFS / AWS S3)        |------->  +-----------------------+
+--------------+ --Flume-->|                           |          | Interactive Queries   |
| Web Logs /   |           |    RAW UNSTRUCTURED,      |          | (Hive / Presto / SQL) |
| Social Media |           |    SEMI-STRUCTURED &      |          +-----------------------+
+--------------+           |    STRUCTURED DATA        |          | Machine Learning      |
| Video / Media| --------->|                           |------->  | (MLlib / SageMaker)   |
+--------------+           |    "SCHEMA-ON-READ"       |          +-----------------------+
                           +---------------------------+          | Dashboards / BI       |
                                                                  | (Tableau / QuickSight)|
                                                                  +-----------------------+
```

---

# Part 4: Exam-Style Short-Answer Questions & Answers

#### Q1: What is "Data Locality" and why is it essential in Hadoop?

**Answer:** Data Locality is the principle of scheduling computational tasks (workers) on the physical node that already stores the target data blocks locally. It prevents moving terabytes of raw data across physical network switches, saving network bandwidth and drastically reducing job execution time.

#### Q2: What are the network distance values under Hadoop's Rack Awareness policy?

**Answer:**

- **0:** Processes/nodes on the exact same physical machine (`/d1/r1/n1` to `/d1/r1/n1`).
- **2:** Nodes on different physical machines within the same rack (`/d1/r1/n1` to `/d1/r1/n2`).
- **4:** Nodes on different racks within the same data center (`/d1/r1/n1` to `/d1/r2/n3`).
- **6:** Nodes residing in completely different data centers (`/d1/r1/n1` to `/d2/r3/n4`).

#### Q3: State the default HDFS block size, the default replication factor, and their primary purposes.

**Answer:**

- **Default Block Size:** **128 MB**. Purpose: To amortize disk seek overhead and ensure sequential read throughput.
- **Default Replication Factor:** **3**. Purpose: To achieve fault tolerance and data availability across hardware and rack failures.

#### Q4: Why is hardware RAID deliberately avoided on HDFS DataNode storage drives?

**Answer:** HDFS already provides software-level fault tolerance through inter-node block replication. Using RAID across DataNode drives introduces write-speed overhead (parity calculations), raises hardware costs, and prevents HDFS from utilizing individual drive I/O paths independently (JBOD is faster for sequential reads/writes).

#### Q5: What default network ports are associated with the HDFS NameNode and YARN ResourceManager web consoles?

**Answer:**

- **HDFS NameNode Web UI:** Port **50070** (Hadoop 2.x standard).
- **YARN ResourceManager Web UI:** Port **8088**.

#### Q6: Explain the difference between Schema-on-Write and Schema-on-Read.

**Answer:**

- **Schema-on-Write (Data Warehouse):** The data schema must be defined beforehand, and incoming data is validated, transformed, and formatted prior to loading into storage.
- **Schema-on-Read (Data Lake):** Raw data is loaded into storage in its native format without validation. The schema is applied dynamically by compute engines only when queries or processing jobs read the data.

#### Q7: Provide the exact Hadoop CLI command to:

1.  Recursively remove an HDFS directory.
2.  Adjust the replication factor of a file to 4.
3.  Check HDFS filesystem health and identify missing blocks.

**Answer:**

1.  `hdfs dfs -rmr <directory_path>`
2.  `hdfs dfs -setrep 4 <file_path>`
3.  `hdfs fsck /`

#### Q8: Why are columnar file formats like Parquet and ORC preferred over CSV/Text for Big Data analytics?

**Answer:** Columnar formats store records by column rather than row, allowing queries that select a few columns to skip all irrelevant disk blocks (projection pushdown). Because values in the same column have identical data types, columnar formats compress data significantly (e.g., ORC achieves up to 78% compression), which lowers storage needs and speeds up disk reads.

---

# Part 5: Exam-Style Long-Answer Conceptual Questions & Answers

---

### Q1: Compare the architectural differences between Hadoop 1.0 (MRv1) and Hadoop 2.0 (YARN/MRv2). Why was YARN introduced, and what major bottlenecks did it solve?

#### Structure of the Answer:

1.  **Architecture of Hadoop 1.0 (MRv1):**
    - Hadoop 1.0 was a monolithic, single-use system designed exclusively for batch MapReduce workloads.
    - It relied on a master daemon called the **JobTracker** and slave daemons called **TaskTrackers**.
    - The `JobTracker` handled two entirely different responsibilities at once:
      1.  _Resource Management:_ Tracking cluster resources and assigning task slots.
      2.  _Job Lifecycle Monitoring:_ Tracking the execution, progress, and failure retries of every individual Map and Reduce task.
2.  **Bottlenecks of MRv1:**
    - **Single Point of Failure (SPOF) & Scalability Wall:** Because the `JobTracker` had to track all fine-grained task lifecycles across thousands of nodes in memory, clusters hit a hard limit around 4,000 nodes.
    - **Slot Inflexibility:** Slots on slave nodes were split into hardcoded "Map Slots" and "Reduce Slots". If an application had only Map tasks running, Reduce slots sat idle and wasted resources.
    - **Batch-Only Compute:** The engine could not run non-MapReduce computational frameworks (e.g., real-time stream processing, graph analytics, or interactive SQL).
3.  **The Solution: Hadoop 2.0 (YARN):**
    - YARN (_Yet Another Resource Negotiator_) decoupled resource management from application execution by breaking down the `JobTracker` into specialized, independent components:
      - **ResourceManager (RM):** A cluster-wide authority that allocates raw CPU and Memory across all running jobs via generic, flexible **Containers**.
      - **ApplicationMaster (AM):** A per-job master process that runs inside a container on a slave node. It negotiates resources with the RM and supervises task progress for that specific application.
      - **NodeManager (NM):** An agent running on each worker node that launches and tracks task containers.
4.  **Benefits of YARN:**
    - _Scalability:_ Moving task tracking to distributed ApplicationMasters enabled clusters to scale beyond 10,000 nodes.
    - _Multi-Tenancy:_ Hadoop transformed into a multi-use operating platform. Engines like Apache Spark (in-memory), Apache Tez (DAG-based), Apache Flink (streaming), and Apache Hive could share the same physical cluster hardware and HDFS storage layer without conflict.

---

### Q2: Detail the complete step-by-step Data Write Pipeline in HDFS (with Replication Factor = 3). Explain how pipelining ensures both efficiency and data durability.

#### Structure of the Answer:

1.  **Step-by-Step Flow:**
    - **Step 1 (Create Request):** The client application invokes the `create()` method on the `DistributedFileSystem` client library.
    - **Step 2 (NameNode RPC):** The `DistributedFileSystem` executes an RPC to the **NameNode** to create a new file entry in the filesystem namespace. The NameNode checks client permissions and ensures the file path doesn’t already exist.
    - **Step 3 (Stream Initialization):** The NameNode grants write permission and returns a list of target DataNodes for the first block. The `DistributedFileSystem` returns an `FSDataOutputStream` to the client to handle writes.
    - **Step 4 (Pipeline Streaming):** The client splits the data block into a series of internal packets (typically 64 KB). The client does _not_ write to all three DataNodes in parallel over its local link. Instead, it writes a packet to the first DataNode (`DN1`). `DN1` stores the packet in its local buffer and streams it to the second DataNode (`DN2`), which buffers and streams it to the third DataNode (`DN3`).
    - **Step 5 (Acknowledgment Pipeline):** The acknowledgment path flows in reverse: `DN3` acknowledges to `DN2`, `DN2` acknowledges to `DN1`, and `DN1` reports back to the client’s `FSDataOutputStream`.
    - **Step 6 (Stream Close):** Once all blocks are streamed and acknowledged, the client invokes `close()` on the `FSDataOutputStream`.
    - **Step 7 (Completion Notification):** The `DistributedFileSystem` contacts the NameNode via a `complete()` call to finalize the file. The NameNode commits the file to persistent metadata once it confirms minimum block replication.
2.  **Why Pipelining is Superior:**
    - If the client wrote to three DataNodes concurrently, its network card would become an immediate bottleneck (3x bandwidth consumption).
    - By pipelining (`Client` $\rightarrow$ `DN1` $\rightarrow$ `DN2` $\rightarrow$ `DN3`), network load is distributed across the cluster switch fabric, maximizing total cluster throughput while preserving full durability.

---

### Q3: Explain the architectural, storage, and operational differences between an Enterprise Data Warehouse (EDW) and a Data Lake. When would an organization choose one over the other?

#### Structure of the Answer:

| Dimension              | Enterprise Data Warehouse (EDW)                                                                               | Data Lake                                                                                                                     |
| :--------------------- | :------------------------------------------------------------------------------------------------------------ | :---------------------------------------------------------------------------------------------------------------------------- |
| **Data Types**         | Structured, relational, highly modeled (e.g., star/snowflake schemas).                                        | All formats: raw, unstructured (audio, video, text), semi-structured (JSON, logs), and structured.                            |
| **Schema Paradigm**    | **Schema-on-Write:** Data must be extracted, transformed, and validated against a schema before being stored. | **Schema-on-Read:** Data is written in its raw, native format. Schema is applied dynamically by compute engines at read time. |
| **Storage Cost**       | High: runs on expensive proprietary storage systems (SAN/NAS/appliance storage).                              | Low: uses inexpensive commodity disks on HDFS or cloud object stores (e.g., AWS S3, Azure Data Lake Store).                   |
| **Agility**            | Rigid, less agile. Schema changes require extensive ETL refactoring by database teams.                        | Highly agile and flexible. Data can be reconfigured or analyzed in different ways as requirements evolve.                     |
| **Target Audience**    | Business analysts, executives, operational reporting users via SQL/BI tools.                                  | Data scientists, machine learning engineers, data engineers doing exploratory analysis.                                       |
| **Processing Purpose** | Fast historical reporting, aggregations, standardized KPIs, and OLAP cubes.                                   | Deep learning, machine learning, predictive modeling, log analytics, raw archival ("just-in-case" storage).                   |

- **Organizational Decision Logic:**
  - _Choose an EDW_ when reporting against well-understood business metrics (e.g., quarterly sales reconciliation, compliance accounting) requiring strict schema guarantees, ACID compliance, and low query latency for business users.
  - _Choose a Data Lake_ when consolidating high-velocity, multimodal data (clickstreams, IoT sensors, server logs) whose future analytical value is not yet fully defined, or when powering exploratory data science, ad-hoc discovery, and deep-learning pipelines that consume raw data.
  - _Modern Practice:_ Organizations generally pair both: the Data Lake acts as the landing and staging area that refines raw data before loading a clean subset into the downstream EDW.

---

### Q4: Using the cluster setup case study from the lecture (Nodes H1, H2–H4, and W1), explain the system configuration choices:

1. Why does Master Node H1 use hardware RAID 1 while Slave Nodes H2–H4 use NO RAID (JBOD)?
2. What is the role and network setup of the Jump Host W1?
3. Why is the Linux file system mounted with `noatime`?

#### Structure of the Answer:

1.  **RAID Selection Strategy (H1 vs. H2–H4):**
    - **Master Node (H1):** Hosts the NameNode and YARN ResourceManager. The NameNode maintains the entire filesystem directory tree and block metadata mapping in memory and writes checkpoint files (`FsImage`) and edit logs (`EditLog`) to disk. If this metadata drive is lost without backup, the entire HDFS cluster becomes inaccessible. Thus, **RAID 1 (disk mirroring)** provides necessary hardware-level disk redundancy.
    - **Slave Nodes (H2–H4):** Host the DataNodes. Data blocks are already replicated across different physical machines by HDFS (Replication Factor = 2 or 3). Implementing hardware RAID here would waste disk space, add hardware costs, and create write-throughput bottlenecks. With **NO RAID (JBOD - Just a Bunch of Disks)**, if a drive fails, HDFS simply treats that drive's blocks as under-replicated and replicates them to other healthy drives automatically.
2.  **Role and Setup of Jump Host (W1):**
    - **Role:** Acts as a secure bastion / perimeter access gateway. It isolates the Hadoop cluster from the public Internet while providing administrators with secure remote shell and file transfer capabilities (via Bitvise SFTP and Windows RDP). It is also used to run data preprocessing and anonymization utilities on raw data before transferring it into the production cluster.
    - **Network Allocation:** W1 is **dual-homed** (contains two separate physical network interfaces):
      - _Port 1 (Public):_ Assigned a fixed public IP and connects to the outside network for secure inbound remote access (ports 22/443/VPN).
      - _Port 2 (Internal):_ Assigned the private gateway address `192.168.77.1` and connects directly to the internal Cisco managed switch (`SW1`), bridging traffic securely to the master and slave nodes.
3.  **Mounting File Systems with `noatime`:**
    - In standard Linux filesystems, reading a file writes a metadata timestamp update (`access time` or `atime`) back to disk.
    - In a Big Data cluster continuously scanning millions of large blocks across multiple disks, writing timestamps on every read generates massive, unnecessary disk write I/O.
    - Enabling `noatime` (NoAccessTime) turns off these writes, freeing disk bandwidth exclusively for high-throughput sequential data reading and processing.
