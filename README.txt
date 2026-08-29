# Customer Shopping Behavior Analysis

## Overview
This project analyzes customer shopping behavior using transactional data from **3,900 purchases** across multiple product categories. The goal is to uncover insights into spending patterns, customer segments, product preferences, and subscription behavior in order to guide strategic business decisions.

## Dataset

| | |
|---|---|
| **Rows** | 3,900 |
| **Columns** | 18 |
| **Missing data** | 37 values in `Review Rating` |

**Key features:**
- **Customer demographics:** Age, Gender, Location, Subscription Status
- **Purchase details:** Item Purchased, Category, Purchase Amount, Season, Size, Color
- **Shopping behavior:** Discount Applied, Promo Code Used, Previous Purchases, Frequency of Purchases, Review Rating, Shipping Type

## Tech Stack
- **Python (Pandas)** — data cleaning, exploration, and feature engineering
- **PostgreSQL** — structured SQL analysis of business questions
- **Power BI** — interactive dashboard for visual reporting

## Methodology

### 1. Data Preparation (Python)
- Loaded the dataset with `pandas`; inspected structure with `df.info()` and `df.describe()`
- Imputed the 37 missing `Review Rating` values using the median rating per product category
- Standardized all column names to `snake_case`
- Engineered new features: `age_group` (binned ages) and `purchase_frequency_days`
- Checked `discount_applied` vs. `promo_code_used` for redundancy and dropped `promo_code_used`
- Loaded the cleaned DataFrame into PostgreSQL for SQL analysis

### 2. Business Analysis (SQL)
Ten key business questions were answered using PostgreSQL queries, including:
1. Revenue by gender
2. High-spending customers who used discounts
3. Top 5 products by average rating
4. Shipping type comparison (Standard vs. Express)
5. Subscribers vs. non-subscribers (spend & revenue)
6. Discount-dependent products
7. Customer segmentation (New / Returning / Loyal)
8. Top 3 products per category
9. Repeat buyers vs. subscription status
10. Revenue by age group

### 3. Dashboard (Power BI)
An interactive Power BI dashboard was built with slicers for subscription status, gender, category, and shipping type, featuring KPI cards and revenue/sales breakdowns by category and age group.

## Key Findings
- **Revenue by gender:** Male customers generated $157,890 vs. $75,191 from female customers.
- **Top-rated products:** Gloves (3.86), Sandals (3.84), and Boots (3.82) lead average ratings.
- **Shipping:** Express shipping customers spend slightly more on average ($60.48 vs. $58.46).
- **Subscriptions:** Non-subscribers (2,847 customers) drive far more total revenue ($170,436) than subscribers (1,053 customers, $62,645) — subscription status alone isn't a strong spend predictor.
- **Discount dependency:** Hats, Sneakers, and Coats have the highest discount usage rates (~48–50%).
- **Customer segments:** 79.9% of customers are classified as Loyal, 18.0% Returning, and 2.1% New.
- **Age groups:** Revenue is fairly evenly distributed, with Young Adults contributing the most ($62,143).

## Business Recommendations
1. **Boost Subscriptions** — Promote exclusive benefits to grow the subscriber base.
2. **Customer Loyalty Programs** — Reward repeat buyers to move them into the Loyal segment.
3. **Review Discount Policy** — Balance sales boosts with margin control.
4. **Product Positioning** — Highlight top-rated and best-selling products in campaigns.
5. **Targeted Marketing** — Focus on high-revenue age groups and Express-shipping users.

## Project Structure
```
├── data/
│   └── customer_shopping_data.csv       # Raw transactional dataset
├── notebooks/
│   └── data_cleaning_eda.ipynb          # Python data cleaning & feature engineering
├── sql/
│   └── business_queries.sql             # SQL queries for the 10 business questions
├── dashboard/
│   └── customer_behavior_dashboard.pbix # Power BI dashboard file
└── README.md
```

## How to Reproduce
1. Load the raw CSV into a Pandas DataFrame and run the cleaning/feature-engineering steps.
2. Push the cleaned DataFrame into a PostgreSQL database.
3. Run the queries in `sql/business_queries.sql` to reproduce each analysis.
4. Open `dashboard/customer_behavior_dashboard.pbix` in Power BI Desktop and refresh the data connection to explore the interactive dashboard.

## Author's Notes
This analysis is intended as a template for retail/e-commerce customer behavior studies and can be extended with additional segmentation (e.g., RFM analysis) or predictive modeling (e.g., churn or subscription-propensity models).
