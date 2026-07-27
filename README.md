# 🛒 E-Commerce Sales Analysis
### End-to-End Data Analytics Project using Python, SQL & Power BI

![Python](https://img.shields.io/badge/Python-3.x-blue?style=for-the-badge&logo=python)
![SQL](https://img.shields.io/badge/SQL-MySQL-orange?style=for-the-badge&logo=mysql)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi)
![Status](https://img.shields.io/badge/Project-Completed-success?style=for-the-badge)

---

# 📌 Project Overview

Businesses generate thousands of sales transactions every day, but raw data is often incomplete, inconsistent, duplicated, and unsuitable for direct analysis.

This project demonstrates an **end-to-end data analytics workflow** by transforming a messy e-commerce sales dataset into actionable business insights using **Python, SQL, and Power BI**.

The project covers every stage of the analytics lifecycle:

- Data Cleaning
- Exploratory Data Analysis
- SQL Business KPI Analysis
- Interactive Dashboard Development
- Business Insight Generation

---

# 🎯 Objective

The objective of this project was to simulate a real-world analytics scenario by cleaning messy sales data and answering important business questions such as:

- Which product categories generate the highest revenue?
- Which products contribute most to sales?
- How does revenue change month-over-month?
- Which payment methods are preferred by customers?
- How much revenue is affected by returned orders?

---

# 🛠 Tech Stack

| Technology | Purpose |
|------------|---------|
| Python | Data Cleaning & Analysis |
| Pandas | Data Manipulation |
| NumPy | Numerical Operations |
| Jupyter Notebook | Exploratory Data Analysis |
| MySQL | Business KPI Analysis |
| Power BI | Interactive Dashboard |
| Git & GitHub | Version Control |

---

# 📂 Project Structure

```text
E-Commerce-Sales-Analysis/
│
├── dataset/
│   ├── cleaned/
│   │      ecommerce_sales_data.csv
│   │
│   └── messy/
│          messy_ecommerce_sales_data.csv
│
├── EDA/
│      ECOMMERCE_SALES_EDA.ipynb
│
├── SQL/
│      kpis.sql
│
│      Results/
│      ├── 01_Overall_Business_Summary.png
│      ├── 02_Revenue_by_Category.png
│      ├── 03_Top_Products.png
│      ├── 04_Monthly_Revenue_Trend.png
│      ├── 05_Month_over_Month_Growth.png
│      ├── 06_Customer_Segmentation.png
│      ├── 07_Payment_Method.png
│      ├── 08_Order_Status.png
│      ├── 09_Top_Customers.png
│      └── 10_Return_Impact.png
│
└── PowerBI/
       ECOMMERCE_SALES_ANALYSIS.pbix
       ECOMMERCE_SALES_ANALYSIS.pdf
```

---

# 🔄 Analytics Workflow

```
Messy Dataset

      │

      ▼

Data Cleaning (Python)

      │

      ▼

Exploratory Data Analysis

      │

      ▼

Business KPI Analysis (SQL)

      │

      ▼

Interactive Dashboard (Power BI)

      │

      ▼

Business Insights
```

---

# 🧹 Data Cleaning

The raw dataset contained several common real-world data quality issues.

Cleaning steps performed:

- Removed duplicate records after validation
- Standardized inconsistent category names
- Fixed mixed date formats
- Corrected missing values
- Removed corrupted records
- Validated revenue calculations
- Preserved returned orders using an `Is_Return` flag
- Improved overall data consistency

Instead of blindly deleting records, each cleaning decision was made after understanding its business impact.

---

# 📊 Exploratory Data Analysis

The notebook focuses on understanding and improving the quality of the dataset before analysis.

EDA includes:

- Missing Value Analysis
- Duplicate Detection
- Data Validation
- Revenue Verification
- Category Standardization
- Return Order Analysis
- Feature Engineering

---

# 🗄 SQL Business KPIs

A total of **10 business-focused SQL KPIs** were created.

| KPI | Description |
|------|-------------|
| KPI 1 | Overall Business Summary |
| KPI 2 | Revenue by Category |
| KPI 3 | Top Products by Revenue |
| KPI 4 | Monthly Revenue Trend |
| KPI 5 | Month-over-Month Revenue Growth |
| KPI 6 | Customer Spend Analysis |
| KPI 7 | Payment Method Performance |
| KPI 8 | Order Status Analysis |
| KPI 9 | Top Customers |
| KPI 10 | Return Impact Analysis |

SQL concepts used:

- GROUP BY
- Aggregate Functions
- CASE Statements
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions (`LAG()`)

---

# 📈 Power BI Dashboard

The Power BI dashboard provides an interactive overview of business performance.

Dashboard includes:

- KPI Cards
- Total Revenue
- Total Orders
- Average Order Value
- Revenue by Category
- Monthly Revenue Trend
- Top Products
- Payment Method Distribution
- Order Status Breakdown
- Interactive Filters

---

# 📸 Dashboard Preview

## Executive Overview

![Dashboard Overview](POWERBI%20ANALYSIS/Dashboard%20Screenshorts/Dashboard_Overview.png)

---

## Sales Performance Dashboard
![Sales Dashboard](POWERBI%20ANALYSIS/Dashboard%20Screenshorts/Dashboard_Performance.png)

---

# 💡 Key Insights

- Sports category generated the highest revenue.
- A small number of products contributed significantly to total sales.
- Revenue showed monthly fluctuations throughout the year.
- Payment preferences varied across customers.
- Return transactions had a measurable impact on revenue reporting.
- Proper data cleaning significantly improved data reliability.

---

# 🚀 Skills Demonstrated

### Python

- Data Cleaning
- Missing Value Handling
- Duplicate Resolution
- Feature Engineering
- Data Validation

### SQL

- Aggregations
- GROUP BY
- CASE
- Subqueries
- Window Functions
- Business KPI Development

### Power BI

- Dashboard Design
- KPI Cards
- Interactive Filters
- Business Storytelling
- Data Visualization

---

# 📈 Future Improvements

- Customer Segmentation
- RFM Analysis
- Sales Forecasting
- Interactive Drill-through Dashboard
- Advanced Statistical Analysis

---

# 👨‍💻 Author

**Aditya Jha**

Aspiring Data Analyst

### Connect with me

- LinkedIn: www.linkedin.com/in/adityajha49
- GitHub: https://github.com/Code247nexus

---

⭐ If you found this project useful, consider giving it a star!
