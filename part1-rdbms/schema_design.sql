-- 1.2 — Schema Design (3NF)

CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address TEXT NOT NULL
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Populating data (5 rows per table)
INSERT INTO customers VALUES 
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Arjun Nair', 'arjun@gmail.com', 'Bangalore'),
('C004', 'Sanya Iyer', 'sanya@gmail.com', 'Mumbai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Delhi');

INSERT INTO products VALUES 
('P001', 'Laptop', 'Electronics', 55000.00),
('P002', 'Mouse', 'Electronics', 800.00),
('P003', 'Desk Chair', 'Furniture', 8500.00),
('P004', 'Notebook', 'Stationery', 120.00),
('P005', 'Headphones', 'Electronics', 3200.00);

INSERT INTO sales_reps VALUES 
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001'),
('SR04', 'Sunita Rao', 'sunita@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR05', 'Karan Johar', 'karan@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001');

INSERT INTO orders VALUES 
('ORD1001', 'C001', 'SR01', 'P001', 1, '2023-01-10'),
('ORD1002', 'C002', 'SR02', 'P005', 1, '2023-01-17'),
('ORD1003', 'C003', 'SR03', 'P003', 2, '2023-02-05'),
('ORD1004', 'C004', 'SR01', 'P002', 5, '2023-02-12'),
('ORD1005', 'C005', 'SR02', 'P004', 10, '2023-03-01');
