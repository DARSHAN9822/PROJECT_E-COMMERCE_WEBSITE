-- Insert data into Categories
INSERT INTO Categories (name, parent_category_id)
VALUES
    ('Electronics', NULL),
    ('Mobiles', 1),
    ('Laptops', 1),
    ('Furniture', NULL),
    ('Chairs', 4),
    ('Tables', 4);

-- Insert data into Customers
INSERT INTO Customers (name, email, phone, address)
VALUES
    ('John Doe', 'john.doe@example.com', '1234567890', '123 Elm Street'),
    ('Jane Smith', 'jane.smith@example.com', '9876543210', '456 Oak Street'),
    ('Alice Johnson', 'alice.johnson@example.com', '5554443333', '789 Pine Street');

-- Insert data into Products
INSERT INTO Products (product_name, price, stock, category_id)
VALUES
    ('iPhone 14', 999.99, 50, 2),
    ('Samsung Galaxy S23', 899.99, 30, 2),
    ('MacBook Pro', 1299.99, 20, 3),
    ('Ergonomic Chair', 149.99, 100, 5),
    ('Office Table', 199.99, 40, 6);

-- Insert data into Orders
INSERT INTO Orders (customer_id, status)
VALUES
    (1, 'Processing'),
    (2, 'Shipped'),
    (3, 'Delivered');

-- Insert data into Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES
    (1, 1, 1, 999.99),
    (1, 4, 2, 299.98),
    (2, 2, 1, 899.99),
    (3, 5, 1, 199.99);

-- Insert data into Shipments
INSERT INTO Shipments (order_id, customer_id, status, delivery_status)
VALUES
    (1, 1, 'In Transit', 'In Transit'),
    (2, 2, 'Shipped', 'In Transit'),
    (3, 3, 'Delivered', 'Delivered');

-- Insert data into Reviews
INSERT INTO Reviews (product_id, customer_id, rating, review_text)
VALUES
    (1, 1, 5, 'Amazing product! Worth the price.'),
    (2, 2, 4, 'Great phone, but could be cheaper.'),
    (5, 3, 3, 'Good table, but packaging was damaged.');

-- Insert data into Cart
INSERT INTO Cart (customer_id, product_id, quantity)
VALUES
    (1, 3, 1),
    (2, 4, 2),
    (3, 1, 1);
