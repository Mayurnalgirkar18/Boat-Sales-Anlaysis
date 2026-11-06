 -- q1. using a cte, calculate each customer's total net sales

with customer_sales as (
    select
        customerid,
        sum(netsales) as total_sales
    from sales
    group by customerid
)
select *
from customer_sales;


-- q2. find customers whose total profit exceeds 10,000

with customer_profit as (
    select
        customerid,
        sum(profit) as total_profit
    from sales
    group by customerid
)
select *
from customer_profit
where total_profit > 10000;


-- q3. calculate yearly sales

with yearly_sales as (
    select
        extract(year from orderdate) as sales_year,
        sum(netsales) as total_sales
    from sales
    group by extract(year from orderdate)
)
select *
from yearly_sales
order by sales_year;


-- q4. find transactions with net sales greater than 5,000

with high_value_sales as (
    select
        salesid,
        netsales,
        profit
    from sales
)
select *
from high_value_sales
where netsales > 5000;


-- q5. find the five products with the highest total quantity sold

with product_sales as (
    select
        productid,
        sum(quantity) as total_quantity_sold
    from sales
    group by productid
)
select *
from product_sales
order by total_quantity_sold desc
limit 5;


-- q6. calculate monthly sales and compare with the previous month

with monthly_sales as (
    select
        extract(year from orderdate) as sales_year,
        extract(month from orderdate) as sales_month,
        sum(netsales) as total_monthly_sales
    from sales
    group by
        extract(year from orderdate),
        extract(month from orderdate)
)
select
    sales_year,
    sales_month,
    total_monthly_sales,
    lag(total_monthly_sales) over (
        order by sales_year, sales_month
    ) as previous_month_sales
from monthly_sales
order by sales_year, sales_month;


-- q7. find the top 10 customers based on total revenue

with customer_revenue as (
    select
        customerid,
        sum(netsales) as total_revenue
    from sales
    group by customerid
)
select *
from customer_revenue
order by total_revenue desc
limit 10;


-- q8. find products whose total profit is greater than the average product profit

with product_profit as (
    select
        productid,
        sum(profit) as total_profit
    from sales
    group by productid
)
select *
from product_profit
where total_profit > (
    select avg(total_profit)
    from product_profit
)
order by total_profit desc;


-- q9. find regions whose total sales exceed the average sales across all regions

with region_sales as (
    select
        c.region,
        sum(s.netsales) as total_sales
    from sales s
    join customers c
        on s.customerid = c.customerid
    group by c.region
)
select *
from region_sales
where total_sales > (
    select avg(total_sales)
    from region_sales
)
order by total_sales desc;


-- q10. calculate each customer's total sales and rank them

with customer_sales as (
    select
        customerid,
        sum(netsales) as total_sales
    from sales
    group by customerid
)
select
    customerid,
    total_sales,
    rank() over(order by total_sales desc) as customer_rank
from customer_sales
order by customer_rank;


-- q11. calculate total sales, total profit and profit margin for each product
-- display products with a profit margin above 15%

with product_profit as (
    select
        productid,
        sum(netsales) as total_sales,
        sum(profit) as total_profit,
        round(
            sum(profit) * 100.0 / nullif(sum(netsales), 0),
            2
        ) as profit_margin_pct
    from sales
    group by productid
)
select *
from product_profit
where profit_margin_pct > 15
order by profit_margin_pct desc;

-- q12. find the top 10 customers based on total Profit.
with custom as (
select customerid, sum(profit) as total_profit
from sales 
group by customerid
order by total_profit desc
limit 10
)
select * from custom;

-- q13. calculate total quantity sold and total revenue
-- for each product.
with qty as (
select productid, sum(quantity) as total_qty_sold,
sum(netsales) as revenue
from sales
group by productid
) 
select * from qty;


-- q14. find customers whose total profit is greater than 10000.

with pro as(
select customerid, sum(profit) as total_profit
from sales
group by customerid
having sum(profit) > 10000
)
select * from pro;

-- q15. calculate monthly revenue using a cte.
-- use lag() to retrieve the previous month's revenue.
-- calculate revenue difference and revenue growth percentage.
-- display month, current revenue, previous revenue,
-- revenue difference, and growth percentage.
with monthly_revenue as (
    select
        date_trunc('month', orderdate)::date as month,
        sum(netsales) as current_revenue
    from sales
    group by date_trunc('month', orderdate)
),

revenue_growth as (
    select
        month,
        current_revenue,
        lag(current_revenue) over(order by month) as previous_revenue
    from monthly_revenue
)

select
    month,
    current_revenue,
    previous_revenue,

    current_revenue - previous_revenue as revenue_difference,

    round(
        (current_revenue - previous_revenue) * 100.0
        / nullif(previous_revenue, 0),
        2
    ) as growth_percentage

from revenue_growth
order by month;


