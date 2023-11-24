## Requirements

Before running the code, ensure that you have the following R packages installed:

- `tidyverse`

You can install this package using the following R command:

```R
install.packages("tidyverse")
```

## Usage

1. Clone this repository:

   ```bash
   git clone https://github.com/varunkapuria96/etl-ggplot-with-r.git
   ```

2. Navigate to the repository directory:

   ```bash
   cd etl-ggplot-with-r
   ```

3. Run the R script `ETL_GGPlot.R` in your R environment or RStudio.

## Description

The code performs the following tasks:

1. Loads the required library, `tidyverse`.

2. Reads the dataset, "GroceryTransactions.csv," into a tibble named `groceryTransactions1`.

3. Displays the summary statistics of the `Revenue` feature, including mean, median, standard deviation, interquartile range, minimum, and maximum values.

4. Creates a new tibble named `groceryTransactions2` containing selected columns: `PurchaseDate`, `Homeowner`, `Children`, `AnnualIncome`, `UnitsSold`, and `Revenue`.

5. Filters and displays transactions made by non-homeowners with at least 4 children and transactions made by customers with an annual income of $150K+ or more than 6 units sold.

6. Calculates and displays the average transaction revenue grouped by annual income level, sorted from largest to smallest.

7. Creates a new tibble named `groceryTransactions3` containing all the features in `groceryTransactions2` along with a new calculated feature, `AveragePricePerUnit`, calculated by dividing revenue by units sold.

8. Generates a histogram of `AveragePricePerUnit` and a boxplot of `Revenue` using ggplot for visualization.

## Dataset

The dataset, "GroceryTransactions.csv," contains information about grocery transactions, including purchase date, homeowner status, number of children, annual income, units sold, and revenue.
