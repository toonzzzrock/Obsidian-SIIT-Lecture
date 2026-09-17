### Key-Value Extraction of Keywords and Technical Terms

The table below catalogs the technical nouns, concepts, and key action verbs appearing throughout the lecture slides and diagrammatic architectures:

| Category                            | Keyword / Technical Term          | Type           | Contextual Value / Description in Lecture                                                                                       |
| :---------------------------------- | :-------------------------------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------ |
| **Big Data Core & Characteristics** | **Big Data**                      | Noun           | Datasets exceeding the processing, storage, and memory capacity of traditional single-machine computing systems.                |
|                                     | **Volume**                        | Noun           | Scale of data; exponential explosion from terabytes to petabytes and zettabytes (e.g., RFID, GPS, sensors, logs).               |
|                                     | **Velocity**                      | Noun           | Speed of data generation and required processing speed (real-time streaming analytics, low latency decisions).                  |
|                                     | **Variety**                       | Noun           | Structural diversity: structured/relational, semi-structured (XML, JSON), unstructured (text, video), and graph/streaming data. |
|                                     | **Veracity**                      | Noun           | Data quality, uncertainty, noise, inconsistency, missing values, and abnormalities requiring pre-processing.                    |
|                                     | **Commodity Hardware**            | Noun           | Low-cost, standard PC/server hardware clustered together rather than specialized high-end supercomputers.                       |
|                                     | **Scale Out (Horizontal)**        | Verb / Concept | Adding more commodity nodes/machines to a distributed cluster rather than scaling up.                                           |
|                                     | **Scale Up (Vertical)**           | Verb / Concept | Upgrading single-machine CPU/RAM/disks; constrained by SMP limits and bus bandwidth.                                            |
|                                     | **Data Locality**                 | Concept / Verb | Moving compute/processing tasks directly to where the data resides rather than moving data across the network.                  |
|                                     | **Schema-on-Write**               | Concept        | Traditional RDBMS approach where rigid schemas must be designed before data ingestion/insertion.                                |
|                                     | **Schema-on-Read**                | Concept        | Big Data approach where raw data is stored in native format and schema/structure is applied upon querying.                      |
| **Data Processing Paradigms**       | **OLTP**                          | Noun           | _Online Transaction Processing_; relational DBMSs optimized for high-concurrency transactional reads and writes.                |
|                                     | **OLAP**                          | Noun           | _Online Analytical Processing_; historical data warehousing systems optimized for multi-dimensional reporting.                  |
|                                     | **RTAP**                          | Noun           | _Real-Time Analytics Processing_; modern distributed streaming architecture for immediate actionable insights.                  |
|                                     | **ETL**                           | Noun / Verb    | _Extract, Transform, Load_; curated pipeline extracting from sources, transforming, and loading into schemas.                   |
|                                     | **Data Lake**                     | Noun           | Repository storing massive amounts of raw, uncurated, multi-structured data indefinitely in native format.                      |
|                                     | **Data Warehouse**                | Noun           | Centralized repository of structured, cleaned ("cooked"), and schema-defined data for reporting and BI.                         |
| **Hadoop Architecture**             | **HDFS**                          | Noun           | _Hadoop Distributed File System_; fault-tolerant, distributed file system running on commodity hardware clusters.               |
|                                     | **NameNode**                      | Noun           | Master daemon/bookkeeper of HDFS; maintains metadata, directory tree, and file-to-block mapping.                                |
|                                     | **Secondary NameNode (SNN)**      | Noun           | Auxiliary daemon creating periodic snapshots/checkpoints of NameNode metadata to reduce recovery downtime.                      |
|                                     | **DataNode**                      | Noun           | Worker/slave daemons of HDFS storing and retrieving physical blocks; reports block states to NameNode.                          |
|                                     | **Block Replication**             | Verb / Concept | Storing redundant copies of file blocks across independent DataNodes for fault tolerance and reliability.                       |
|                                     | **JobTracker**                    | Noun           | Master node in MapReduce v1; creates execution plans, assigns tasks to TaskTrackers, and monitors execution.                    |
|                                     | **TaskTracker**                   | Noun           | Slave daemon in MapReduce v1; executes individual Map or Reduce tasks assigned by the JobTracker.                               |
|                                     | **YARN**                          | Noun           | _Yet Another Resource Negotiator_; cluster resource management and job scheduling framework in Hadoop 2+.                       |
|                                     | **MapReduce**                     | Noun / Verb    | Software framework and programming model for distributed parallel processing of large datasets.                                 |
| **Hadoop Ecosystem Tools**          | **Apache Hive**                   | Noun           | Distributed data warehouse framework providing SQL-like querying (**HiveQL**) compiled into MapReduce/Tez jobs.                 |
|                                     | **Apache Spark**                  | Noun           | High-speed, in-memory distributed data engine supporting batch processing, streaming, SQL, and ML.                              |
|                                     | **RDD**                           | Noun           | _Resilient Distributed Datasets_; fault-tolerant distributed memory abstractions fundamental to Apache Spark.                   |
|                                     | **Apache HBase**                  | Noun           | Distributed, column-oriented, scalable NoSQL database on top of HDFS supporting real-time random read/write.                    |
|                                     | **Apache Pig**                    | Noun           | High-level data-flow scripting platform and language (**Pig Latin**) for expressing data analysis programs.                     |
|                                     | **Apache Sqoop**                  | Noun / Verb    | Tool designed for efficiently transferring bulk data bidirectionally between relational databases and HDFS.                     |
|                                     | **Apache Flume**                  | Noun / Verb    | Distributed service for efficiently collecting, aggregating, and moving large streams of log data into HDFS.                    |
|                                     | **Apache ZooKeeper**              | Noun           | Centralized coordination service providing distributed configuration, synchronization, naming, and locks.                       |
|                                     | **Apache Ambari**                 | Noun           | Web-based management software for provisioning, configuring, monitoring, and maintaining Hadoop clusters.                       |
|                                     | **Apache Mahout / SparkML**       | Noun           | Scalable distributed machine learning and data mining libraries built to run across big data clusters.                          |
|                                     | **Kafka / Storm**                 | Noun           | Distributed publish-subscribe message queues and real-time event stream processing engines.                                     |
| **Data Analysis & Platforms**       | **RapidMiner (Altair AI Studio)** | Noun           | Integrated visual data science software platform for data mining, ML, and predictive analytics prototyping.                     |
|                                     | **Tableau Desktop / Prep**        | Noun           | Business intelligence and data visualization software for building interactive exploratory dashboards.                          |
|                                     | **Amazon EMR**                    | Noun           | _Elastic MapReduce_; AWS managed cloud big data service for running Apache Hadoop, Spark, and Hive.                             |
|                                     | **Cloudera (CDH) / HDP**          | Noun           | Enterprise Hadoop distribution platforms bundling and managing open-source ecosystem tools.                                     |
| **Spatial Trajectory Processing**   | **People Flow Tracking**          | Verb / Noun    | Analysis of large-scale spatio-temporal GPS breadcrumbs to model urban mobility patterns and evacuations.                       |
|                                     | **Trip Reconstruction**           | Verb / Noun    | Assembling chronological spatial coordinate points into continuous trajectories and transport modes.                            |
|                                     | **Significant Places Extraction** | Verb / Noun    | Algorithmic detection of stay points (e.g., Home, Work, Transit, Shopping) from dense GPS clusters.                             |
| **Methodological Verbs**            | **Ingest**                        | Verb           | Collecting and importing raw data streams or batch files into storage systems.                                                  |
|                                     | **Pre-process / Clean**           | Verb           | Resolving data noise, missing records, anomalies, and inconsistencies before model training.                                    |
|                                     | **Curate / Transform**            | Verb           | Converting raw unstructured/semi-structured records into clean, queryable analytic structures.                                  |

