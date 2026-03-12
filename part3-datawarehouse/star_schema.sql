-- ===============================
-- DIMENSION TABLE: DATE
-- ===============================
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

INSERT INTO dim_date VALUES
(1, '2023-01-15', 15, 1, 2023),
(2, '2023-02-05', 5, 2, 2023),
(3, '2023-02-20', 20, 2, 2023),
(4, '2023-03-11', 11, 3, 2023),
(5, '2023-04-18', 18, 4, 2023),
(6, '2023-05-09', 9, 5, 2023),
(7, '2023-06-21', 21, 6, 2023),
(8, '2023-07-14', 14, 7, 2023),
(9, '2023-08-29', 29, 8, 2023),
(10, '2023-12-12', 12, 12, 2023);


-- ===============================
-- DIMENSION TABLE: STORE
-- ===============================
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(100) NOT NULL
);

INSERT INTO dim_store VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Mumbai Central', 'Mumbai'),
(4, 'Bangalore East', 'Bangalore');


-- ===============================
-- DIMENSION TABLE: PRODUCT
-- ===============================
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

INSERT INTO dim_product VALUES
(1, 'Laptop Pro 15', 'Electronics'),
(2, 'Wireless Headphones', 'Electronics'),
(3, 'Smartphone X', 'Electronics'),
(4, 'Office Chair', 'Furniture'),
(5, 'Standing Desk', 'Furniture');


-- ===============================
-- FACT TABLE: SALES
-- ===============================
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_sales DECIMAL(12,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);


-- ===============================
-- FACT TABLE DATA (CLEANED)
-- ===============================
INSERT INTO fact_sales VALUES
(1, 9, 1, 1, 3, 49262.78, 147788.34),
(2, 10, 1, 2, 11, 23226.12, 255487.32),
(3, 2, 1, 3, 20, 48703.39, 974067.80),
(4, 3, 2, 2, 14, 23226.12, 325165.68),
(5, 1, 1, 1, 10, 58851.01, 588510.10),
(6, 4, 3, 4, 6, 15200.00, 91200.00),
(7, 5, 4, 5, 4, 31000.00, 124000.00),
(8, 6, 2, 3, 8, 48703.39, 389627.12),
(9, 7, 3, 1, 5, 49262.78, 246313.90),
(10, 8, 4, 2, 9, 23226.12, 209035.08);
