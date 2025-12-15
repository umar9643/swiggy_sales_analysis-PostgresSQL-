# 🍽️ **Swiggy Restaurant Sales Analysis**

## 📌 Project Overview

This project focuses on analyzing restaurant order and sales data inspired by a food delivery platform (Swiggy-like dataset). The objective is to extract **business-driven insights** around sales performance, customer behavior, pricing trends, and restaurant demand using **SQL-based analytics**.

The analysis is designed to mirror **real-world analytics workflows**, emphasizing clean data modeling, KPI-driven queries, and insight generation rather than raw data dumping.

---

## 🎯 Business Objectives

* Analyze overall sales and order performance
* Identify top-performing restaurants and food categories
* Understand pricing distribution and demand patterns
* Track time-based trends (daily, weekly, monthly)
* Generate KPIs useful for business and operational decision-making

---

## 🛠️ Tools & Technologies

* **SQL** (PostgreSQL / MySQL compatible queries)
* **Database Design** (Fact & Dimension tables)
* **Excel / Power BI** (for dashboarding & validation)
* **Git & GitHub** (version control & project documentation)

---

## 🗂️ Data Model

The project follows a **star schema** approach:

### Fact Table

* `fact_restaurant_orders`

  * order_id
  * restaurant_id
  * category_id
  * dish_id
  * location_id
  * date_id
  * price_inr
  * ratings

### Dimension Tables

* `dim_restaurant`
* `dim_category`
* `dim_dish`
* `dim_location`
* `dim_date`

This structure enables efficient analytical queries and scalable reporting.

---

## 📊 Key KPIs & Analysis

* Total Orders & Total Revenue
* Average Order Value (AOV)
* Average Dish Price
* Orders by Restaurant, Category & Location
* Rating-based Performance Analysis
* Price Range Bucketing (₹100–₹200, ₹200–₹300, etc.)
* Time-based Trends (Day, Week, Month, Quarter)

All KPIs are derived using optimized SQL queries.

---

## 🔍 Sample Insights

* Identified high-revenue restaurants contributing the majority of sales
* Discovered price ranges with maximum order volume
* Analyzed category-wise demand and customer preferences
* Observed time-based order spikes during specific periods

> These insights can help improve pricing strategies, restaurant onboarding decisions, and promotional planning.

---

## 📁 Project Structure

```
Swiggy_Sales_Analysis/
│
├── README.md
├── sql/
│   ├── schema.sql
│   ├── kpi_queries.sql
│   └── analysis_queries.sql
├── dashboards/
│   └── powerbi_dashboard.pbix
├── scripts/
│   └── data_validation.sql
└── .gitignore
```

---

## 🚫 Data Availability Notice

> Raw datasets are intentionally **excluded** from this repository to maintain data privacy and file size limits.

All analysis logic, SQL queries, and KPIs are fully documented and reproducible with any compatible dataset following the same schema.

---

## ✅ Key Takeaways

* Demonstrates strong SQL querying and data modeling skills
* Focuses on business-relevant KPIs rather than raw outputs
* Structured like a real-world analytics project
* Designed for recruiter review and portfolio presentation

---

## 👤 Author

**Umar Alam**
B.Sc. Data Analytics
Skills: SQL | PostgreSQL | Data Modeling | Power BI | Business Analytics

---

⭐ If you find this project insightful, feel free to explore the queries and analysis logic inside the repository.
