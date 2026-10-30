# 🎧 boAt Sales SQL Analysis

## 📌 Project Overview

This project analyzes boAt sales data using **PostgreSQL** to explore sales performance, revenue, profitability, customer behaviour, product performance, sales channels, and delivery operations.

The analysis uses SQL queries to answer practical business questions and demonstrate how relational data can be queried to support business decision-making.

## 📂 Dataset

The project uses the **boAt Sales Analytics** dataset from Kaggle:

- **Source:** [boAt Sales Analytics Dataset – Kaggle](https://www.kaggle.com/datasets/arjunguptadatanalyst/boat-sales-analytics-dataset-arjun-gupta)
- **Database:** PostgreSQL
- **Tables:** `customers`, `sales`, `products`, `sales_channel`, and `delivery_partner`

### 🗃️ Database Tables

| Table | Purpose |
|---|---|
| `customers` | Customer information, including customer ID, signup date, age band, segment, tier, city, state, region, and preferred channel. |
| `sales` | Transaction-level information, including order date, customer and product IDs, quantity, net sales, discounts, profit, payment method, order status, and delivery details. |
| `products` | Product information, including product ID, product name, and product category. |
| `sales_channel` | Sales channel details, including channel ID and channel name/type. |
| `delivery_partner` | Delivery partner information, identified by delivery partner ID. |

The `sales` table is the central transaction table and connects to the other tables through their corresponding IDs.

## 🎯 Project Objectives

- Examine the structure and quality of the dataset.
- Calculate key sales and business metrics.
- Identify high-revenue customers and profitable products.
- Compare sales performance across product categories and sales channels.
- Explore customer segments, tiers, and purchasing behaviour.
- Analyze discounts, payment methods, cancellations, and returns.
- Evaluate delivery performance and shipping costs.
- Practice SQL techniques used in real-world data analysis.

## 📊 Analysis Performed

### 🔍 1. Exploratory Data Analysis (EDA)
- Count records across the five tables.
- Check for duplicate customer IDs and sales IDs.
- Check sales records for unmatched customer IDs.
- Review the structure and contents of the dataset.

### 💰 2. Sales and Revenue Analysis
- Total sales records, net sales revenue, and profit.
- Monthly and yearly revenue trends.
- City-wise and product-category-wise sales.
- Top customers by total revenue.
- Revenue contribution by product category.
- Weekend versus weekday and festival versus non-festival sales.

### 👥 3. Customer Analysis
- Unique customers who placed orders.
- Customer distribution by segment and tier.
- Frequent and high-value customers.
- Customers who purchased from multiple product categories.
- Customers who have never placed an order.
- Customer-level revenue and profit analysis.

### 📦 4. Product and Discount Analysis
- Product-category sales and quantity sold.
- Product profitability.
- Loss-making products.
- Average discount by product or category.
- Product-category revenue contribution.

### 🛒 5. Channel and Payment Analysis
- Revenue and profit by sales channel.
- Revenue by payment method.
- Sales records by payment method.
- Ranking payment methods by revenue.

### 🚚 6. Order and Delivery Analysis
- Order-status distribution and delivered-order percentage.
- Cancellation analysis by city.
- Average delivery time by delivery partner.
- Shipping cost and shipping cost as a percentage of net sales.

## 🧠 SQL Concepts Used

- `SELECT`, `WHERE`, `DISTINCT`, `ORDER BY`, and `LIMIT`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
- `GROUP BY` and `HAVING`
- `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN`
- Self joins
- Subqueries and correlated subqueries
- Common Table Expressions (CTEs)
- `CASE WHEN`
- Window functions such as `RANK()`
- Date and time functions such as `EXTRACT()`
- Data-quality checks using joins and aggregation

## 🗂️ Repository Contents

```text
boAt-Sales-SQL-Analysis/
│
├── README.md
└── boat_sales_analysis.sql
```

The SQL file contains the exploratory queries and business-question solutions used in this project.

## ⚙️ How to Run

1. Download the dataset from the Kaggle source listed above.
2. Create a PostgreSQL database.
3. Import the five dataset tables:
   - `customers`
   - `sales`
   - `products`
   - `sales_channel`
   - `delivery_partner`
4. Open `boat_sales_analysis.sql` in pgAdmin or another PostgreSQL SQL editor.
5. Execute the queries against the imported database.

> **Note:** The SQL queries assume that the dataset tables and columns have been imported using the names referenced in the SQL file. If your table or column names differ, update the queries accordingly.

## 📈 Key Learning Outcomes

Through this project, I practiced using SQL to:

- Work with multiple related tables.
- Validate data using duplicate and unmatched-record checks.
- Aggregate transaction data into business metrics.
- Analyze customer, product, channel, and delivery performance.
- Solve business questions using joins, subqueries, CTEs, and window functions.

---

## 🛠️ Tools & Technologies

**PostgreSQL** | **SQL** | **pgAdmin**

**Project Type:** Data Analytics / SQL
