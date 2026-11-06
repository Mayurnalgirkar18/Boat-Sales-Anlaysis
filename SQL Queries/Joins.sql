-- q1. calculate city-wise revenue using customers and sales tables

select
    c.city,
    sum(s.netsales) as total_revenue
from customers c
join sales s
    on c.customerid = s.customerid
group by c.city
order by total_revenue desc;


-- q2. calculate revenue and profit for each sales channel

select
    sc.channelname,
    sum(s.netsales) as total_revenue,
    sum(s.profit) as total_profit
from sales s
join sales_channel sc
    on s.channelid = sc.channelid
group by sc.channelname
order by total_revenue desc;


-- q3. find customers who have never placed an order

select
    c.customerid,
    c.city
from customers c
left join sales s
    on c.customerid = s.customerid
where s.customerid is null;


-- q4. find pairs of customers who live in the same city

select
    c1.customerid as customer1,
    c2.customerid as customer2,
    c1.city
from customers c1
join customers c2
    on c1.city = c2.city
    and c1.customerid < c2.customerid;


-- q5. find customers who have never purchased anything using a right join

select
    c.customerid,
    c.city
from sales s
right join customers c
    on s.customerid = c.customerid
where s.customerid is null;


-- q6. calculate total quantity sold for each product

select
    p.productid,
    p.productname,
    sum(s.quantity) as total_quantity_sold
from products p
join sales s
    on p.productid = s.productid
group by p.productid, p.productname
order by total_quantity_sold desc;


-- q7. find products that have never been sold

select
    p.productid,
    p.productname
from products p
left join sales s
    on p.productid = s.productid
where s.productid is null;


-- q8. find products with an average discount greater than 20%

select
    p.productname,
    round(avg(s.discountpct) * 100, 2) as average_discount_pct
from products p
join sales s
    on p.productid = s.productid
group by p.productid, p.productname
having avg(s.discountpct) > 0.20
order by average_discount_pct desc;


-- q9. find pairs of products from the same category with different prices

select
    p1.productname as product1,
    p1.costprice as price1,
    p2.productname as product2,
    p2.costprice as price2,
    p1.category
from products p1
join products p2
    on p1.category = p2.category
    and p1.productid < p2.productid
where p1.costprice <> p2.costprice
order by p1.category;