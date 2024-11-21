CREATE DATABASE IF NOT EXISTS E_COMMERCE_DB;

USE E_COMMERCE_DB ;

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

CREATE TABLE Categories (
         category_id INT PRIMARY KEY AUTO_INCREMENT,
         name VARCHAR(100) NOT NULL ,
         parent_category_id INT  NULL ,
         FOREIGN KEY (parent_category_id) REFERENCES Categories(category_id)
     );

 CREATE TABLE Shipments (
    shipment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    carrier VARCHAR(50) NOT NULL DEFAULT 'DELIVERY_COURIER',
    customer_id INT NOT NULL ,
    status VARCHAR(20) DEFAULT 'PROCESSING',
    delivery_status ENUM('Pending', 'In Transit', 'Delivered'),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (customer_id ) REFERENCES Customers(customer_id)

 );   
    
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL ,
    ustomer_id INT NOT NULL ,
    rating TINYINT CHECK (rating BETWEEN 1 AND 5) NOT NULL ,
    review_text TEXT ,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
 );

CREATE TABLE Cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    added_on DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
 );












