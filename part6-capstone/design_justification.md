## Storage Systems

I have designed a polyglot persistence architecture to handle the diverse needs of the hospital
PostgreSQL (RDBMS):Chosen for patient records and billing to ensure ACID compliance and data integrity.}
MongoDB (NoSQL):Used for real-time ICU vitals because its document model handles high-velocity, unstructured sensor data without performance lag.
Pinecone (Vector DB):Stores clinical note embeddings, allowing doctors to perform semantic "plain English" searches across patient histories.
Snowflake (Data Warehouse):** Acts as the central analytical hub where data is aggregated for AI risk prediction and management reporting.

## OLTP vs OLAP Boundary
TheOLTP boundary** includes PostgreSQL and MongoDB, which manage the day-to-day "live" operations of the hospital. The OLAP boundary** begins at the Snowflake Data Warehouse. Data is moved from the OLTP systems into Snowflake via ETL pipelines, ensuring that heavy analytical queries do not slow down critical patient-care systems.

## Trade-offs

One significant trade-off is System Complexity.Managing four different database technologies requires more specialized expertise than a single-database setup. However, this is mitigated by using **Managed Cloud Services, which reduces the operational burden on the hospital's IT staff while providing the high performance required for patient safety.
