## Storage Systems

The architecture uses multiple specialised storage systems to support the hospital’s four goals efficiently. For structured patient records, treatments, and billing data, a **relational database such as PostgreSQL or MySQL** is used. Healthcare systems require strict consistency and reliability because patient information must always remain accurate. Relational databases support **ACID transactions**, making them well suited for Electronic Health Records (EHR), patient admissions, and treatment history. This database also provides the historical data required for the **readmission risk prediction model**.

To handle **real-time ICU monitoring data**, a **time-series database such as TimescaleDB or InfluxDB** is used. ICU devices continuously generate high-frequency data such as heart rate, blood pressure, and oxygen levels. Time-series databases are optimised for storing timestamped data and performing fast queries on trends over time. This allows the system to efficiently store and analyse real-time vitals for monitoring and alerting.

For **natural language search across patient history and clinical notes**, a **vector database such as FAISS, Pinecone, or Weaviate** is used. Clinical notes and documents are converted into embeddings using language models. When doctors ask questions such as “Has this patient had a cardiac event before?”, the query is also converted into an embedding and compared with stored vectors. The vector database enables **semantic similarity search**, allowing doctors to retrieve relevant information even if the wording differs from the original documents.

Finally, a **data warehouse such as Snowflake, BigQuery, or Amazon Redshift** is used for hospital management reporting. The warehouse stores cleaned and aggregated historical data from operational systems. This enables efficient analytical queries for **monthly reports such as bed occupancy rates, department costs, and operational performance metrics**.

---

## OLTP vs OLAP Boundary

In this architecture, the **OLTP (Online Transaction Processing)** system includes the relational database storing patient records, treatments, admissions, and billing information. These systems handle high volumes of small transactions such as updating patient data, recording treatments, or logging medical events. The primary goal of the OLTP layer is **data accuracy, consistency, and fast transactional updates**.

The **OLAP (Online Analytical Processing)** system begins once operational data is extracted through ETL pipelines and loaded into the **data warehouse**. In the warehouse, data is transformed and structured for analytical queries, such as trend analysis, cost reporting, and management dashboards. Unlike OLTP systems, OLAP systems are optimised for **large-scale aggregations and reporting rather than frequent transactional updates**. Separating OLTP and OLAP systems ensures that analytical workloads do not interfere with the performance of the hospital’s operational systems.

---

## Trade-offs

One significant trade-off in this design is the **increased complexity caused by using multiple specialised databases**. While each storage system is optimised for a specific purpose (relational data, time-series monitoring, vector search, and analytics), managing several databases increases operational overhead. It requires additional infrastructure, monitoring, and integration pipelines to keep data consistent across systems.

To mitigate this issue, the architecture can use **centralised data orchestration tools such as Apache Airflow or managed cloud data pipelines**. These tools automate ETL workflows and ensure reliable data movement between systems. Additionally, implementing strong data governance practices and monitoring tools can help maintain data consistency and system reliability. While the multi-database approach introduces complexity, it allows the system to scale effectively and support diverse workloads required in modern healthcare applications.
