# Swiggy Restaurant Orders Data Warehouse & Business Analytics

SQL | PostgreSQL | Data Modeling | Business KPIs

--------------------------------------------------------------------

## 1. Project Overview

This project presents an end-to-end SQL-based business analytics solution built on a PostgreSQL data warehouse, using restaurant order data inspired by a Swiggy-like food delivery platform.

The primary objective is to transform raw transactional data into actionable business insights by applying structured data modeling, KPI-driven SQL analysis, and warehouse design principles commonly used in real-world analytics teams.

Project focus areas:
- Analytical and business-first thinking
- KPI-driven decision support
- Scalable star-schema data modeling
- Clean, optimized PostgreSQL queries

The emphasis is on analytics and insights rather than raw data storage or visualization-heavy dashboards.

--------------------------------------------------------------------

## 2. Business Problem Statement

Food delivery platforms generate large volumes of transactional data. Business stakeholders require structured analytics to answer questions such as:

- Which cities and states generate the highest revenue?
- Which restaurants and food categories drive demand?
- What is the average order value (AOV) and customer rating behavior?
- Which dishes are most frequently ordered?

This project answers these questions using SQL-based analytics on a structured PostgreSQL data warehouse.

--------------------------------------------------------------------

## 3. Tools & Technologies

- PostgreSQL – Core database and analytics engine
- SQL – Joins, aggregations, window functions, KPI calculations
- Data Warehousing Concepts – Fact & dimension tables (star schema)
- Excel (limited use) – Data validation and sanity checks
- Git & GitHub – Version control and project documentation

--------------------------------------------------------------------

## 4. Data Warehouse Design

The database follows a star schema optimized for analytical workloads.
## ERD Diagram: Star Schema

[]https://github.com/umar9643/swiggy_sales_analysis-PostgresSQL-/blob/main/img/Screenshot%202025-12-15%20153510.png


### 4.1 Fact Table

fact_restaurant_orders
- order_id
- restaurant_id
- category_id
- dish_id
- location_id
- date_id
- order_amount_inr
- rating

### 4.2 Dimension Tables

- dim_restaurant
- dim_category
- dim_dish
- dim_location
- dim_date

Benefits of this design:
- Faster aggregations and reporting
- Clear, business-aligned metrics
- Scalable structure for growing data volumes

--------------------------------------------------------------------

## 5. Data Volume

- 197,430+ restaurant orders analyzed
- Multiple cities, states, restaurants, categories, and dishes
- Large enough to simulate real-world production analytics scenarios

--------------------------------------------------------------------

## 6. Key Business KPIs

Calculated directly using PostgreSQL SQL queries.

Total Revenue           : ₹53.01 Million  
Total Orders            : 197,430+  
Average Order Value     : ₹268.51  
Average Customer Rating : 4.34  

--------------------------------------------------------------------

## 7. Core Business Insights

### 7.1 Location-Based Insights

- Bengaluru recorded the highest number of orders (20,077 orders)
- Delhi generated the highest revenue (₹2.83M)
- Gujarat closely followed with ₹2.82M revenue

### 7.2 Restaurant Performance

- McDonald’s ranked #1 by order volume (13,530 orders)
- KFC ranked #2 with 12,961 orders

### 7.3 Category & Dish Analysis

- Recommended category had the highest demand (24,100 orders)
- Choco Lava Cake was the most ordered dish (303 orders)

### 7.4 Customer Behavior Insights

- Majority of orders fall within mid-range pricing buckets, driving higher AOV
- High average ratings indicate strong customer satisfaction across top restaurants

--------------------------------------------------------------------

## 8. SQL Analysis Performed

- Revenue and order aggregations
- Average Order Value (AOV) calculations
- Ranking of top restaurants, categories, and dishes
- City-wise and state-wise performance analysis
- Rating-based performance evaluation
- Time-based trend analysis using date dimensions

All analysis logic is written using PostgreSQL-compatible SQL.

--------------------------------------------------------------------

## 9. Project Structure
<img width="887" height="432" alt="image" src="https://github.com/user-attachments/assets/f7474bf4-02c9-413b-88d5-bfc82e8de8fc" />


--------------------------------------------------------------------

## 10. Data Availability Notice

Raw datasets are intentionally excluded to:
- Maintain data privacy
- Avoid large file uploads
- Follow industry-standard GitHub and analytics best practices

All SQL logic and schema designs are fully reusable with any dataset following the same structure.

--------------------------------------------------------------------

## 11. Key Learnings & Outcomes

- Designed a scalable PostgreSQL data warehouse
- Translated raw transactional data into business-ready KPIs
- Strengthened SQL analytics and problem-solving skills
- Applied real-world data modeling practices used in analytics roles
- Built a recruiter-friendly analytics portfolio project

--------------------------------------------------------------------

## 12. Author

Umar Alam  
B.Sc. Data Analytics  

Skills:
SQL | PostgreSQL | Data Warehousing | Business Analytics | Data Modeling  

[Umar Alam's Profile](https://www.linkedin.com/in/umar-alam-a1b2c3)  
[GitHub](https://github.com/umar9643) 