---

### Comprehensive Lecture Summary

#### 1. Course Objectives and Structure (DES431)

- **Target:** Provide fundamental and practical understanding of big data architectures, preprocessing methodologies, distributed compute frameworks, machine learning at scale, and visualization tools.
- **Syllabus Pathway:** Progresses from Big Data Foundations $\rightarrow$ Data Management & Preprocessing $\rightarrow$ Distributed Ecosystems (Hadoop, HDFS, MapReduce, AWS EMR) $\rightarrow$ SQL-on-Hadoop (Hive) $\rightarrow$ In-Memory Engine (Apache Spark, RDDs, DataFrames, Spark SQL, Streaming) $\rightarrow$ Scaled Machine Learning (SparkML) $\rightarrow$ Visual Analytics (Tableau) $\rightarrow$ Capstone Analytics Project.
- **Assessment Mix:** Random attendance (5%), Assignments & In-class Tutorials (20%), Group Analytics Project (30%), Midterm Exam (20%), Final Exam (25%).

#### 2. What is Big Data? (The 4 V's Paradigm)

Big Data describes datasets whose scale and structural complexity exceed the memory (RAM), disk storage, and processing capability of traditional single-node computers. It is characterized by the **4 V's**:

1.  **Volume (Scale):** Massive quantities of data generated continuously from IoT sensors, RFID tags, mobile phone GPS logs, social feeds, and web servers.
2.  **Variety (Complexity):** Heterogeneous formats including structured tabular data, semi-structured markup (XML, JSON), graph networks (social graphs, RDF), and streaming feeds.
3.  **Velocity (Speed):** Unprecedented arrival rates of data requiring immediate low-latency processing to prevent missed opportunities (e.g., real-time fraud mitigation, dynamic personalization).
4.  **Veracity (Quality/Uncertainty):** Inherent data imperfections, noise, sensor bias, and missing attributes requiring robust cleaning and validation.

