-- Set up a MySQL database (ecommerce_db)
CREATE DATABASE ecomm_db;
USE ecomm_db;
-- Create a table (products) with appropriate data types for each column.
CREATE TABLE products (
    product_id VARCHAR(231) PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    discounted_price DECIMAL(10,2) NOT NULL,
    actual_price DECIMAL(10,2) NOT NULL,
    discount_percentage DECIMAL(5,2),
    discount_amount DECIMAL(10,2),
    rating FLOAT,
    rating_count INT,
    about_product TEXT,
    img_link TEXT,
    product_link TEXT
);
-- Load the amazon.csv data into MySQL - Done through jupyter notebook
SELECT * FROM products;
-- Retrieve top 10 most reviewed products.
SELECT product_name, CAST(rating_count AS UNSIGNED) AS rating_count FROM products ORDER BY CAST(rating_count AS UNSIGNED) DESC LIMIT 10;
-- Find the category with the highest average rating
SELECT category, ROUND(AVG(CAST(rating AS DECIMAL(10,2))), 2) AS avg_rating FROM products GROUP BY category ORDER BY avg_rating DESC LIMIT 1;
-- Identify products with a discount greater than 50%.
SELECT product_name, category, discount_percentage FROM products WHERE discount_percentage > 50 ORDER BY discount_percentage DESC;
-- List the top 5 best-selling categories (based on the number of reviews).
SELECT category, SUM(rating_count) AS total_reviews FROM products GROUP BY category ORDER BY total_reviews DESC LIMIT 5;
















