   
   --identify duplicate customers using email matching (case-insensitive)
   SELECT LOWER(email) AS normalized_email, COUNT(*) AS duplicate_count
    FROM customer_data
    GROUP BY LOWER(email)
    HAVING COUNT(*) > 1

  -- standardize first_name and last_name (convert to proper case)
 SELECT 
  UPPER(LEFT(first_name, 1)) + LOWER(SUBSTRING(first_name, 2, LEN(first_name))) as first_name,
  UPPER(LEFT(last_name, 1)) + LOWER(SUBSTRING(last_name, 2, LEN(last_name))) as last_name 
FROM customer_data