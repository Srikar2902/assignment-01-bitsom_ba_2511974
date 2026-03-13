## Anomaly Analysis

Below are specific examples of data inconsistencies (anomalies) identified in the `orders_flat.csv` file.

### 1. Insert Anomaly
We cannot add a new Product(e.g., "Wireless Mouse" with ID `P009`) to our system unless someone actually buys it. 
Because the CSV is a "flat file," every row requires an `order_id`. If we have a new product in the warehouse but no one has ordered it yet, there is no way to record its name or price in this table.

### 2. Update Anomaly
Sales Representative **Deepak Joshi (SR01)**.
Specific Rows:** Look at **Row 1** and **Row 37**. 
Issue:In Row 1, his office address is written as "Nariman Point," but in Row 37, it is abbreviated to "Nariman Pt." If Deepak moves to a new office, we would have to manually find and change his address in dozens of different rows. If we miss even one row, our data becomes inconsistent.

### 3. Delete Anomaly
Customer Priya Sharma (C002)
Specific Rows:Row 0 (Order `ORD1027`) and Row 3 (Order `ORD1002`).
IssueIf Priya cancels these two specific orders and we delete these rows from the CSV, we lose her contact information (`priya@gmail.com`) and her city (`Delhi`) entirely. We have no "Customer List" separate from the "Order List," so deleting an order accidentally deletes the customer from our history.


## Normalization Justification

Keeping everything in one flat table might seem "simpler" at first glance, but as the data grows, it becomes a liability. Using the examples above, we can see that a flat structure forces us to repeat the same information (like office addresses and customer emails) over and over again. This not only wastes storage space but, more importantly, leads to human error.

By normalizing this data into Third Normal Form (3NF), we create separate "Master Tables" for Customers, Products, and Sales Reps. This means:
1.  Integrity A Sales Rep's address is stored in exactly one place. An update there reflects everywhere.
2.  Flexibility: We can add new products to our catalog (P009) even if they haven't been sold yet.
3.  Safety: Deleting a transaction (an order) does not result in the permanent loss of a customer's profile.

Normalization is not "over-engineering"; it is the transition from a simple spreadsheet to a professional, reliable database system that a business can actually trust.
