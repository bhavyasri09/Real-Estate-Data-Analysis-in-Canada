-- Average property price per city
SELECT city, AVG(price) AS avg_price 
FROM property_sales 
GROUP BY city 
ORDER BY avg_price DESC;

-- Price trends over time
SELECT YEAR(sale_date) AS year, MONTH(sale_date) AS month, AVG(price) AS avg_price
FROM property_sales 
GROUP BY year, month 
ORDER BY year, month;