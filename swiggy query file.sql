--Creating a table called restaurant_orders
CREATE TABLE restaurant_orders (
   
    state VARCHAR(100),
    city VARCHAR(100),
    order_date DATE,
    restaurant_name VARCHAR(255),
    location VARCHAR(255),
    category VARCHAR(100),
    dish_name VARCHAR(255),
    price_inr NUMERIC(10,2),
    rating NUMERIC(3,2),
    rating_count INT
);


-- Too seee the table
select * from  restaurant_orders

-- now inserting/importing data into that table 
--we can use code  but  we have used the ui fn
copy restaurant_orders(
    state,
    city,
    order_date,
    restaurant_name,
    location,
    category,
    dish_name,
    price_inr,
    rating,
    rating_count
)
FROM 'C:\Users\umar\anaconda files\PROJECTS\SQL PROJECTS\hjvjh\Swiggy_Data.csv'
DELIMITER ','
CSV HEADER;

--Data Validation & Cleaning
--1.null checks
select
	sum(case when state is null then 1 else 0 end) as null_state,
	sum(case when city is null then 1 else 0 end) as null_city,
	sum(case when order_date is null then 1 else 0 end) as null_order_date,
	sum(case when restaurant_name is null then 1 else 0 end) as null_restaurant_name,
	sum(case when category is null then 1 else 0 end) as null_category,
	sum(case when dish_name is null then 1 else 0 end) as null_dish_name,
	sum(case when price_inr is null then 1 else 0 end) as null_price_inr,
	sum(case when rating is null then 1 else 0 end) as null_rating,
	sum(case when rating_count is null then 1 else 0 end) as null_rating_count
from restaurant_orders;

--2.Blank  or Empty  string(used for dimentions)
select * 
from restaurant_orders
where
state='' or city='' or Restaurant_name='' or Location='' or dish_name='' 


--3.Duplicate check
select 
state,city,order_date,restaurant_name,Location,category,dish_name,price_inr,rating,rating_count,count(*)
as CNT
from restaurant_orders
group by 
state,city,order_date,restaurant_name,Location,category,dish_name,price_inr,rating,rating_count
having
count(*)>1

-- deleting the duplicate that we foundd



---Creating Schema(dimention table)
--1.Date Table
CREATE TABLE dim_date (
    date_id SERIAL PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    day INT,
    week INT
);

select * from dim_date


--2. Loc Table
create table dim_location(
	location_id  serial primary key,
	state varchar(100),
	city varchar(100),
	location varchar(200)
)


select * from dim_location

--3. Restaurant Table
create table dim_Restaurant(
Restaurant_id serial primary key,
Restaurant_name varchar(200)
)

select * from dim_Restaurant

--4. Category Table
create table dim_category(
category_id serial primary key,
category varchar(200)
)

select * from dim_Category

--5. Dish Table
create table dim_dish(
dish_id serial primary key,
dish_name varchar(200)
)

select *  from dim_dish

---Creating Schema(Fact table)
CREATE TABLE fact_restaurant_orders (
    order_id SERIAL PRIMARY KEY,

    location_id INT,
    restaurant_id INT,
    category_id INT,
    dish_id INT,
    date_id INT,

    price_inr DECIMAL(11,2),
    ratings DECIMAL(4,2),
    rating_count INT,

    CONSTRAINT fk_location
        FOREIGN KEY (location_id)
        REFERENCES dim_location(location_id),

    CONSTRAINT fk_restaurant
        FOREIGN KEY (restaurant_id)
        REFERENCES dim_restaurant(restaurant_id),

    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES dim_category(category_id),

    CONSTRAINT fk_dish
        FOREIGN KEY (dish_id)
        REFERENCES dim_dish(dish_id),

    CONSTRAINT fk_date
        FOREIGN KEY (date_id)
        REFERENCES dim_date(date_id)
);

select * from fact_restaurant_orders

--- inserting data into tables that we made
--dim_date

INSERT INTO dim_date
(full_date, year, month, month_name, quarter, day, week)
SELECT DISTINCT
    order_date AS full_date,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    TO_CHAR(order_date, 'Month') AS month_name,
    EXTRACT(QUARTER FROM order_date) AS quarter,
    EXTRACT(DAY FROM order_date) AS day,
    EXTRACT(WEEK FROM order_date) AS week
FROM restaurant_orders
WHERE order_date IS NOT NULL;

select * from dim_date


--dim_location
insert into dim_location
	(state,city,location)
select distinct
	State,City,Location
from
	restaurant_orders

select * from dim_location

--dim_restaurant
insert into dim_restaurant
	(restaurant_name)
select distinct
	restaurant_name
from
	restaurant_orders

select * from dim_restaurant

--dim category
insert into dim_category
	(category)
select distinct
	category
from
	restaurant_orders

select * from dim_category

--dim_dish
insert into dim_dish
	(dish_name)
select distinct
	dish_name
from
	restaurant_orders

select * from dim_dish

--fact_restaurant_orders
insert into fact_restaurant_orders
(location_id,restaurant_id,category_id,dish_id,date_id,price_inr,ratings,rating_count)
select
	dl.location_id,dr.restaurant_id,dc.category_id,dsc.dish_id,dd.date_id,s.price_inr,s.ratings,s.rating_count
from
	restaurant_orders as s

join dim_date as dd
	on dd.full_date=s.order_date

join dim_location as dl
	on dl.state=s.state
	and dl.city=s.city
	and dl.location=s.loaction

join dim restaurant as dr
	on dr.restaurant_name=s.restaurant_name

join dim_category as dc
	on dc.category=s.category

join dim_dish as dsc
	on dsc.dish_name=s.dish_name
	

-- Insert data into fact_restaurant_orders (PostgreSQL)

