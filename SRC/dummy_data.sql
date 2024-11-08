-- Sample data for Customers
INSERT INTO Customers (name, email, phone, address)
VALUES 
('Alice Johnson', 'alice.j@example.com', '555-1234', '123 Maple St, Cityville'),
('Bob Smith', 'bob.s@example.com', '555-5678', '456 Oak St, Townsville'),
('Carol Lee', 'carol.l@example.com', '555-8765', '789 Pine St, Villagetown');

-- Sample data for Products
INSERT INTO Products (product_name, price, stock, supplier_id, category_id)
VALUES 
('Laptop', 999.99, 50, 1, 1),
('Smartphone', 499.99, 150, 2, 1),
('Tablet', 299.99, 80, 1, 2);

-- Sample data for Orders
INSERT INTO Orders (customer_id, status)
VALUES 
(1, 'Pending'),
(2, 'Shipped'),
(3, 'Delivered');

-- Sample data for Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES 
(1, 1, 1, 999.99),
(1, 2, 2, 499.99),
(2, 3, 1, 299.99);

-- Sample data for Payments
INSERT INTO Payments (order_id, amount, status)
VALUES 
(1, 1999.97, 'Completed'),
(2, 299.99, 'Pending'),
(3, 499.99, 'Completed');

-- Sample data for Categories
INSERT INTO Categories (name, parent_category_id)
VALUES 
('Electronics', 0),
('Mobile Devices', 1),
('Computers', 1);

-- Sample data for Shipments
INSERT INTO Shipments (order_id, carrier, tracking_number, delivery_status)
VALUES 
(1, 'FedEx', '123456789', 'In Transit'),
(2, 'UPS', '987654321', 'Delivered');

-- Sample data for Reviews
INSERT INTO Reviews (product_id, customer_id, rating, review_text)
VALUES 
(1, 1, 5, 'Excellent product! Highly recommended.'),
(2, 2, 4, 'Good value for money.'),
(3, 3, 3, 'Decent product, but could be better.');

-- Sample data for Suppliers
INSERT INTO Suppliers (name, contact_info)
VALUES 
('Tech Supply Co', '123 Tech Ave, Metropolis'),
('Gadget World', '456 Gadget Blvd, Technotown');

