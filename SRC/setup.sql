
# Store Information about customer who make purchases on the platform.

CREATE TABLE IF NOT EXISTS Customers (
         customer_id INT PRIMARY KEY AUTO_INCREMENT,
         name VARCHAR(100) NOT NULL,
         email VARCHAR(100) NOT NULL UNIQUE,
         phone VARCHAR(20) NOT NULL,
         address TEXT
    );

# Contains details about products available for purchase.

CREATE TABLE IF NOT EXISTS Products (
         product_id INT PRIMARY KEY AUTO_INCREMENT,
         product_name VARCHAR(100) NOT NULL,
         price DECIMAL(10, 2) NOT NULL,
         stock INT DEFAULT 0 NOT NULL,
         supplier_id INT,
         category_id INT
     );

# Records All Customer order,tracking their status and details.

CREATE TABLE IF NOT EXISTS Orders (
         order_id INT PRIMARY KEY AUTO_INCREMENT,
         customer_id INT NOT NULL,
         order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
         status VARCHAR(20) NOT NULL,
         FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
     );

# Lists each item in an order, including quantity and price.

CREATE TABLE IF NOT EXISTS Order_Items (
         item_id INT PRIMARY KEY AUTO_INCREMENT,
         order_id INT NOT NULL,
         product_id INT NOT NULL,
         quantity INT NOT NULL,
         price DECIMAL(10, 2) NOT NULL,
         FOREIGN KEY (order_id) REFERENCES Orders(order_id),
         FOREIGN KEY (product_id) REFERENCES Products(product_id)
     );

# Tracks all Payment Transactions for Orders

CREATE TABLE IF NOT EXISTS Payments (
        payment_id INT PRIMARY KEY AUTO_INCREMENT,
        order_id INT NOT NULL,
        payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
        amount DECIMAL(10, 2) NOT NULL,
        status VARCHAR(20) NOT NULL,
        FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    );

# Organizes products into categories, making it easier for customer to browse.

CREATE TABLE IF NOT EXISTS Categories (
         category_id INT PRIMARY KEY AUTO_INCREMENT,
         name VARCHAR(100) NOT NULL ,
         parent_category_id INT NOT NULL ,
         FOREIGN KEY (parent_category_id) REFERENCES Categories(category_id)
     );

# Manages All shipping information tracking number and carrier.

CREATE TABLE IF NOT EXISTS Shipments (
         shipment_id INT PRIMARY KEY AUTO_INCREMENT,
         order_id INT NOT NULL ,
         carrier VARCHAR(50) NOT NULL ,
         tracking_number VARCHAR(100) NOT NULL ,
         delivery_status ENUM('Pending', 'In Transit', 'Delivered'),
         FOREIGN KEY (order_id) REFERENCES Orders(order_id)
     );

# Allows customers to review products they have purchased.

CREATE TABLE IF NOT EXISTS Reviews (
         review_id INT PRIMARY KEY AUTO_INCREMENT,
         product_id INT NOT NULL ,
         customer_id INT NOT NULL ,
         rating TINYINT CHECK (rating BETWEEN 1 AND 5) NOT NULL ,
         review_text TEXT ,
         FOREIGN KEY (product_id) REFERENCES Products(product_id),
         FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
     );

# Holds information about suppliers for product inventory management.

CREATE TABLE IF NOT EXISTS Suppliers (
         supplier_id INT PRIMARY KEY AUTO_INCREMENT,
         name VARCHAR(100) NOT NULL ,
         contact_info TEXT  NOT NULL
     );




