// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  { "product_id": "E101", "name": "Ultra-Wide Monitor", "category": "Electronics", "price": 35000, "specs": { "warranty": "2 Years", "voltage": "110V-240V" } },
  { "product_id": "C202", "name": "Classic Denim Jacket", "category": "Clothing", "price": 4500, "details": { "material": "Cotton", "sizes": ["S", "M", "L"] } },
  { "product_id": "G303", "name": "Greek Yogurt", "category": "Groceries", "price": 150, "expiry_date": ISODate("2024-11-15") }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({ 
  category: "Electronics", 
  price: { $gt: 20000 } 
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({ 
  category: "Groceries", 
  expiry_date: { $lt: ISODate("2025-01-01") } 
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { product_id: "E101" },
  { $set: { discount_percent: 15 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });
// Explanation: Creating an index on 'category' significantly speeds up queries that filter by product type. 
// Instead of scanning every document MongoDB can jump directly to the relevant records.
