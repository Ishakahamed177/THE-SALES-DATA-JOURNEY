# 📊 The Sales Data Journey: End-to-End Retail Analytics

**Author:** Ishak Ahamed N  
**Organization:** Vinsup Skill Academy  
**Domain:** Retail Sales, Customer Insights, Inventory & Staff Analytics  
**Technologies:** Microsoft Excel, MySQL, Python, Pandas, Scikit-Learn, Power BI

---

## 📌 Project Overview

  Retail businesses generate large amounts of transactional data, but scattered files and unstructured records make it difficult to understand sales performance and customer behavior.

  **The Sales Data Journey** is an end-to-end retail analytics project that transforms raw retail data into meaningful business insights using Microsoft Excel, MySQL, Python, and Power BI.

  The project covers data cleaning, relational database management, exploratory data analysis (EDA), customer segmentation using machine learning, and interactive business intelligence dashboards.

### 🎯 Project Objectives

- Clean and standardize retail data to improve data quality.
- Build a relational MySQL database with primary and foreign key constraints.
- Analyze sales trends, customer purchasing patterns, and product performance.
- Segment customers using RFM analysis and K-Means clustering.
- Develop interactive Power BI dashboards to support data-driven business decisions.

---

## 🏗️ Project Workflow

### Phase 1: Data Cleaning and Preprocessing — Microsoft Excel

- Imported and cleaned nine retail datasets.
- Removed duplicate records and standardized column names.
- Handled missing values in phone numbers and ZIP codes.
- Standardized date formats and data types.
- Created the `total_price` column using the formula:

  `total_price = (list_price × quantity) − discount`

### Phase 2: Relational Database Management — MySQL

- Designed a relational database containing nine tables.
- Established primary keys and foreign keys to maintain data integrity.
- Resolved data type mismatches and orphaned records.
- Validated relationships between customers, orders, products, stores, and staff.
- Prepared structured data for analysis and reporting.

**Database tables:**

`customers`, `staffs`, `stores`, `orders`, `order_items`, `stocks`, `products`, `categories`, and `brands`.

### Phase 3: Exploratory Data Analysis and Machine Learning — Python

- Connected MySQL with Python using Pandas and SQLAlchemy.
- Performed exploratory data analysis to identify trends and patterns.
- Used Matplotlib to visualize sales and customer data.
- Calculated RFM metrics: Recency, Frequency, and Monetary Value.
- Applied StandardScaler and K-Means clustering for customer segmentation.
- Analyzed cluster characteristics to identify Loyal, New, and At-Risk customer groups.
- Stored customer segmentation results in MySQL for further reporting.

### Phase 4: Business Intelligence — Power BI

- Developed interactive dashboards for retail sales performance.
- Created DAX measures to calculate key performance indicators (KPIs).
- Added dynamic slicers for year, product category, and brand.
- Analyzed sales trends, geographical performance, and customer spending.
- Presented executive-level insights to support business decisions.

---

## 🧩 System Architecture

```text
         PHASE 1: DATA PREPROCESSING
         ┌──────────────────────────┐
         │       Raw CSV Files      │
         └────────────┬─────────────┘
                      ▼
         ┌──────────────────────────┐
         │     Microsoft Excel      │
         │ Cleaning and Feature     │
         │ Engineering               │
         └────────────┬─────────────┘
                      ▼
         PHASE 2: DATABASE MANAGEMENT
         ┌──────────────────────────┐
         │          MySQL           │
         │   Nine Relational Tables │
         │   Primary and Foreign    │
         │   Key Constraints        │
         └────────────┬─────────────┘
                      ▼
         PHASE 3: DATA ANALYSIS & ML
         ┌──────────────────────────┐
         │ Python, Pandas,           │
         │ SQLAlchemy, Matplotlib    │
         └────────────┬─────────────┘
                      ▼
         ┌──────────────────────────┐
         │ RFM Analysis and          │
         │ K-Means Clustering        │
         └────────────┬─────────────┘
                      ▼
         PHASE 4: BUSINESS INTELLIGENCE
         ┌──────────────────────────┐
         │        Power BI          │
         │ DAX Measures and Slicers │
         └────────────┬─────────────┘
                      ▼
         ┌──────────────────────────┐
         │ Interactive Dashboards   │
         │ Business Insights        │
         └──────────────────────────┘
```

