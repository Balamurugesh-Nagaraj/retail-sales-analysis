CREATE DATABASE retail_sales;
USE retail_sales;
CREATE TABLE retail_sales_data (
    transaction_id INT PRIMARY KEY,
    date DATE,
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(50),
    quantity INT,
    price_per_unit INT,
    total_amount INT
);
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'retail_sales_data';
SELECT 
    COUNT(*) - COUNT(Transaction_ID) AS Missing_Transaction_ID,
    COUNT(*) - COUNT(Date) AS Missing_Date,
    COUNT(*) - COUNT(Customer_ID) AS Missing_Customer_ID,
    COUNT(*) - COUNT(Gender) AS Missing_Gender,
    COUNT(*) - COUNT(Age) AS Missing_Age,
    COUNT(*) - COUNT(Product_Category) AS Missing_Product_Category,
    COUNT(*) - COUNT(Quantity) AS Missing_Quantity,
    COUNT(*) - COUNT(Price_per_Unit) AS Missing_Price_Per_Unit,
    COUNT(*) - COUNT(Total_Amount) AS Missing_Total_Amount
FROM retail_sales_data;
SELECT 
    COUNT(*) AS total_rows, 
    MIN(Age) AS min_age, 
    MAX(Age) AS max_age, 
    AVG(Age) AS avg_age, 
    
    MIN(Quantity) AS min_quantity, 
    MAX(Quantity) AS max_quantity, 
    AVG(Quantity) AS avg_quantity, 
    SUM(Quantity) AS total_quantity, 

    MIN(Price_per_Unit) AS min_price_per_unit, 
    MAX(Price_per_Unit) AS max_price_per_unit, 
    AVG(Price_per_Unit) AS avg_price_per_unit, 
    SUM(Price_per_Unit) AS total_price_per_unit, 

    MIN(Total_Amount) AS min_total_amount, 
    MAX(Total_Amount) AS max_total_amount, 
    AVG(Total_Amount) AS avg_total_amount, 
    SUM(Total_Amount) AS total_sales
FROM retail_sales_data;
SELECT Date, Customer_ID, Gender, Age, Product_Category, Quantity, Price_per_Unit, Total_Amount, COUNT(*) AS duplicate_count
FROM retail_sales_data
GROUP BY Date, Customer_ID, Gender, Age, Product_Category, Quantity, Price_per_Unit, Total_Amount
HAVING COUNT(*) > 1;
SELECT Product_Category, SUM(Total_Amount) AS total_sales 
FROM retail_sales_data 
GROUP BY Product_Category 
ORDER BY total_sales DESC 
LIMIT 5;
SELECT MONTH(Date) AS month, SUM(Total_Amount) AS total_sales 
FROM retail_sales_data 
GROUP BY month 
ORDER BY total_sales DESC;
SELECT Customer_ID, SUM(Total_Amount) AS total_spent 
FROM retail_sales_data 
GROUP BY Customer_ID 
ORDER BY total_spent DESC 
LIMIT 5;
SELECT AVG(Total_Amount) AS Average_Order_Value 
FROM retail_sales_data;
SELECT Gender, SUM(Total_Amount) AS Total_Sales 
FROM retail_sales_data
GROUP BY Gender;
SELECT 
    CASE 
        WHEN Age BETWEEN 10 AND 20 THEN '10-20'
        WHEN Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age BETWEEN 51 AND 60 THEN '51-60'
        ELSE '60+' 
    END AS Age_Group, 
    COUNT(*) AS Customers_Count 
FROM retail_sales_data
GROUP BY Age_Group
ORDER BY Age_Group;

SELECT * FROM retail_sales_data;





