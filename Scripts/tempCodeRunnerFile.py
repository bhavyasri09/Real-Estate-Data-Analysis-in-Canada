import pandas as pd
import matplotlib.pyplot as plt
import mysql.connector

# Connect to MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="bhavya@05",
    database="real_estate_db"
)

# Fetch data
query = "SELECT city, AVG(price) AS avg_price FROM property_sales GROUP BY city ORDER BY avg_price DESC LIMIT 10"
df = pd.read_sql(query, conn)

# Plot
plt.figure(figsize=(10,5))
plt.bar(df["city"], df["avg_price"], color="skyblue")
plt.xlabel("City")
plt.ylabel("Average Price")
plt.title("Top 10 Cities with Highest Property Prices")
plt.xticks(rotation=45)
plt.savefig("./outputs/top_cities_prices.png")
plt.show()

conn.close()