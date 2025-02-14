import pandas as pd
import mysql.connector

# Connect to MySQL Database
conn = mysql.connector.connect(
    host="localhost",
    user="root",  # Change this if needed
    password="bhavya@05",  # Change this
    database="real_estate_db"
)

# Define SQL query to fetch cleaned data
query = """
SELECT 
    id, property_type, city, state, price, bedrooms, bathrooms, 
    square_feet, sale_date, buyer_age, buyer_income, 
    buyer_occupation, year_built, garage, lot_area
FROM property_sales;
"""

# Load data into Pandas DataFrame
df = pd.read_sql(query, conn)

# Save DataFrame to CSV for Tableau
df.to_csv("real_estate_cleaned.csv", index=False)

# Close connection
conn.close()

print("✅ Data successfully retrieved and saved as 'real_estate_cleaned.csv' for Tableau!")