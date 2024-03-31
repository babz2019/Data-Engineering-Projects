-- Drop Transaction records table if exist
DROP TABLE IF EXISTS raw_Py_trans_records;

-- Creating the Songs Table
CREATE TABLE IF NOT EXISTS raw_Py_trans_records(
user_id VARCHAR(50),
event_time VARCHAR(50),
order_id VARCHAR(50),
product_id VARCHAR(50),
category_id VARCHAR(50),
category_code VARCHAR(50),
brand VARCHAR(50),
price FLOAT8
);

-- Confirming the Songs table creation
SELECT *
FROM raw_Py_trans_records;

-- Loading data into Songs Table from CSV file
COPY raw_Py_trans_records 
FROM 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/input_files/raw_sql_transaction_record.csv'
WITH (FORMAT csv, HEADER);

SELECT count(*)
FROM raw_Py_trans_records;


-- Drop Transaction records table if exist
DROP TABLE IF EXISTS "clean_Pytransact_records_tb";


SELECT count(*)
FROM "clean_Pytransact_records_tb";