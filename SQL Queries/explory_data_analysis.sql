-- q1. find the total number of customers

select count(*) as total_customers
from customers;


-- q2. find the total number of delivery partners

select count(*) as total_delivery_partners
from delivery_partner;


-- q3. find the total number of products

select count(*) as total_products
from products;


-- q4. find the total number of sales channels

select count(*) as total_sales_channels
from sales_channel;


-- q5. find the total number of sales records

select count(*) as total_sales
from sales;


-- q6. check for duplicate customer records

select
    customerid,
    count(*) as duplicate_rows
from customers
group by customerid
having count(*) > 1;


-- q7. check for duplicate sales records

select
    salesid,
    count(*) as duplicate_rows
from sales
group by salesid
having count(*) > 1;


-- q8. find sales records that do not have a matching customer

select count(*) as unmatched_customer_sales
from sales s
left join customers c
    on s.customerid = c.customerid
where c.customerid is null;


-- q9. find total matched and unmatched sales records

select
    count(*) as total_sales,
    count(c.customerid) as matched_sales,
    count(*) - count(c.customerid) as unmatched_sales
from sales s
left join customers c
    on s.customerid = c.customerid;


-- q10. check for missing values in important sales columns

select
    count(*) filter (where customerid is null) as missing_customerid,
    count(*) filter (where productid is null) as missing_productid,
    count(*) filter (where netsales is null) as missing_netsales,
    count(*) filter (where profit is null) as missing_profit,
    count(*) filter (where orderdate is null) as missing_orderdate
from sales;