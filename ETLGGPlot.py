# Install required packages
# !pip install pandas matplotlib seaborn

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Set the working directory to Lab03 folder
# Replace the path with your actual path
working_directory = "C:/Users/ual-laptop/Desktop/MIS545/Lab03"
groceryTransactions_path = "GroceryTransactions.csv"
groceryTransactions_full_path = f"{working_directory}/{groceryTransactions_path}"

# Reading GroceryTransactions.csv into a pandas DataFrame
groceryTransactions1 = pd.read_csv(groceryTransactions_full_path)

# Displaying groceryTransactions1 in the console
print(groceryTransactions1)

# Displaying the first 20 rows of groceryTransactions1 in the console
print(groceryTransactions1.head(20))

# Displaying the structure of groceryTransactions1 in the console
print(groceryTransactions1.info())

# Displaying the summary of groceryTransactions1 in the console
print(groceryTransactions1.describe())

# Using the pandas mean() function to display the mean
print(groceryTransactions1['Revenue'].mean())

# Using the pandas median() function to display the median
print(groceryTransactions1['UnitsSold'].median())

# Using the pandas std() function to display the standard deviation
print(groceryTransactions1['UnitsSold'].std())

# Using the pandas quantile() function to display the IQR
print(groceryTransactions1['UnitsSold'].quantile(0.75) - groceryTransactions1['UnitsSold'].quantile(0.25))

# Using the pandas min() and max() functions to display the min and max of revenue
print(groceryTransactions1['Revenue'].min())
print(groceryTransactions1['Revenue'].max())

# Creating a new DataFrame named groceryTransactions2
groceryTransactions2 = groceryTransactions1[["PurchaseDate", "Homeowner", "Children", "AnnualIncome", "UnitsSold", "Revenue"]]

# Displaying all of the features in groceryTransactions2 for transactions 
# made by non-homeowners with at least 4 children.
print(groceryTransactions2[(groceryTransactions2['Homeowner'] == 'N') & (groceryTransactions2['Children'] > 3)])

# Displaying all of the records and features in groceryTransactions2 
# that were either made by customers in the $150K + annual income category 
# OR had more than 6 units sold
print(groceryTransactions2[(groceryTransactions2['AnnualIncome'] == '$150K +') | (groceryTransactions2['UnitsSold'] > 6)])

# Displaying the average transaction revenue grouped by annual income level. 
# Sort the results by average transaction revenue from largest to smallest
average_transaction_revenue = groceryTransactions2.groupby('AnnualIncome')['Revenue'].mean().reset_index()
average_transaction_revenue = average_transaction_revenue.sort_values(by='Revenue', ascending=False)
print(average_transaction_revenue)

# Creating a new DataFrame called groceryTransactions3
groceryTransactions3 = groceryTransactions2.copy()

# Calculating a new feature called AveragePricePerUnit by dividing revenue by units sold
groceryTransactions3['AveragePricePerUnit'] = groceryTransactions3['Revenue'] / groceryTransactions3['UnitsSold']

# Displaying the groceryTransactions3 DataFrame on the console
print(groceryTransactions3)

# Creating a histogram of AveragePricePerUnit using seaborn
plt.figure(figsize=(10, 6))
sns.histplot(data=groceryTransactions3, x='AveragePricePerUnit', bins=30, color='orange', edgecolor='black', alpha=0.5)
plt.title('Average Price Per Unit Histogram')
plt.show()

# Creating a boxplot of revenue using seaborn
plt.figure(figsize=(10, 6))
sns.boxplot(data=groceryTransactions3, x='Revenue', color='#AB0520')
plt.title('Boxplot of Revenue')
plt.show()
