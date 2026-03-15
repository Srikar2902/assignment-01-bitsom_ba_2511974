## Architecture Recommendation

For a fast-growing food delivery startup handling GPS logs, text reviews, payment transactions, and restaurant images, I recommend a Data Lakehouse** architecture. 

A Data Lakehouse combines the flexibility and low-cost storage of a Data Lake with the performance and ACID transactions of a Data Warehouse. This is the ideal choice for three specific reasons:

1. Support for Diverse Data Types:** The startup deals with structured data (payment transactions), semi-structured data (GPS logs and text reviews), and unstructured data (menu images). A traditional Data Warehouse would struggle to ingest images and logs efficiently, whereas a Lakehouse can store all these formats in their raw state while still allowing for high-performance querying.

2. unified Platform for AI and Analytics:** Food delivery relies heavily on machine learning for route optimization (GPS logs) and sentiment analysis (customer reviews). A Lakehouse provides a single platform where data scientists can run ML models directly on the raw data, while business analysts can simultaneously run SQL reports on the structured transaction data without moving it between systems.

3. Cost-Effective Scalability:** Startups grow rapidly and generate massive volumes of telemetry data. By using a Lakehouse (often built on top of object storage like S3), the company can scale storage and compute independently. This avoids the high costs of a proprietary Data Warehouse while maintaining the schema enforcement and data versioning necessary for reliable business reporting.
