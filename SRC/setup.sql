CREATE TABLE Customers (
         customer_id INT PRIMARY KEY AUTO_INCREMENT,
         name VARCHAR(100) NOT NULL,
         email VARCHAR(100) NOT NULL UNIQUE,
         phone VARCHAR(20) NOT NULL,
         address TEXT
    );


CREATE TABLE Products (
         product_id INT PRIMARY KEY AUTO_INCREMENT,
         product_name VARCHAR(100) NOT NULL,
         price DECIMAL(10, 2) NOT NULL,
         stock INT DEFAULT 0 NOT NULL,
         supplier_id INT,
         category_id INT
     );


CREATE TABLE Orders (
         order_id INT PRIMARY KEY AUTO_INCREMENT,
         customer_id INT NOT NULL,
         order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
         status VARCHAR(20) NOT NULL,
         FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
     );


CREATE TABLE Order_Items (
         item_id INT PRIMARY KEY AUTO_INCREMENT,
         order_id INT NOT NULL,
         product_id INT NOT NULL,
         quantity INT NOT NULL,
         price DECIMAL(10, 2) NOT NULL,
         FOREIGN KEY (order_id) REFERENCES Orders(order_id),
         FOREIGN KEY (product_id) REFERENCES Products(product_id)
     );


CREATE TABLE Payments (
        payment_id INT PRIMARY KEY AUTO_INCREMENT,
        order_id INT NOT NULL,
        payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
        amount DECIMAL(10, 2) NOT NULL,
        status VARCHAR(20) NOT NULL,
        FOREIGN KEY (order_id) REFERENCES Orders(order_id)
    );

CREATE TABLE Categories (
         category_id INT PRIMARY KEY AUTO_INCREMENT,
         name VARCHAR(100) NOT NULL ,
         parent_category_id INT NOT NULL ,
         FOREIGN KEY (parent_category_id) REFERENCES Categories(category_id)
     );


CREATE TABLE Shipments (
         shipment_id INT PRIMARY KEY AUTO_INCREMENT,
         order_id INT NOT NULL ,
         carrier VARCHAR(50) NOT NULL ,
         tracking_number VARCHAR(100) NOT NULL ,
         delivery_status ENUM('Pending', 'In Transit', 'Delivered'),
         FOREIGN KEY (order_id) REFERENCES Orders(order_id)
     );


CREATE TABLE Reviews (
         review_id INT PRIMARY KEY AUTO_INCREMENT,
         product_id INT NOT NULL ,
         customer_id INT NOT NULL ,
         rating TINYINT CHECK (rating BETWEEN 1 AND 5) NOT NULL ,
         review_text TEXT ,
         FOREIGN KEY (product_id) REFERENCES Products(product_id),
         FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
     );


CREATE TABLE Suppliers (
         supplier_id INT PRIMARY KEY AUTO_INCREMENT,
         name VARCHAR(100) NOT NULL ,
         contact_info TEXT NOT NULL
     );




