use real_estate_db;
-- Step 1: Count total records
SELECT COUNT(*) AS total_properties FROM property_sales;

-- Step 2: Overview of price distribution
SELECT 
    MIN(price) AS min_price, 
    MAX(price) AS max_price, 
    AVG(price) AS avg_price, 
    MEDIAN(price) AS median_price
FROM property_sales;

-- Step 3: Count properties by type
SELECT property_type, COUNT(*) AS total_count 
FROM property_sales 
GROUP BY property_type 
ORDER BY total_count DESC;

-- Step 4: Average price per property type
SELECT property_type, ROUND(AVG(price), 2) AS avg_price
FROM property_sales
GROUP BY property_type
ORDER BY avg_price DESC;

-- Step 5: Average price per city (top 10 cities)
SELECT city, ROUND(AVG(price), 2) AS avg_price, COUNT(*) AS total_sales
FROM property_sales
GROUP BY city
ORDER BY avg_price DESC
LIMIT 10;

-- Step 6: Year-wise property sales trend
SELECT YEAR(sale_date) AS year, COUNT(*) AS total_sales
FROM property_sales
GROUP BY YEAR(sale_date)
ORDER BY year ASC;

-- Step 7: Average size of properties sold (sq. feet) by type
SELECT property_type, ROUND(AVG(square_feet), 2) AS avg_size
FROM property_sales
GROUP BY property_type
ORDER BY avg_size DESC;

-- Step 8: Properties sold with a garage vs. without a garage
SELECT 
    CASE WHEN garage > 0 THEN 'With Garage' ELSE 'Without Garage' END AS garage_status,
    COUNT(*) AS total_count
FROM property_sales
GROUP BY garage_status;

-- Step 9: Correlation check between bedrooms and price
SELECT bedrooms, ROUND(AVG(price), 2) AS avg_price, COUNT(*) AS count
FROM property_sales
GROUP BY bedrooms
ORDER BY bedrooms ASC;

-- Step 10: Identifying luxury properties (top 5% highest-priced)
SELECT * FROM property_sales 
ORDER BY price DESC 
LIMIT (SELECT ROUND(0.05 * COUNT(*)) FROM property_sales);

-- Step 11: City-wise highest & lowest-priced properties
SELECT city, 
       MAX(price) AS highest_price, 
       MIN(price) AS lowest_price
FROM property_sales
GROUP BY city
ORDER BY highest_price DESC;