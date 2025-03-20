-- Recommendation to prevent Mismatches between quantity and total_price
CREATE TRIGGER check_quantity_total_price
BEFORE INSERT OR UPDATE ON sales_data
FOR EACH ROW
BEGIN
    -- Prevent mismatch where quantity is 0 but total_price is not 0
    IF NEW.quantity = 0 AND NEW.total_price != 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: If quantity is zero, total_price must also be zero';
    END IF;

    -- Prevent mismatch where quantity is negative but total_price is non-negative
    IF NEW.quantity < 0 AND NEW.total_price >= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: If quantity is negative, total_price must also be negative';
    END IF;

    -- Prevent mismatch where quantity is positive but total_price is negative
    IF NEW.quantity > 0 AND NEW.total_price < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: If quantity is positive, total_price must not be negative';
    END IF;
END;