INSERT INTO fact_restaurant_orders
(location_id, restaurant_id, category_id, dish_id, date_id, price_inr, ratings, rating_count)
SELECT
    dl.location_id,
    dr.restaurant_id,
    dc.category_id,
    dsc.dish_id,
    dd.date_id,
    s.price_inr,
    s.rating,
    s.rating_count
FROM restaurant_orders AS s

-- Join date dimension
JOIN dim_date AS dd
    ON dd.full_date = s.order_date

-- Join location dimension
JOIN dim_location AS dl
    ON dl.state = s.state
    AND dl.city = s.city
    AND dl.location = s.location     -- FIXED: s.loaction → s.location

-- Join restaurant dimension
JOIN dim_restaurant AS dr           -- FIXED: dim restaurant → dim_restaurant
    ON dr.restaurant_name = s.restaurant_name

-- Join category dimension
JOIN dim_category AS dc
    ON dc.category = s.category    -- FIXED: dc.category → dc.category_name

-- Join dish dimension
JOIN dim_dish AS dsc
    ON dsc.dish_name = s.dish_name;

select * from fact_restaurant_orders

--- seeing the entire table in one go
select * from fact_restaurant_orders as ro
join dim_date as dd on ro.date_id=dd.date_id
join dim_location as dl on ro.location_id=dl.location_id
join dim_restaurant as dr on ro.restaurant_id=dr.restaurant_id
join dim_category as dc on ro.category_id=dc.category_id
join dim_dish as dds on ro.dish_id=dds.dish_id

----Till here we are done with our priprocessing stage now we will state our analysis based on the requirements docs----

---KPIs
--Total Orders
select count(order_id) as total_order_count
from fact_restaurant_orders

--Total Revenue
SELECT 
    CONCAT(ROUND(SUM(price_inr) / 1000000.0, 2), ' Million') AS total_rev
FROM fact_restaurant_orders;

--Avg Price
select 
	round(avg(price_inr),2)|| 'Rupee' as avg_dish_price
from 
	fact_restaurant_orders

--Avg Ratings
select 
	round(avg(ratings),2)|| 'star' as avg_ratings
from 
	c


---Deep Dive Bussiness Analysis
--Date  Based Analysis

-- Monthly orders Trends
select 
	d.month,
	d.month_name,
	count(*) as total_orders
from
	fact_restaurant_orders as o
join
	dim_date as d
on o.date_id=d.date_id
group by
	d.month,
	d.month_name
order by
	count(*) asc

-- Monthly Rev Trends
select 
	month,
	month_name,
	sum(price_inr) as price_inr
from
	fact_restaurant_orders as o
join
	dim_date as d
on 
	o.date_id=d.date_id
group by
	month,
	month_name
order by
	count(*) asc

--Quarterly Trend
select
	d.year,
	d.quarter,
	count(*)
from 
	fact_restaurant_orders as o
join
	dim_date as d
on
	o.date_id=d.date_id
group by
	d.quarter,
	d.year
order by
	count(*) asc

--Yearly Trend
select
	d.year,
	
	count(*)
from 
	fact_restaurant_orders as o
join
	dim_date as d
on
	o.date_id=d.date_id
group by
	d.year
order by
	count(*) asc

-- Order BY day of week
SELECT 
    TO_CHAR(d.full_date, 'Day') AS week_name,
    COUNT(*) AS total_orders
FROM 
    fact_restaurant_orders AS o
JOIN 
    dim_date AS d
ON 
    o.date_id = d.date_id
GROUP BY 
    TO_CHAR(d.full_date, 'Day')
order by
	TO_CHAR(d.full_date, 'Day') 



---Location Based Analysis
--Top 10 cities by order volume
select  
	city,
	count(*)
from
	dim_location as dl
join 
	fact_restaurant_orders as o
on 
	dl.location_id=o.location_id
group by
	city
order by 
	count(*) desc
limit
	10
	

--Rev contribution by state
select  
	state,
	sum(price_inr) as revenue
from
	dim_location  as dl
join
	fact_restaurant_orders as o
on
	dl.location_id=o.location_id
group by
	state

---Food Performance
--Top 10 restaurant by orders
select
	restaurant_name,
	count(*) as order_count
from
	dim_restaurant as dr
join
	fact_restaurant_orders as o
on
	dr.restaurant_id=o.restaurant_id
group by
	restaurant_name
order by
	count(*) desc
limit 10
	

--Top categories
select
	category,
	count(*)
from
	dim_category as dr
join
	fact_restaurant_orders as o
on
	dr.category_id=o.category_id
group by
	category
order by
	count(*) desc
limit 10



--Most ordered dishes
select 
	dd.dish_name,
	count(*)
from
	dim_dish as dd
join
	fact_restaurant_orders as o
on 
	dd.dish_id=o.dish_id
group by
	dish_name
order by
	 count(*) desc
limit 10
	

--Cuisine performace (orders + avg ratings)
select
    dc.category,
    count(*) as total_order,
    round(avg(o.ratings),2) as avg_ratings
from
    dim_category as dc
join
    fact_restaurant_orders as o
    on dc.category_id = o.category_id
group by
    dc.category
order by
    avg_ratings desc
limit 10;

--Total orders by  price range
select
    case
        when price_inr < 100 then 'Under 100'
        when price_inr >= 100 and price_inr < 200 then '100 - 200'
        when price_inr >= 200 and price_inr < 300 then '200 - 300'
        when price_inr >= 300 and price_inr < 500 then '300 - 500'
        else '500+'
    end as price_range,
    count(*) as total_orders
from
    fact_restaurant_orders
group by
    price_range
order by
    total_orders desc;

--Ratings count distribution
select
	ratings,
	count(*)
from 
	fact_restaurant_orders
group by
	ratings
order by
	  count(*) desc


	



	



	



