# walmart-sales
# Walmart Sales Analysis (SQL Project)

## Project Overview

This project analyzes Walmart's weekly sales data to uncover trends, seasonal patterns, and the impact of external factors like holidays, temperature, fuel prices, CPI, and unemployment.

## Objectives
* Analyze the relationship between sales and the different macroeconomic variables in the dataset.
* Unemployment vs Sales data analysis
* Fuel Price Impact on sales
* CPI (Inflation) vs Sales
* Which year had the highest sales?
* How was the weather during the highest sales year?

---

## Tools & Technologies

* SQL (PostgreSQL)
* CSV Dataset

---

## Dataset

The dataset contains:

* Store number
* Date (weekly)
* Weekly sales
* Holiday flag
* Temperature
* Fuel price
* CPI (inflation)
* Unemployment rate

---

## Database Setup

```sql
CREATE TABLE walmart (
    store INT,
    date DATE,
    weekly_sales numeric,
    holiday_flag INT,
    temperature numeric,
    fuel_price numeric,
    cpi numeric,
    unemployment numeric
);
```

## Key SQL Queries

### 1. Unemployment vs Sales data analysis

```sql
SELECT 
    Unemployment,
    AVG(weekly_sales)
FROM walmart
GROUP BY Unemployment
ORDER BY Unemployment;
```

### 2. Fuel Price Impact on Sales

```sql
SELECT 
    Fuel_Price,
    AVG(weekly_sales)
FROM walmart
GROUP BY Fuel_Price
ORDER BY Fuel_Price;
```

### 3. CPI (Inflation) vs Sales

```sql
SELECT 
    cpi,
    AVG(weekly_sales)
FROM walmart
GROUP BY cpi
ORDER BY cpi;
```

### 4. Which year had the highest sales?

```sql
select Extract(year from date) as year, sum(weekly_sales) as totalsales
from walmart
group by year
order by totalsales desc
limit 1;

```
### 5. How was the weather during the year which had the highest sales?
```sql
SELECT 
    EXTRACT(year from date) as year,
    SUM(weekly_sales) as totalsales
FROM walmart
GROUP BY year
ORDER BY totalsales desc
limit 1;

SELECT 
    EXTRACT(YEAR FROM date) AS year,
    AVG(temperature) AS avg_temp,
    MIN(temperature) AS min_temp,
    MAX(temperature) AS max_temp
FROM walmart
WHERE EXTRACT(YEAR FROM date) = (
    SELECT EXTRACT(YEAR FROM date)
    FROM walmart
    GROUP BY EXTRACT(YEAR FROM date)
    ORDER BY SUM(weekly_sales) DESC
    LIMIT 1
)
GROUP BY year;

```
---

## Key Insights

1. Unemployment vs Sales

Slight negative relationship

As unemployment increases → sales slightly decrease
Indicates reduced consumer spending power

Insight:
Unemployment has a minor but logical impact on retail sales, reflecting economic sensitivity.

2. Fuel Price Impact on Sales

No significant relationship

Sales remain stable across fuel price changes
Correlation is close to zero

Insight:
Fuel prices do not directly influence Walmart sales, possibly due to Walmart’s low-cost positioning.

3. CPI (Inflation) vs Sales

Weak negative correlation

Higher CPI → slightly lower sales
Impact is not very strong

Insight:
Inflation affects purchasing power, but Walmart’s pricing strategy helps maintain steady sales.

4. Year with Highest Sales

2011 recorded the highest total sales

Insight:

Peak performance year
Could be due to favorable economic conditions or internal strategies

5. Weather During Highest Sales Year

Moderate and stable weather conditions

No extreme temperature variations
Sales remained strong regardless of weather

Insight:
Weather does not play a major role in overall sales performance.

Final Business Understanding

Sales are primarily driven by time-based factors (year, season, holidays) rather than external variables like weather or fuel prices. While macroeconomic indicators like unemployment and inflation have a slight impact, they are not strong predictors of sales performance.

---

## Business Recommendations

* Increase promotions during holidays
* Focus on high-performing stores
* Monitor economic indicators for forecasting

---
