import pandas as pd

df = pd.read_csv(r"C:\Users\DELL\OneDrive\Desktop\SQL\project 1(05.03).csv")

print(df.head())
#check dataset information
print(df.shape)

print(df.columns)

print(df.describe())
# find 10 products
top_products = df.groupby("description")["quantity"].sum()

top_products = top_products.sort_values(ascending=False).head(10)

print(top_products)
#sales by country
country_sales = df.groupby("country")["revenue"].sum()

country_sales = country_sales.sort_values(ascending=False)

print(country_sales.head())
#monthly sales trend
df["invoicedate"] = pd.to_datetime(df["invoicedate"])

df["month"] = df["invoicedate"].dt.to_period("M")

monthly_sales = df.groupby("month")["revenue"].sum()

print(monthly_sales)
#simple visualization
import matplotlib.pyplot as plt

monthly_sales.plot()

plt.title("Monthly Sales Trend")

plt.show()
# Data for RFM Analysis-create customer summary
rfm = df.groupby("customerid").agg({
    "invoicedate":"max",
    "invoiceno":"count",
    "revenue":"sum"
})

rfm.columns = ["last_purchase","frequency","monetary"]

print(rfm.head())

# top product analysis
top_products = df.groupby("description")["quantity"].sum().sort_values(ascending=False).head(10)

print(top_products)
#country revenue analysis
country_sales = df.groupby("country")["revenue"].sum().sort_values(ascending=False)

print(country_sales)
df.to_csv("retail_sales_cleaned.csv", index=False)
print("File saved successfully")
df.to_csv(r"C:\Users\DELL\OneDrive\Documents\python\retail_sales_cleaned.csv", index=False)