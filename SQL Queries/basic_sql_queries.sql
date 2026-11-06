-- q1. find the total number of sales records

select count(*) as total_sales
from sales;


-- q2. find the total number of customers

select count(*) as total_customers
from customers;


-- q3. find the number of unique customers who placed orders

select count(distinct customerid) as unique_customers
from sales;


-- q4. calculate the total net sales revenue

select sum(netsales) as total_revenue
from sales;


-- q5. calculate the total profit

select sum(profit) as total_profit
from sales;


-- q6. find all unique product categories

select distinct productcategory
from sales;


-- q7. find all available payment methods

select distinct paymentmethod
from sales;


-- q8. find the average selling price

select round(avg(sellingprice), 2) as average_selling_price
from sales;


-- q9. find the highest sales transaction

select *
from sales
order by netsales desc
limit 1;


-- q10. find the transaction with the lowest profit

select *
from sales
order by profit asc
limit 1;


-- q11. calculate the average delivery time

select round(avg(deliverydays), 2) as average_delivery_days
from sales;