-- Insert sample data into Customers
INSERT INTO Customers (name, email, phone, address) VALUES
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street, Springfield, IL'),
('Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak Avenue, Lincoln, NE'),
('Robert Brown', 'robert.brown@example.com', '555-123-4567', '789 Pine Road, Denver, CO'),
('Alice Green', 'alice.green@example.com', '321-654-9870', '101 Maple Drive, Austin, TX'),
('Charlie White', 'charlie.white@example.com', '654-321-9870', '202 Birch Street, Chicago, IL'),
('Eve Black', 'eve.black@example.com', '321-987-6543', '303 Cedar Lane, Boston, MA'),
('Liam Yellow', 'liam.yellow@example.com', '987-321-6543', '404 Willow Blvd, Miami, FL'),
('Olivia Blue', 'olivia.blue@example.com', '555-321-1234', '505 Pinecrest Way, Seattle, WA'),
('Mason Red', 'mason.red@example.com', '555-987-3210', '606 Ashford Avenue, Atlanta, GA'),
('Sophia Pink', 'sophia.pink@example.com', '777-123-4567', '707 Elmwood Street, Los Angeles, CA');

-- Insert sample data into Categories
INSERT INTO Categories (name, parent_category_id) VALUES
('Electronics', NULL),
('Clothing', NULL),
('Mobile Phones', 1),
('Laptops', 1),
('Men', 2),
('Women', 2);

-- Insert sample data into Products
INSERT INTO Products (product_name, price, stock, category_id) VALUES
('Smartphone', 699.99, 50, 3),
('Laptop', 999.99, 30, 4),
('T-Shirt', 19.99, 100, 5),
('Jeans', 49.99, 80, 6),
('Smartwatch', 199.99, 150, 3),
('Headphones', 89.99, 200, 1),
('Tablet', 299.99, 60, 4),
('Sneakers', 59.99, 120, 5),
('Jacket', 79.99, 90, 6),
('Charger', 24.99, 300, 1);

-- Insert sample data into Orders
INSERT INTO Orders (customer_id, status) VALUES
(1, 'Completed'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Completed'),
(5, 'Completed'),
(6, 'Completed'),
(7, 'Processing'),
(8, 'Completed'),
(9, 'Shipped'),
(10, 'Completed');

-- Insert sample data into Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 699.99),
(1, 5, 1, 199.99),
(2, 2, 1, 999.99),
(2, 6, 1, 89.99),
(3, 3, 2, 19.99),
(3, 4, 1, 49.99),
(4, 5, 1, 199.99),
(5, 7, 1, 299.99),
(6, 8, 1, 59.99),
(7, 9, 1, 79.99);

-- Insert sample data into Shipments
INSERT INTO Shipments (order_id, carrier, customer_id, delivery_status) VALUES
(1, 'DELIVERY_COURIER', 1, 'Delivered'),
(2, 'DELIVERY_COURIER', 2, 'In Transit'),
(3, 'DELIVERY_COURIER', 3, 'Pending'),
(4, 'DELIVERY_COURIER', 4, 'Delivered'),
(5, 'DELIVERY_COURIER', 5, 'Delivered'),
(6, 'DELIVERY_COURIER', 6, 'Delivered'),
(7, 'DELIVERY_COURIER', 7, 'In Transit'),
(8, 'DELIVERY_COURIER', 8, 'Delivered'),
(9, 'DELIVERY_COURIER', 9, 'Shipped'),
(10, 'DELIVERY_COURIER', 10, 'Delivered');

-- Insert sample data into Reviews
INSERT INTO Reviews (product_id, customer_id, rating, review_text) VALUES
(1, 1, 5, 'Excellent phone! Worth the price.'),
(2, 2, 4, 'Good laptop, but the battery life could be better.'),
(3, 3, 3, 'Decent T-shirt, but the material feels cheap.'),
(4, 4, 5, 'Perfect jeans, very comfortable.'),
(5, 5, 4, 'Good smartwatch, but the screen could be brighter.'),
(6, 6, 4, 'Sound quality is great, but it could be more comfortable.'),
(7, 7, 5, 'Very fast tablet, great value for the price.'),
(8, 8, 4, 'Nice sneakers, but the size runs small.'),
(9, 9, 5, 'Warm jacket, great for winter.'),
(10, 10, 4, 'Good charger, but the cable could be longer.');

-- Insert sample data into Cart
INSERT INTO Cart (customer_id, product_id, quantity) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 1),
(5, 5, 1),
(6, 6, 2),
(7, 7, 1),
(8, 8, 2),
(9, 9, 1),
(10, 10, 1);

