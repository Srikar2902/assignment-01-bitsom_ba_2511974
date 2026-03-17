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

Keeping everything in one flat table might seem "simpler" at first glance, but as the data grows, it becomes a Confusing.
My manager recently suggested that keeping everything in one big table is "simpler" and that normalizing the data is just "over-engineering." While I understand the desire for simplicity, using a single table for a growing business is like building a house without a foundation—it might look fine at first, but it will eventually collapse.
Based on the examples in our dataset, a flat structure is actually more complex to maintain. It forces us to repeat the same information (like office addresses and customer emails) thousands of times. This isn't just a waste of space; it’s a recipe for human error. As we saw with the "Nariman Point" inconsistency, even a small typo can make our reports unreliable.
Normalization isn't about making things complicated; it's about organization. By splitting the data into 3rd Normal Form (3NF), we give Customers, Products, and Sales Reps their own dedicated "homes." 
This means:
1)We can add new products to our catalog before they sell.
2)We can update a staff member's email in one single place.
3)We can delete old orders without losing our valuable customer contact list.
In short, normalization turns a messy spreadsheet into a professional database that provides a "single version of truth" for the entire company.
