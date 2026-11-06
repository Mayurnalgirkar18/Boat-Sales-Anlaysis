-- q1. find sales records whose net sales are greater than the overall average

select
    salesid,
    netsales,
    orderstatus
from sales
where netsales > (
    select avg(netsales)
    from sales
);


-- q2. find customers whose total sales are greater than the average total sales per customer

select
    customerid,
    sum(netsales) as total_sales
from sales
group by customerid
having sum(netsales) > (
    select avg(customer_total)
    from (
        select sum(netsales) as customer_total
        from sales
        group by customerid
    ) as customer_sales
);


-- q3. find transactions whose profit is greater than the average profit of their product

select *
from sales s1
where profit > (
    select avg(s2.profit)
    from sales s2
    where s2.productid = s1.productid
);


-- q4. find customers who have never placed an order

select c.customerid
from customers c
where not exists (
    select 1
    from sales s
    where s.customerid = c.customerid
);


-- q5. find products whose mrp is greater than the average mrp

select *
from products
where mrp > (
    select avg(mrp)
    from products
);


-- q6. find transactions where net sales equals the highest transaction value for that customer

select *
from sales s1
where netsales = (
    select max(s2.netsales)
    from sales s2
    where s2.customerid = s1.customerid
);


-- q7. find transactions having the minimum profit for their respective products

select *
from sales s1
where profit = (
    select min(s2.profit)
    from sales s2
    where s2.productid = s1.productid
);


-- q8. find each customer's latest order

select *
from sales s1
where orderdate = (
    select max(s2.orderdate)
    from sales s2
    where s2.customerid = s1.customerid
);


-- q9. find transactions whose net sales are greater than the average net sales of their region

select
    s.salesid,
    s.customerid,
    c.region,
    s.netsales
from sales s
join customers c
    on s.customerid = c.customerid
where s.netsales > (
    select avg(s2.netsales)
    from sales s2
    join customers c2
        on s2.customerid = c2.customerid
    where c2.region = c.region
);


-- q10. find customers who purchased products from more than one category

select
    customerid,
    count(distinct productcategory) as total_categories
from sales
group by customerid
having count(distinct productcategory) > 1;


-- q11. find customers who have placed more orders than the average number of orders per customer

select
    customerid,
    count(*) as total_orders
from sales
group by customerid
having count(*) > (
    select avg(order_count)
    from (
        select count(*) as order_count
        from sales
        group by customerid
    ) as customer_orders
);


-- q12. find customers who purchased the same product
-- more than once.
-- display customerid and productid.
select
    customerid,
    productid,
    count(*) as purchase_count
from sales
group by customerid, productid
having count(*) > 1
order by purchase_count desc;



-- q13. find products whose total revenue is greater than
-- the total revenue of product product name 'boAt Airdopes 181 Pro'.
-- use a subquery to get the reference product's revenue.
select p.productname,sum(s.netsales) as revenue
from products p
join sales s
on p.productid = s.productid
group by p.productname
having sum(s.netsales) > (
select sum(s.netsales)
    from sales s
    join products p
        on s.productid = p.productid
    where p.productname = 'boAt Airdopes 181 Pro'
);



-- q14. find customers who generated more revenue than
-- customer 500001.
-- display customerid and total_revenue.

select customerid, sum(netsales) as revenue
from sales
group by customerid
having sum(netsales) > (
select  sum(netsales)
from sales
where customerid = 500001
);


-- q15. find cities where the total cancelled orders are greater
-- than the average cancelled orders across all cities.
select c.city,
       count(case when s.orderstatus = 'Cancelled' then 1 end) as cancelled_orders
from customers c
join sales s
on c.customerid = s.customerid
group by c.city
having count(case when s.orderstatus = 'Cancelled' then 1 end) > (
    select avg(city_cancelled)
    from (
        select count(case when s2.orderstatus = 'Cancelled' then 1 end) as city_cancelled
        from customers c2
        join sales s2
        on c2.customerid = s2.customerid
        group by c2.city
    ) as city_counts
);









