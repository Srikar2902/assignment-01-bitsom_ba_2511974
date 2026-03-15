## ETL Decisions

### Decision 1 — Date Standardization

Problem:The raw `retail_transactions.csv` file contained dates in three different formats: `DD/MM/YYYY`, `DD-MM-YYYY`, and `YYYY-MM-DD`. This inconsistency makes it impossible to perform time-series analysis or sort data chronologically.
Resolution: During the ETL process, I used a standardized parser to convert every date entry into the ISO standard `YYYY-MM-DD`. I then extracted unique dates to populate the `dim_date` table, creating a numeric `date_key` (e.g., 20231026) for faster join performance in the warehouse.

### Decision 2 — Category Normalization

Problem: Product categories were inconsistent due to human entry errors. For example, "electronics" appeared in lowercase while others were capitalized. Additionally, the same category was referred to as both "Grocery" and "Groceries."
Resolution: I implemented a mapping rule to standardize all strings. I converted all entries to Title Case and merged synonyms (e.g., all "Grocery" entries were mapped to "Groceries"). This ensures that BI reports for "Electronics" capture all relevant sales without missing data due to casing or spelling variations.

### Decision 3 — Handling Missing Store Cities

Problem: The `store_city` column contained several NULL values. However, every row still had a `store_name` (e.g., "Chennai Anna"). 
Resolution Since the store name often implies the location, I used a "lookup" strategy. I identified rows where both name and city were present to create a master list of store locations. I then used this list to fill in the missing city values for the `dim_store` table, ensuring the dimension is complete and reliable for geographical reporting.
