import pandas as pd
import mysql.connector

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="bhavya@05",
    database="real_estate_db"
)

# Fetch cleaned data
query = "SELECT * FROM property_sales"
df = pd.read_sql(query, conn)

# Save to Excel
df.to_excel("./outputs/cleaned_real_estate.xlsx", index=False)

print("Processed data saved successfully!")
conn.close()