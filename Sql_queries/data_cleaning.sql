
use real_estate_db;
DELETE t1 FROM property_sales t1
INNER JOIN property_sales t2 
ON t1.id > t2.id 
AND t1.property_type = t2.property_type 
AND t1.city = t2.city 
AND t1.state = t2.state
AND t1.price = t2.price
AND t1.bedrooms = t2.bedrooms
AND t1.bathrooms = t2.bathrooms
AND t1.square_feet = t2.square_feet
AND t1.year_built = t2.year_built
AND t1.garage = t2.garage
AND t1.lot_area = t2.lot_area;

-- Step 2: Remove rows where price is 0 or NULL (invalid records)
DELETE FROM property_sales WHERE price IS NULL OR price = 0;

-- Step 3: Standardize city and state names (capitalize first letter)
UPDATE property_sales 
SET city = CONCAT(UCASE(LEFT(city, 1)), LCASE(SUBSTRING(city, 2))),
    state = UPPER(state);

-- Step 4: Fix invalid year values (assuming year should be >= 1800)
UPDATE property_sales SET year_built = NULL WHERE year_built < 1800 OR year_built > YEAR(CURDATE());

-- Step 5: Fix negative or unrealistic values for bedrooms, bathrooms, square_feet, lot_area
UPDATE property_sales 
SET bedrooms = NULL WHERE bedrooms < 0;
UPDATE property_sales 
SET bathrooms = NULL WHERE bathrooms < 0;
UPDATE property_sales 
SET square_feet = NULL WHERE square_feet < 100;
UPDATE property_sales 
SET lot_area = NULL WHERE lot_area < 100;

-- Step 6: Handle missing values (optional - replace NULL with default values)
UPDATE property_sales 
SET garage = 0 WHERE garage IS NULL;

-- Step 7: Ensure numeric values have correct data types
ALTER TABLE property_sales
MODIFY price DECIMAL(12,2),
MODIFY bedrooms INT,
MODIFY bathrooms INT,
MODIFY square_feet INT,
MODIFY year_built INT,
MODIFY garage INT,
MODIFY lot_area INT;

-- Step 8: Add an index for faster querying (optional)
CREATE INDEX idx_city ON property_sales(city);
CREATE INDEX idx_price ON property_sales(price);
CREATE INDEX idx_bedrooms ON property_sales(bedrooms);