#### 3. Paradigm Shifts in Data Architecture

- **Data Processing Eras:**
  - _OLTP (1970s–):_ Relational transaction engines dealing with structured data at rest.
  - _OLAP (1980s–1990s):_ Data warehouses dealing with historical data modeling and multidimensional analysis.
  - _RTAP (2000s–Present):_ Real-Time Analytics Processing and distributed streaming architectures.
- **Traditional BI vs. Modern Big Data Thinking:**
  - _Traditional:_ Schema-on-write (rigid schemas created upfront via ETL pipelines; unneeded data discarded). Relies on expensive specialized hardware and backward-looking reporting.
  - _Big Data:_ Schema-on-read (raw data retained indefinitely in native formats inside a **Data Lake**; schema and transformations applied dynamically at query time). Employs low-cost commodity clusters for proactive machine intelligence.
- **Data Flow:** Bulk/Event Ingestion $\rightarrow$ Data Lake Storage $\rightarrow$ Transformation & Machine Learning $\rightarrow$ Data Catalog & Business Intelligence (Tableau, Looker, Power BI) $\rightarrow$ Operational Action.

#### 4. Real-World Case Studies

- **Disaster Evacuation Monitoring (Great East Japan 311 Earthquake & Fukushima Incident):** GPS tracking of mobile device locations enabled near real-time monitoring of population displacement, evacuation corridor behaviors, and inter-prefecture migration across exclusion zones.
- **Large-Scale Trajectory Data Management:** Mining billions of raw GPS coordinates to reconstruct end-to-end trips, classify modes of transit (train, walking, bicycle), and deduce significant locations (home, workplace, retail hubs) using distributed compute clusters.

#### 5. Distributed Systems Principles & Apache Hadoop

To circumvent the physical bounds of single-machine compute/RAM, modern big data platforms adhere to four foundational principles:

1.  **Hide system-level details:** Programmers write logic without manually managing thread locks, race conditions, or machine failures.
2.  **Scale Out, not Up:** Expand compute capacity by adding standard commodity PCs horizontally rather than purchasing specialized SMP machines.
3.  **Move Processing to Data:** Execute code locally on the node storing the data blocks to avoid saturating network switches.
4.  **Seamless Scalability:** Maintain near-linear performance gains as nodes are incrementally added.

#### 6. Database vs. Hadoop Comparison

| Feature            | Traditional Database (RDBMS)         | Hadoop Distributed Framework               |
| :----------------- | :----------------------------------- | :----------------------------------------- |
| **Data Size**      | Gigabytes                            | Petabytes to Exabytes                      |
| **Access Pattern** | Interactive and Batch                | Primarily Batch & Distributed Flow         |
| **Updates**        | Read and write many times (ACID)     | Write Once, Read Many times (WORM)         |
| **Structure**      | Static Schema (Schema-on-Write)      | Dynamic Schema (Schema-on-Read)            |
| **Integrity**      | High / Strict ACID Constraints       | Low / Eventual Consistency                 |
| **Scaling**        | Nonlinear (expensive vertical scale) | Linear (horizontal scale on commodity PCs) |

#### 7. The Core Hadoop Ecosystem Architecture

- **HDFS Storage Layer:**
  - _NameNode:_ Master bookkeeper holding namespace metadata and block locations in RAM.
  - _Secondary NameNode:_ Auxiliary daemon merging edit logs with the filesystem image to facilitate quick recovery.
  - _DataNodes:_ Worker nodes storing raw replicated blocks (typically $3\times$ replication) across physical disks.
- **Processing & Resource Layer:**
  - _MapReduce / YARN:_ Parallel execution framework breaking compute tasks into distributed mapping and reduction phases coordinated by YARN resource managers.
- **Extended Ecosystem Components:**
  - _Hive:_ SQL abstraction layer allowing analytical querying via HiveQL over data stored in HDFS.
  - _HBase:_ Low-latency distributed NoSQL column store on top of HDFS.
  - _Pig:_ Procedural data flow scripting language for batch transformations.
  - _Spark:_ High-performance, in-memory execution engine superseding classic disk-bound MapReduce.
  - _Sqoop & Flume:_ Ingestion pipelines for structured databases (Sqoop) and unstructured log streams (Flume).
  - _ZooKeeper & Ambari:_ Coordination, distributed synchronization, and web-based cluster health monitoring.
