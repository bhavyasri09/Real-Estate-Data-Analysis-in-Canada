import pandas as pd
import mysql.connector
import numpy as np

# Load CSV data
df = pd.read_csv("./data/ca_real_estate.csv")

# Replace NaN with None for MySQL compatibility
df = df.replace({np.nan: None})

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="bhavya@05",
    database="real_estate_db"
)
cursor = conn.cursor()

# Corrected SQL Insert Statement
sql = """INSERT INTO property_sales 
         (property_type, city, state, price, bedrooms, bathrooms, square_feet, year_built, garage, lot_area) 
         VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""

# Convert DataFrame rows to a list of tuples
data = df[["Type", "City", "Province", "Price", "Bedrooms", "Bathrooms", "SqFt", "Year_Built", "Garage", "Lot_Area"]].values.tolist()

# Bulk insert instead of looping
cursor.executemany(sql, data)

# Commit and close connection
conn.commit()
cursor.close()
conn.close()
print("Data loaded successfully!")