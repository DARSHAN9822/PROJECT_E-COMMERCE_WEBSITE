-- WRITE STORE PROCEDURE FOR ADDTOCART  

CREATE PROCEDURE `AddToCart`(
    IN p_customer_id INT,
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE existing_quantity INT;
    DECLARE product_stock INT;

    START TRANSACTION;

    SELECT stock INTO product_stock
    FROM Products
    WHERE product_id = p_product_id;

    IF product_stock < p_quantity THEN
        
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock available';
    ELSE
        
        SELECT quantity INTO existing_quantity
        FROM Cart
        WHERE customer_id = p_customer_id AND product_id = p_product_id;

        
        IF existing_quantity IS NOT NULL THEN
            UPDATE Cart
            SET quantity = quantity + p_quantity
            WHERE customer_id = p_customer_id AND product_id = p_product_id;
        ELSE
            
            INSERT INTO Cart (customer_id, product_id, quantity, added_on)
            VALUES (p_customer_id, p_product_id, p_quantity, NOW());
        END IF;
  
        COMMIT;
    END IF;


-- WRITE STORE PROCEDURE FOR RE_STOCK _INVENTORY 

CREATE PROCEDURE `sp_RestockInventory`(
    IN p_product_id INT,
    IN p_quantity INT
)
BEGIN
    UPDATE Products
    SET stock = stock + p_quantity
    WHERE product_id = p_product_id;
END     


-- WRITE STORE PROCEDURE FOR UPDATE_ORDER_STATUS

CREATE PROCEDURE `sp_UpdateOrderStatus`(
    IN p_order_id INT,
    IN p_new_status VARCHAR(20)
)
BEGIN
    UPDATE Orders
    SET status = p_new_status
    WHERE order_id = p_order_id;
END 



DELIMITER //

CREATE PROCEDURE sp_CreateOrder(
    IN customerId INT
)
BEGIN
    DECLARE orderId INT;
    DECLARE prodId INT;
    DECLARE qty INT;
    DECLARE availableStock INT;
    DECLARE done INT DEFAULT 0;
    
    DECLARE cartCursor CURSOR FOR
        SELECT product_id, quantity FROM Cart WHERE customer_id = customerId;
    
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    
    START TRANSACTION;

    
    INSERT INTO Orders (customer_id, order_date, status)
    VALUES (customerId, NOW(), 'Processing');

    
    SET orderId = LAST_INSERT_ID();

    
    OPEN cartCursor;

    FETCH cartCursor INTO prodId, qty;

    WHILE done = 0 DO
        
        SELECT stock INTO availableStock
        FROM Products
        WHERE product_id = prodId;

        
        IF availableStock < qty THEN
            ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient stock available';
        ELSE
            
            INSERT INTO Order_Items (order_id, product_id, quantity, price)
            VALUES (orderId, prodId, qty, (SELECT price FROM Products WHERE product_id = prodId));

            
            UPDATE Products
            SET stock = stock - qty
            WHERE product_id = prodId;
        END IF;

        
        FETCH cartCursor INTO prodId, qty;
    END WHILE;

    
    CLOSE cartCursor;

    
    DELETE FROM Cart
    WHERE customer_id = customerId;

    COMMIT;
END //

DELIMITER ;
