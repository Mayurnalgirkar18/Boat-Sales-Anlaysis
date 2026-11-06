# 🎧 boAt Sales Analytics | SQL & Power BI

An end-to-end data analytics project using **PostgreSQL and Power BI** to analyze sales performance, customer behaviour, product performance, profitability, sales channels, and delivery operations.

The project involves exploring a retail sales dataset, solving business-related questions using SQL, and building an interactive Power BI dashboard to transform raw data into meaningful business insights.

---

## 📌 Project Overview

The objective of this project is to analyze boAt sales data and understand different aspects of business performance.

Using PostgreSQL, I performed exploratory data analysis, data-quality checks, and answered 50+ business-related questions using SQL.

I also developed an interactive Power BI dashboard to visualize important business metrics and analyze sales performance across different dimensions.

### Project Highlights

- Analyzed a retail sales dataset containing approximately 975K sales records.
- Worked with 5 interconnected relational tables.
- Wrote 50+ SQL queries to solve business problems.
- Performed data exploration and data-quality checks.
- Analyzed revenue, profitability, customers, products, and sales channels.
- Developed an interactive Power BI dashboard with KPIs, charts, maps, and slicers.

---

## 🗂️ Dataset Information

**Dataset:** boAt Sales Analytics Dataset

**Source:** Kaggle – Arjun Gupta

**Database:** PostgreSQL

**Tables:** 5 relational tables

| Table Name | Description |
|---|---|
| customers | Customer information, demographics, segments, tiers, city, state, and region. |
| sales | Transaction details, order dates, quantity, net sales, discounts, profit, payment methods, and order status. |
| products | Product information, product names, and categories. |
| sales_channel | Sales channel information and channel details. |
| delivery_partner | Delivery partner information. |

The `sales` table acts as the central transaction table and connects to the other tables using their respective IDs.

### Dataset Size Limitation

The original dataset contains approximately 975K sales records. Due to GitHub's file-size limitations, the complete dataset is not included in this repository.

The complete dataset was used locally for SQL analysis and Power BI dashboard development.

Dashboard screenshots are included in this repository to demonstrate the final visualizations.

---

## 🎯 Project Objectives

- Analyze overall sales and business performance.
- Identify top-performing products and product categories.
- Understand customer purchasing behaviour.
- Identify high-value customers and customer segments.
- Evaluate revenue and profitability across sales channels.
- Analyze discount patterns and payment methods.
- Examine delivered, returned, and cancelled orders.
- Evaluate delivery performance and shipping costs.
- Build an interactive dashboard for business performance monitoring.

---

## 🧠 SQL Analysis | PostgreSQL

I used PostgreSQL to explore the dataset and solve 50+ SQL questions covering different SQL concepts and business scenarios.

### SQL Concepts Used

| SQL Concepts | Application |
|---|---|
| SELECT, WHERE | Data filtering and retrieval |
| DISTINCT, ORDER BY, LIMIT | Unique values and sorting results |
| Aggregate Functions | Calculating sales, profit, averages, and counts |
| GROUP BY, HAVING | Grouping and filtering aggregated results |
| JOINS | Combining information from multiple tables |
| CASE Statements | Conditional analysis and categorization |
| Subqueries | Solving nested business questions |
| Correlated Subqueries | Comparing records with related groups |
| CTEs | Breaking complex queries into manageable steps |
| Window Functions | Ranking, running totals, and comparisons |
| Date Functions | Monthly and yearly sales analysis |

### Business Analysis Performed

**1. Exploratory Data Analysis (EDA)**
- Examined table structures and record counts.
- Checked duplicate customer and sales IDs.
- Identified unmatched customer records.
- Explored distinct values and important columns.

**2. Sales & Revenue Analysis**
- Calculated total sales and revenue.
- Analyzed monthly and yearly sales trends.
- Identified high-revenue cities.
- Analyzed weekend and festival sales.
- Calculated product-category revenue contribution.

