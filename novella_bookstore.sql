-- =========================================================
-- Novella Bookstore Database System
-- =========================================================

DROP DATABASE IF EXISTS novella_bookstore;
CREATE DATABASE novella_bookstore;
USE novella_bookstore;

-- ---------------------------------------------------------
-- Table: tbl_customers
-- ---------------------------------------------------------
CREATE TABLE tbl_customers
(
  PK_customer_id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
  customer_name VARCHAR(225) NOT NULL,
  customer_address VARCHAR(225) NOT NULL,
  customer_phone_no VARCHAR(20) NOT NULL
);

-- ---------------------------------------------------------
-- Table: tbl_books
-- ---------------------------------------------------------
CREATE TABLE tbl_books
(
  PK_book_id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
  book_title VARCHAR(225) NOT NULL,
  book_price DECIMAL(10,2) NOT NULL
);

-- ---------------------------------------------------------
-- Table: tbl_orders
-- ---------------------------------------------------------
CREATE TABLE tbl_orders
(
  PK_order_id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
  order_date DATE NOT NULL,
  PK_customer_id INT NOT NULL,
  FOREIGN KEY (PK_customer_id) REFERENCES tbl_customers(PK_customer_id)
);

-- ---------------------------------------------------------
-- Table: tbl_order_details
-- ---------------------------------------------------------
CREATE TABLE tbl_order_details
(
  PK_order_details_id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
  book_quantity INT NOT NULL,
  PK_order_id INT NOT NULL,
  PK_book_id INT NOT NULL,
  FOREIGN KEY (PK_order_id) REFERENCES tbl_orders(PK_order_id),
  FOREIGN KEY (PK_book_id) REFERENCES tbl_books(PK_book_id)
);

-- =========================================================
-- TEST DATA (5 ROWS EACH)
-- =========================================================

-- Customers
INSERT INTO tbl_customers (customer_name, customer_address, customer_phone_no) VALUES
('Kaung Min Thant', 'Yangon', '091234567'),
('Min Thant Lwin', 'Mandalay', '092345678'),
('Min Thant', 'Bago', '093456789'),
('Kay Min Thant', 'Naypyidaw', '094567890'),
('Minthant Koko', 'Taunggyi', '095678901');

-- Books
INSERT INTO tbl_books (book_title, book_price) VALUES
('Harry Potter', 25.00),
('Data Science Basics', 40.00),
('Advanced SQL', 35.50),
('Business Management', 30.00),
('Modern Fiction', 22.75);

-- Orders
INSERT INTO tbl_orders (order_date, PK_customer_id) VALUES
('2025-11-01', 1),
('2025-11-02', 2),
('2025-11-03', 3),
('2025-11-04', 4),
('2025-11-05', 5);

-- Order Details
INSERT INTO tbl_order_details (book_quantity, PK_order_id, PK_book_id) VALUES
(2, 1, 1),
(1, 2, 2),
(3, 3, 3),
(2, 4, 4),
(4, 5, 5);

-- =========================================================
-- VIEW DATA
-- =========================================================
SELECT * FROM tbl_customers;
SELECT * FROM tbl_books;
SELECT * FROM tbl_orders;
SELECT * FROM tbl_order_details;

-- =========================================================
-- ERD RELATIONSHIP TEST (JOIN)
-- =========================================================
SELECT
  c.customer_name,
  o.PK_order_id,
  o.order_date,
  b.book_title,
  od.book_quantity,
  b.book_price,
  (od.book_quantity * b.book_price) AS line_total
FROM tbl_customers c
JOIN tbl_orders o ON c.PK_customer_id = o.PK_customer_id
JOIN tbl_order_details od ON o.PK_order_id = od.PK_order_id
JOIN tbl_books b ON od.PK_book_id = b.PK_book_id;

-- ---------------------------------------------------------
-- Table: tbl_authors
-- ---------------------------------------------------------
USE novella_bookstore;
CREATE TABLE tbl_authors
(
  PK_author_id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
  author_name VARCHAR(225) NOT NULL,
  author_bio TEXT
);

-- (Update tbl_books to include a Foreign Key)
ALTER TABLE tbl_books ADD FK_author_id INT;
-- Note: In a real project, you'd add the FK constraint here too.

