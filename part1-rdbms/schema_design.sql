-- =========================
-- CUSTOMERS TABLE
-- =========================
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(100) NOT NULL
);

INSERT INTO customers VALUES
('C001', 'Rahul Mehta', 'rahul@example.com', 'Delhi'),
('C002', 'Priya Sharma', 'priya@example.com', 'Mumbai'),
('C003', 'Amit Verma', 'amit@example.com', 'Bangalore'),
('C004', 'Neha Singh', 'neha@example.com', 'Pune'),
('C005', 'Arjun Patel', 'arjun@example.com', 'Ahmedabad');


-- =========================
-- PRODUCTS TABLE
-- =========================
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO products VALUES
('P001', 'Laptop', 'Electronics', 750.00),
('P002', 'Mouse', 'Electronics', 20.00),
('P003', 'Keyboard', 'Electronics', 35.00),
('P004', 'Notebook', 'Stationery', 5.00),
('P005', 'Pen Pack', 'Stationery', 3.50);


-- =========================
-- SALES REPRESENTATIVES TABLE
-- =========================
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

INSERT INTO sales_reps VALUES
('SR01', 'Anil Kapoor', 'anil@company.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Sanjay Rao', 'sanjay@company.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ritu Gupta', 'ritu@company.com', 'Bangalore Office, MG Road, Bangalore - 560001'),
('SR04', 'Karan Malhotra', 'karan@company.com', 'Pune Office, Shivaji Nagar, Pune - 411005'),
('SR05', 'Meera Joshi', 'meera@company.com', 'Ahmedabad Office, CG Road, Ahmedabad - 380009');


-- =========================
-- ORDERS TABLE
-- =========================
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

INSERT INTO orders VALUES
('ORD1001', 'C001', 'SR01', '2024-01-10'),
('ORD1002', 'C002', 'SR02', '2024-01-12'),
('ORD1003', 'C003', 'SR03', '2024-01-15'),
('ORD1004', 'C004', 'SR01', '2024-01-18'),
('ORD1005', 'C005', 'SR02', '2024-01-20');


-- =========================
-- ORDER ITEMS TABLE
-- =========================
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1, 'ORD1001', 'P001', 1),
(2, 'ORD1002', 'P002', 2),
(3, 'ORD1003', 'P003', 1),
(4, 'ORD1004', 'P004', 5),
(5, 'ORD1005', 'P005', 3);
