CREATE TABLE property_sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    property_type VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(50),
    price DECIMAL(12,2),
    bedrooms INT,
    bathrooms INT,
    square_feet INT,
    sale_date DATE,
    buyer_age INT,
    buyer_income DECIMAL(10,2),
    buyer_occupation VARCHAR(100)
);

