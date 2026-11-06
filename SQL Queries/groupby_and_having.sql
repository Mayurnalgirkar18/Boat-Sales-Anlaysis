-- q1. count the number of orders for each order status

select
    orderstatus,
    count(*) as total_orders
from sales
group by orderstatus;


-- q2. find the number of customers in each customer segment

select
    customersegment,
    count(*) as total_customers
from customers
group by customersegment
order by total_customers desc;


-- q3. find the top 10 customers based on total revenue

select
    customerid,
    sum(netsales) as total_revenue
from sales
group by customerid
order by total_revenue desc
limit 10;


-- q4. find customers who have placed more than five orders

select
    customerid,
    count(*) as total_orders
from sales
group by customerid
having count(*) > 5
order by total_orders desc;


-- q5. find cities with total sales greater than 10,00,000

select
    c.city,
    sum(s.netsales) as total_revenue
from sales s
join customers c
    on s.customerid = c.customerid
group by c.city
having sum(s.netsales) > 1000000
order by total_revenue desc;


-- q6. find the top 10 most profitable products

select
    productid,
    sum(profit) as total_profit
from sales
group by productid
order by total_profit desc
limit 10;


-- q7. calculate the average discount for each product category

select
    productcategory,
    round(avg(discountpct) * 100, 2) as average_discount_pct
from sales
group by productcategory
order by average_discount_pct desc;


-- q8. rank payment methods based on total revenue

select
    paymentmethod,
    sum(netsales) as total_revenue,
    rank() over(order by sum(netsales) desc) as revenue_rank
from sales
group by paymentmethod
order by revenue_rank;


-- q9. calculate total revenue and average order value for each customer tier

select
    customertier,
    sum(netsales) as total_revenue,
    round(avg(netsales), 2) as average_order_value
from sales
group by customertier
order by total_revenue desc;


-- q10. find products that generated a total loss

select
    productid,
    sum(profit) as total_profit
from sales
group by productid
having sum(profit) < 0
order by total_profit;


-- q11. calculate the percentage of successfully delivered orders

select
    round(
        100.0 * count(*) filter (
            where lower(trim(orderstatus)) = 'delivered'
        ) / nullif(count(*), 0),
        2
    ) as success_percentage
from sales;


-- q12. find customers who purchased products from more than one category

select
    customerid,
    count(distinct productcategory) as total_categories
from sales
group by customerid
having count(distinct productcategory) > 1
order by total_categories desc;


-- q13. calculate the total orders and average delivery time for each delivery partner

select
    deliverypartnerid,
    count(*) as total_orders,
    round(avg(deliverydays), 2) as average_delivery_days
from sales
group by deliverypartnerid
order by total_orders desc;


-- q14. calculate each product category's contribution to total revenue

select
    productcategory,
    sum(netsales) as category_revenue,
    round(
        sum(netsales) * 100.0 / nullif(
            (select sum(netsales) from sales), 0
        ),
        2
    ) as revenue_contribution_pct
from sales
group by productcategory
order by revenue_contribution_pct desc;


-- q15. calculate monthly revenue

select
    extract(year from orderdate) as sales_year,
    extract(month from orderdate) as sales_month,
    sum(netsales) as total_revenue
from sales
group by
    extract(year from orderdate),
    extract(month from orderdate)
order by sales_year, sales_month;


-- q16. compare festival and non-festival revenue

select
    case
        when isfestivalperiod = 1 then 'festival period'
        else 'non-festival period'
    end as sales_period,
    sum(netsales) as total_revenue
from sales
group by isfestivalperiod
order by total_revenue desc;


-- q17. compare weekend and weekday revenue and profit

select
    case
        when isweekend = 1 then 'weekend'
        else 'weekday'
    end as sales_period,
    sum(netsales) as total_revenue,
    sum(profit) as total_profit
from sales
group by isweekend
order by total_revenue desc;


-- q18. calculate cancelled orders and cancellation percentage for each city

select
    c.city,
    count(*) filter (
        where lower(trim(s.orderstatus)) = 'cancelled'
    ) as cancelled_orders,
    count(*) as total_orders,
    round(
        100.0 * count(*) filter (
            where lower(trim(s.orderstatus)) = 'cancelled'
        ) / nullif(count(*), 0),
        2
    ) as cancellation_percentage
from sales s
join customers c
    on s.customerid = c.customerid
group by c.city
order by cancellation_percentage desc;


-- q19. calculate total shipping cost and shipping cost percentage for each category

select
    productcategory,
    sum(shippingcost) as total_shipping_cost,
    round(
        100.0 * sum(shippingcost) / nullif(sum(netsales), 0),
        2
    ) as shipping_cost_percentage
from sales
group by productcategory
order by shipping_cost_percentage desc;


-- q20. calculate the total sales records and revenue for each payment method

select
    paymentmethod,
    count(*) as total_sales,
    sum(netsales) as total_revenue
from sales
group by paymentmethod
order by total_revenue desc;


-- q21. find customers whose total revenue is greater than 50,000

select
    customerid,
    sum(netsales) as total_revenue
from sales
group by customerid
having sum(netsales) > 50000;


-- q22. calculate total profit and quantity sold for each product category

select
    productcategory,
    sum(profit) as total_profit,
    sum(quantity) as total_quantity_sold
from sales
group by productcategory
order by total_profit desc;