Swiggy Restaurant Orders Data Warehouse & Business Analytics

SQL | PostgreSQL | Data Modeling | Business KPIs

Project Overview

This project presents an end-to-end SQL-based business analytics solution built on a PostgreSQL data warehouse using restaurant order data inspired by a Swiggy-like food delivery platform.

The primary goal is to transform raw transactional data into actionable business insights by applying proper data modeling, KPI-driven SQL analysis, and warehouse design principles commonly used in real-world analytics teams.

The project emphasizes:

Analytical thinking

Business-focused KPIs

Scalable data modeling

Clean, optimized SQL queries

rather than raw data storage or visualization-heavy outputs.

Business Problem Statement

Food delivery platforms generate large volumes of transactional data. Business teams need structured insights to answer questions such as:

Which cities and states generate the most revenue?

Which restaurants and food categories drive demand?

What is the average order value and customer rating behavior?

Which dishes are most frequently ordered?

This project addresses these questions using PostgreSQL analytics on a structured data warehouse.

Tools & Technologies Used

PostgreSQL – core analytics and querying

SQL – joins, aggregations, window functions, KPI calculations

Data Warehousing Concepts – fact & dimension tables (star schema)

Excel (limited use) – data validation and sanity checks

Git & GitHub – version control and documentation

Data Warehouse Design

The database is designed using a star schema to support efficient analytical queries.

Fact Table

fact_restaurant_orders

order_id

restaurant_id

category_id

dish_id

location_id

date_id

order_amount_inr

rating

Dimension Tables

dim_restaurant

dim_category

dim_dish

dim_location

dim_date

This structure enables:

Fast aggregations

Clear business metrics

Scalable reporting as data volume grows

Data Volume

197,430+ restaurant orders analyzed

Multiple cities, states, restaurants, categories, and dishes

Large enough to simulate real-world production analytics

Key Business KPIs Derived

Total Revenue: ₹53.01 Million

Total Orders: 197,430+

Average Order Value (AOV): ₹268.51

Average Customer Rating: 4.34

These KPIs were calculated directly using SQL aggregation and analytical queries in PostgreSQL.

Core Business Insights
Location-Based Insights

Bengaluru recorded the highest number of orders (20,077 orders)

Delhi generated the highest revenue (₹2.83M)

Gujarat closely followed with ₹2.82M revenue

Restaurant Performance

McDonald’s emerged as the top restaurant by order volume (13,530 orders)

KFC ranked second with 12,961 orders

Category & Dish Analysis

The Recommended category had the highest demand (24,100 orders)

Choco Lava Cake was the most ordered dish (303 orders)

Customer Behavior

Majority of orders fall within mid-range pricing buckets, driving higher AOV

High average ratings indicate strong customer satisfaction across top-performing restaurants

SQL Analysis Performed

Revenue and order aggregation

Average order value calculations

Ranking top restaurants, categories, and dishes

City and state-wise performance analysis

Rating-based performance evaluation

Time-based trend analysis using date dimensions

All analysis logic is written using PostgreSQL-compatible SQL.

Project Structure
Swiggy_Sales_Analysis/
│
├── README.md
├── sql/
│   ├── schema.sql
│   ├── kpi_queries.sql
│   └── analysis_queries.sql
├── scripts/
│   └── data_validation.sql
└── .gitignore

Data Availability Notice

Raw datasets are intentionally excluded from this repository to:

Maintain data privacy

Avoid large file uploads

Follow best GitHub and analytics practices

All SQL logic and schema design are fully reusable with any dataset following the same structure.

Key Learnings & Outcomes

Designed a scalable PostgreSQL data warehouse

Translated raw order data into business-ready KPIs

Strengthened SQL skills for analytical problem-solving

Applied real-world data modeling concepts used in analytics roles

Built a recruiter-friendly analytics portfolio project

Author

Umar Alam
B.Sc. Data Analytics

Skills:
SQL | PostgreSQL | Data Warehousing | Business Analytics | Data Modeling

GitHub: (add your repo link here)
