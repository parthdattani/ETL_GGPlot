# View all installed packages
installed.packages()

# Install tidyverse
# install.packages("tidyverse")

#Initiate tidyverse
library(tidyverse)

# Setting the working directory to your Lab03 folder
setwd("Add CSV location here")
getwd()

# Reading GroceryTransactions.csv into a tibble
groceryTransactions1 <- read_csv("GroceryTransactions.csv")

# Displaying groceryTransactions1 in the console
print(groceryTransactions1)

# Displaying the first 20 rows of groceryTransactions1 in the console
head(groceryTransactions1, n = 20)

# Displaying the structure of groceryTransactions1 in the console
str(groceryTransactions1)

# Displaying the summary of groceryTransactions1 in the console
summary(groceryTransactions1)

# Using the dplyr summarize() function to display the mean
print(summarize(.data = groceryTransactions1, mean(Revenue)))

# Using the dplyr summarize() function to display the median
print(summarize(.data = groceryTransactions1, median(UnitsSold)))

# Using the dplyr summarize() function to display the standard deviation
print(summarize(.data = groceryTransactions1, sd(UnitsSold)))

# Using the dplyr summarize() function to display the IQR
print(summarize(.data = groceryTransactions1, IQR(UnitsSold)))

# Using the dplyr summarize() function to display the min and max of revenue
print(summarize(.data = groceryTransactions1, min(Revenue)))
print(summarize(.data = groceryTransactions1, max(Revenue)))

# Creating a new tibble named groceryTransactions2 to contain the columns 
# PurchaseDate, Homeowner, Children, AnnualIncome, UnitsSold, Revenue
# using as_tibble
groceryTransactions2 <- as_tibble(groceryTransactions1[,c("PurchaseDate",
                                                          "Homeowner",
                                                          "Children",
                                                          "AnnualIncome",
                                                          "UnitsSold",
                                                          "Revenue")])

# Creating a new tibble named groceryTransactions2 to contain the columns 
# PurchaseDate, Homeowner, Children, AnnualIncome, UnitsSold, Revenue
# using select
groceryTransactions2 <- select(.data = groceryTransactions1
                               , PurchaseDate
                               , Homeowner
                               , Children
                               , AnnualIncome
                               , UnitsSold
                               , Revenue)

# Displaying all of the features in groceryTransactions2 for transactions 
# made by non-homeowners with at least 4 children.
print(filter(.data = groceryTransactions2,
             Homeowner == "N" & Children > 3))

# Displaying all of the records and features in groceryTransactions2 
# that were either made by customers in the $150K + annual income category 
# OR had more than 6 units sold
print(filter(.data = groceryTransactions2,
             AnnualIncome == "$150K +" | UnitsSold > 6))

# Displaying the average transaction revenue grouped by annual income level. 
# Sort the results by average transaction revenue from largest to smallest
print(groceryTransactions2 %>%
      group_by(AnnualIncome) %>%
      summarize(AverageTransactionRevenue = mean(Revenue)) %>%
      arrange(desc(AverageTransactionRevenue)))

# Creating a new tibble called groceryTransactions3 that contains 
# all of the features in groceryTransactions2 along with 
# a new calculated feature called AveragePricePerUnit calculated by 
# dividing revenue by units sold
groceryTransactions3 <- groceryTransactions2 %>%
  mutate(AveragePricePerUnit = (Revenue/UnitsSold) )

# Displaying the groceryTransactions3 tibble on the console
print(groceryTransactions3)

# Creating a histogram of AveragePricePerUnit using ggplot
histogramAveragePricePerUnit <- ggplot(data = groceryTransactions3,
                                       aes(x=AveragePricePerUnit))

# Using geom_histogram function to modify historgram
histogramAveragePricePerUnit + geom_histogram(binwidth = 1,
                                              color = "black",
                                              fill = "orange",
                                              alpha = 0.50) +

# Adding title to the Histogram
ggtitle("Average Price Per Unit Histogram")

# Creating a boxplot of revenue ofusing ggplot
boxplotRevenue <- ggplot(data = groceryTransactions3,
                         aes(x=Revenue))

# Using geom_boxplot funciton to modify boxplot
boxplotRevenue + geom_boxplot(color = "#0C234B",
                              fill = "#AB0520") + 

# Adding title to the boxplot
ggtitle("Boxplot of Revenue")

# Saving .Rhistory file
savehistory(file = ".Rhistory")
