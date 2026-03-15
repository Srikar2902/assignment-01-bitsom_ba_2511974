-- 3.1 — Star Schema Design

-- dim_date
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL
);

-- dim_store
CREATE TABLE dim_product (
    product_key INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- dim_product 
CREATE TABLE dim_store (
    store_key INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);

-- Fact Table
CREATE TABLE fact_sales (
    fact_id INT AUTO_INCREMENT PRIMARY KEY,
    date_key INT NOT NULL,
    product_key INT NOT NULL,
    store_key INT NOT NULL,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_revenue DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key)
);


INSERT INTO dim_date (date_key, full_date, month, year, quarter) VALUES 
(20230115, '2023-01-15', 1, 2023, 1),
(20230205, '2023-02-05', 2, 2023, 1),
(20230331, '2023-03-31', 3, 2023, 1),
(20230809, '2023-08-09', 8, 2023, 3),
(20231026, '2023-10-26', 10, 2023, 4);

INSERT INTO dim_product (product_name, category) VALUES 
('Speaker', 'Electronics'),
('Tablet', 'Electronics'),
('Phone', 'Electronics'),
('Atta 10kg', 'Groceries'),
('Jeans', 'Clothing');

INSERT INTO dim_store (store_name, store_city) VALUES 
('Chennai Anna', 'Chennai'),
('Delhi South', 'Delhi'),
('Bangalore MG', 'Bangalore'),
('Pune FC Road', 'Pune');


INSERT INTO fact_sales (date_key, product_key, store_key, units_sold, unit_price, total_revenue) VALUES 
(20230809, 1, 1, 3, 49262.78, 147788.34),
(20231026, 2, 1, 11, 23226.12, 255487.32),
(20230205, 3, 1, 20, 48703.39, 974067.80),
(20230205, 2, 2, 14, 23226.12, 325165.68),
(20230115, 1, 1, 10, 58851.01, 588510.10),
(20230809, 4, 3, 12, 52464.00, 629568.00),
(20230331, 1, 4, 6, 58851.01, 353106.06),
(20231026, 5, 4, 16, 2317.47, 37079.52),
(20230115, 1, 3, 9, 27469.99, 247229.91),
(20230809, 1, 3, 3, 58851.01, 176553.03);