**3. Customer Analysis**
- Identified frequent and high-value customers.
- Analyzed customer segments and tiers.
- Found inactive customers.
- Analyzed customer purchasing patterns.
- Calculated customer-level revenue and profit.

**4. Product & Profitability Analysis**
- Identified top-selling product categories.
- Analyzed product profitability.
- Identified loss-making products.
- Examined discount patterns.
- Compared product quantity sold and revenue.

**5. Sales Channel & Payment Analysis**
- Compared revenue across sales channels.
- Analyzed profit by sales channel.
- Examined payment method performance.
- Ranked payment methods based on revenue.

**6. Order & Delivery Analysis**
- Analyzed delivered, returned, and cancelled orders.
- Calculated delivery performance.
- Examined cancellation patterns across cities.
- Compared delivery partners.
- Analyzed shipping costs.

---

## 📊 Power BI Dashboard

Developed an interactive Power BI dashboard to monitor and analyze overall sales performance.

### Dashboard Features

**Key Performance Indicators (KPIs)**
- Total Orders
- Total Sales
- Total Profit
- Profit Margin

**Visualizations**
- Monthly Sales Analysis
- City-wise Sales Performance using Map
- Sales Channel Performance
- Top 5 Product Categories by Sales
- Order Status Distribution

**Interactive Filters**
- Year
- Month
- Region
- Channel Type

**Interactive Map Tooltip**

Created a custom tooltip for the map containing:
- City Name
- Total Sales
- Total Orders
- Total Profit

Users can hover over individual cities to view their sales performance through KPI cards without navigating away from the main dashboard.

### Dashboard Preview

![boAt Sales Analytics Dashboard](Dashboard/boat_sales_dashboard.png)

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Database management and SQL analysis |
| SQL | Data exploration and business analysis |
| Power BI | Interactive dashboard development |
| DAX | Creating measures and KPIs |
| Power Query | Data transformation and preparation |
| GitHub | Project documentation and version control |

---

## 📁 Project Structure

```text
boAt-Sales-Analytics/
│
├── SQL/
│   ├── EDA.sql
│   ├── Basic_SQL.sql
│   ├── Group_By_Having.sql
│   ├── Joins.sql
│   ├── Case_Statements.sql
│   ├── Subqueries.sql
│   ├── CTEs.sql
│   └── Window_Functions.sql
│
├── Dashboard/
│   └── boat_sales_dashboard.png
│
└── README.md
```

*Note: The filenames above illustrate the organization of the SQL topics. Adjust them to match the actual files in the repository.*

---

## ⚙️ How to Run This Project

1. Download the original dataset from Kaggle.
2. Install PostgreSQL.
3. Create a new database.
4. Import the five CSV tables into PostgreSQL:
   - customers
   - sales
   - products
   - sales_channel
   - delivery_partner
5. Open the SQL files using your PostgreSQL query editor.
6. Execute the queries to explore the data and reproduce the analysis.
7. Open the Power BI dashboard file in Power BI Desktop and connect it to the imported dataset.

**Note:** The original dataset is not included in this GitHub repository because of its file size. Download the dataset separately to reproduce the complete analysis.

---

## 📚 Key Learnings

Through this project, I gained practical experience in:

- Working with relational databases and multiple interconnected tables.
- Performing exploratory data analysis using SQL.
- Identifying data-quality issues.
- Writing complex SQL queries to solve business problems.
- Applying joins, subqueries, CTEs, and window functions.
- Understanding sales, customer, and product performance.
- Creating interactive dashboards using Power BI.
- Building KPIs and using DAX measures for business analysis.

---

## 👨‍💻 Author

**Mayur Nalgirkar**

## 🛠️ Tools & Technologies

SQL | PostgreSQL | Power BI |

**Project Type:** Data Analytics / SQL

---

⭐ If you find this project interesting, feel free to explore the SQL analysis and dashboard screenshots.

