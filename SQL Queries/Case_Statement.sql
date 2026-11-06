-- q1. classify sales records based on profit

select
    case
        when profit > 1000 then 'high profit'
        when profit between 500 and 1000 then 'medium profit'
        else 'low profit'
    end as profit_category,
    count(*) as total_sales_records
from sales
group by profit_category
order by total_sales_records desc;


-- q2. classify orders into delivered, cancelled and other statuses

select
    case
        when lower(trim(orderstatus)) = 'delivered' then 'delivered'
        when lower(trim(orderstatus)) = 'cancelled' then 'cancelled'
        else 'other status'
    end as order_category,
    count(*) as total_orders
from sales
group by order_category;


-- q3. compare festival and non-festival sales

select
    case
        when isfestivalperiod = 1 then 'festival'
        else 'non-festival'
    end as sales_period,
    sum(netsales) as total_revenue,
    sum(profit) as total_profit
from sales
group by sales_period;


-- q4. classify orders based on delivery time

select
    case
        when deliverydays <= 2 then 'fast delivery'
        when deliverydays between 3 and 5 then 'normal delivery'
        else 'delayed delivery'
    end as delivery_category,
    count(*) as total_orders
from sales
group by delivery_category;

-- q5. classify each transaction based on netsales:
-- high: above 5000
-- medium: between 2000 and 5000
-- low: below 2000
-- display salesid, netsales, and sales_category.

select salesid, netsales,
case 
when netsales > 5000 then 'high'
when netsales between 2000 and 5000 then 'medium'
else 'low' end as sales_category
from sales;

-- q6. classify deliveries based on deliverydays:
-- fast: 2 days or less
-- normal: 3 to 5 days
-- delayed: more than 5 days
-- display salesid, deliverydays, and delivery_status.

select salesid, deliverydays,
case when deliverydays <= 2 then 'fast'
when deliverydays between 3 and 5 then 'normal'
else 'delayed' end as delivery_status
from sales;

-- q7. calculate each customer's total revenue and classify them:
-- premium: above 50000
-- regular: between 20000 and 50000
-- basic: below 20000
-- display customerid, total_revenue, and customer_category.

SELECT CUSTOMERID, SUM(NETSALES)AS REVENUE,
CASE WHEN SUM(NETSALES) > 50000 THEN 'PREMIUM'
WHEN SUM(NETSALES) BETWEEN 20000 AND 50000 THEN 'REGULAR'
ELSE 'BASIC' END AS CUSTOMER_CATEGORY
FROM SALES
GROUP BY CUSTOMERID;

-- q8. classify transactions based on profit:
-- high profit: above 1000
-- medium profit: between 500 and 1000
-- low profit: below 500
-- display salesid, profit, and profit_category.

select salesid, profit, 
case when profit > 1000 then 'high profit'
when profit between 500 and 1000 then 'medium profit'
else 'low profit' end as profit_category
from sales;

-- q9. count completed, cancelled, and returned orders separately
-- using conditional aggregation.
-- display all three counts in a single row.

select
    count(case when orderstatus = 'Delivered' then 1 end) as completed_orders,
    count(case when orderstatus = 'Cancelled' then 1 end) as cancelled_orders,
    count(case when orderstatus = 'Returned' then 1 end) as returned_orders
from sales;

-- q10. calculate total orders, total revenue, and cancelled orders
-- for each city.
-- calculate cancellation percentage and classify cities:
-- high risk: above 20%
-- medium risk: between 10% and 20%
-- low risk: below 10%
-- sort by cancellation percentage descending.

with city_analysis as (
    select
        c.city,
        count(*) as total_orders,
        sum(s.netsales) as total_revenue,
        count(*) filter (
            where lower(trim(s.orderstatus)) = 'cancelled'
        ) as cancelled_orders
    from sales s
    join customers c
        on s.customerid = c.customerid
    group by c.city
)

select
    city,
    total_orders,
    total_revenue,
    cancelled_orders,

    round(
        cancelled_orders * 100.0 / nullif(total_orders, 0),
        2
    ) as cancellation_percentage,

    case
        when cancelled_orders * 100.0 / nullif(total_orders, 0) > 20
            then 'high risk'
        when cancelled_orders * 100.0 / nullif(total_orders, 0) >= 10
            then 'medium risk'
        else 'low risk'
    end as risk_category

from city_analysis
order by cancellation_percentage desc;




