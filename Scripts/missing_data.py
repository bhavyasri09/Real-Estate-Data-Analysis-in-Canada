import pandas as pd
import numpy as np
from datetime import datetime, timedelta

# Load the CSV
df = pd.read_csv("real_estate_cleaned.csv")

# Function to generate random dates from 2015 to 2024
def random_date():
    start_date = datetime(2015, 1, 1)
    end_date = datetime(2024, 12, 31)  # Ensuring date is within 2024
    return start_date + timedelta(days=np.random.randint(0, (end_date - start_date).days))

# Fill missing Sale Date with a random date between 2015 and 2024
df['sale_date'] = df['sale_date'].apply(lambda x: random_date().strftime('%Y-%m-%d') if pd.isnull(x) else x)

# Fill missing Buyer Age with a realistic random age (25-65)
df['buyer_age'] = df['buyer_age'].apply(lambda x: np.random.randint(25, 65) if pd.isnull(x) else x)

# Fill missing Buyer Income with a realistic salary range ($40K - $150K)
df['buyer_income'] = df['buyer_income'].apply(lambda x: np.random.randint(40000, 150000) if pd.isnull(x) else x)

# Fill missing Buyer Occupation with a random job title
occupations = ['Engineer', 'Doctor', 'Teacher', 'Manager', 'Artist', 'Entrepreneur']
df['buyer_occupation'] = df['buyer_occupation'].apply(lambda x: np.random.choice(occupations) if pd.isnull(x) else x)

# Save the updated CSV
df.to_csv("real_estate_cleaned_random.csv", index=False)

print("Missing values replaced with random data successfully!")