---

## 📈 Business Intelligence Dashboard — Power BI

An interactive Power BI dashboard was developed using a high-contrast dark purple and pink theme to present retail sales performance and business insights.

### 🔗 Live Interactive Dashboard

**[View the Power BI Dashboard](https://app.powerbi.com/view?r=eyJrIjoiODFiZTEzZDUtODllOS00YmY3LWFiMjItN2I3MDdlNTczOWQ3IiwidCI6ImEzNWJjY2IxLTc4M2UtNDg3Mi1hOGMyLTM5YmJiYmY1ZGNmNiJ9)**

### Core DAX Measures

**1. Total Sales**

```dax
Total Sales = SUM(order_items[total_price])
```

Calculates total sales from the order item records.

**2. Total Orders**

```dax
Total Orders = DISTINCTCOUNT(orders[order_id])
```

Calculates the number of unique orders.

**3. Average Sales**

```dax
Average Sales = AVERAGE(order_items[total_price])
```

Calculates the average `total_price` across order item records. This is an average order-item value, not the average value of an entire customer order.

### Dashboard Previews

#### 1. Sales Analysis — Overview and Seasonal Trends

![Sales Analysis Overview](image_a2ee3e.png)

Analyzes sales performance over time and highlights seasonal trends and periods of stronger sales.

#### 2. Location Analysis — State and City Performance

![Location Analysis](image_a2ee76.png)

Compares geographical sales performance to identify stronger-performing locations.

#### 3. Customer Insights — Categories, Brands and Top Spenders

![Customer Insights](image_a2ede1.png)

Highlights product category and brand performance, along with high-spending customers.

#### 4. Executive Summary

![Executive Summary](image_a2ee18.jpg)

Provides a consolidated overview of key sales KPIs and business performance indicators.

---

## 🔍 Key Business Insights

The analysis identified several patterns that can help guide retail business decisions:

- **Geographical Performance:** New York stores recorded strong sales performance.
- **Product Performance:** Mountain Bikes and Trek products were important contributors to sales.
- **Seasonal Trends:** April to June showed stronger sales activity.
- **Customer Insights:** Pamelia and Lyndsey were identified among the high-spending customers.
- **Customer Segmentation:** RFM analysis and K-Means clustering supported the identification of Loyal, New, and At-Risk customer groups.

These findings can support targeted marketing, customer retention, inventory planning, and location-specific sales strategies.

---

## 🛠️ Tools and Technologies

| Technology | Purpose |
|---|---|
| Microsoft Excel | Data cleaning, standardization, and feature engineering |
| MySQL | Relational database design, data integrity, and data storage |
| Python | Data processing and analysis |
| Pandas | Data manipulation and cleaning |
| SQLAlchemy | Python–MySQL connectivity |
| Matplotlib | Exploratory data visualizations |
| Scikit-Learn | Feature scaling and K-Means clustering |
| Power BI | Interactive dashboards and business intelligence |
| DAX | KPI calculations and analytical measures |

---

## 💡 Project Outcomes

- Built an end-to-end analytics workflow from raw retail files to interactive dashboards.
- Organized nine related datasets into a structured relational database.
- Identified sales trends, product performance, geographical patterns, and customer spending behavior.
- Applied RFM analysis and K-Means clustering for customer segmentation.
- Developed Power BI reports to make retail performance easier to monitor and interpret.

---

## 🚀 Conclusion

**The Sales Data Journey** demonstrates how Excel, MySQL, Python, machine learning, and Power BI can work together to convert raw retail data into actionable business intelligence.

By combining data preparation, database management, customer analytics, and interactive reporting, this project provides a structured approach to understanding retail sales performance and customer behavior.

---

## 👨‍💻 Author

**Ishak Ahamed N**

Retail Analytics | Data Analysis | Business Intelligence

- **GitHub:** [Ishakahamed177](https://github.com/Ishakahamed177)
- **LinkedIn:** [Ishak Ahamed N](https://linkedin.com/in/IshakAhamed-N)

