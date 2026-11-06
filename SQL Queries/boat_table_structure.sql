use boat;
-- customer table
create table customers (
CustomerID int primary key,
SignupDate date,
Gender varchar(10),
AgeBand VARCHAR(10),
Segment varchar(100),
Tier varchar(100),
City varchar(50),
State varchar(50),
Region	varchar(50),
PreferredChannel varchar(100),	
ActivityWeight decimal
);
select * from customers;

-- delivery_partner
create table delivery_partner (
DeliveryPartnerID	int primary key,
PartnerName	varchar(100),
HomeCity varchar(100),
Region	varchar(100),
VehicleType	varchar(100),
Rating	decimal,
ExperienceYears int);
select * from delivery_partner;


-- ptoducts table 
create table products(
ProductID	int primary key,
Brand varchar(100),
Category varchar(100),
SubCategory	varchar(100),
ProductName	varchar(100),
HeroFlag int,
LaunchYear	smallint,
MRP	int,
CostPrice decimal,	
DemandCluster varchar(100) );
select * from products;


-- sales_channel table
create table sales_channel(
ChannelID	int primary key,
ChannelName	varchar(50),
ChannelType	varchar(50),
ChannelScope varchar(50),
RegionScope	varchar(50),
BaseShare decimal );
select * from sales_channel;


-- sales table 
CREATE TABLE sales (
    SalesID INT PRIMARY KEY,
    OrderDate DATE,
    OrderHour INT,
    CustomerID INT,
    ProductID INT,
    ChannelID INT,
    DeliveryPartnerID INT,
    Quantity INT,
    GrossMRPValue DECIMAL(12,2),
    DiscountPct DECIMAL(5,2),
    DiscountAmount DECIMAL(12,2),
    SellingPrice DECIMAL(12,2),
    NetSales DECIMAL(12,2),
    GSTRate DECIMAL(5,2),
    GSTAmount DECIMAL(12,2),
    COGS DECIMAL(12,2),
    ShippingCost DECIMAL(10,2),
    Profit DECIMAL(12,2),
    PaymentMethod VARCHAR(50),
    OrderStatus VARCHAR(30),
    CancellationReason VARCHAR(255),
    ReturnReason VARCHAR(255),
    DeliveryDays INT,
    CustomerTier VARCHAR(20),
    CustomerSegment VARCHAR(50),
    CityTier VARCHAR(20),
    ChannelType VARCHAR(30),
    IsFestivalPeriod INT,
    FestivalName VARCHAR(100), 
    IsWeekend INT,
    ProductCategory VARCHAR(100),
    HeroFlag INT
);
drop table sales
select * from sales
limit 20;

COPY sales
FROM 'C:/path/to/sales.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE
);




-- create table relationship 
ALTER TABLE sales
ADD CONSTRAINT fk_sales_customer
FOREIGN KEY (customerid)
REFERENCES customers (customerid);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_product
FOREIGN KEY (productid)
REFERENCES products (productid);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_channel
FOREIGN KEY (channelid)
REFERENCES sales_channel (channelid);

ALTER TABLE sales
ADD CONSTRAINT fk_sales_delivery_partner
FOREIGN KEY (deliverypartnerid)
REFERENCES delivery_partner (deliverypartnerid);
