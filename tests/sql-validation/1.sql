
-- Negative or zero quantities
SELECT *
FROM sales_data
WHERE quantity <= 0
   OR total_price < 0;

-- Negative total_price values
SELECT *
FROM sales_data
WHERE "total_price" < 0;

--  Mismatches between quantity and total_price
SELECT *
FROM sales_data
WHERE 
    (quantity = 0 AND total_price != 0)   -- Mismatch where quantity is zero but total_price is not
    OR (quantity < 0 AND total_price >= 0)  -- Mismatch where quantity is negative but total_price is positive
    OR (quantity > 0 AND total_price < 0);

