__________Customer Table__________

CREATE TABLE customers (
customer_code varchar(45) NOT NULL PRIMARY KEY,
customer_name varchar(45) DEFAULT NULL,
customer_type varchar(45) DEFAULT NULL
)

copy customers from 'D:/Sales Insights/customers.csv' DELIMITER ',' csv header

select * from customers


__________Date Table__________

CREATE TABLE date (
date date NOT NULL PRIMARY KEY,
cy_date date DEFAULT NULL,
year int DEFAULT NULL,
month_name varchar(45) DEFAULT NULL,
date_yy_mmm varchar(45) DEFAULT NULL
)

copy date from 'D:/Sales Insights/date.csv' DELIMITER ',' csv header

select * from date


__________Markets Table__________

CREATE TABLE markets (
markets_code varchar(45) NOT NULL PRIMARY KEY,
markets_name varchar(45) DEFAULT NULL,
zone varchar(45) DEFAULT NULL
)

copy markets from 'D:/Sales Insights/markets.csv' DELIMITER ',' csv header

select * from markets


__________Products Table__________

CREATE TABLE products (
product_code varchar(45) NOT NULL PRIMARY KEY,
product_type varchar(45) DEFAULT NULL
)

copy products from 'D:/Sales Insights/products.csv' DELIMITER ',' csv header

select * from products


__________Transactions Table__________

CREATE TABLE transactions (
product_code varchar(45) DEFAULT NULL,
customer_code varchar(45) DEFAULT NULL,
market_code varchar(45) DEFAULT NULL,
order_date date DEFAULT NULL,
sales_qty int DEFAULT NULL,
sales_amount int DEFAULT NULL,
currency varchar(45) DEFAULT NULL
)

copy transactions from 'D:/Sales Insights/transactions.csv' DELIMITER ',' csv header

select * from transactions

____________________________________

select count(*) from transactions where market_code = 'Mark001'

select * from transactions where currency = 'USD'

select sum(sales_amount) from transactions t 
inner join date d
on t.order_date = d.date
where year = 2020 and market_code = 'Mark001'

select distinct product_code from transactions where market_code = 'Mark001'

select count(currency) from transactions 

select * from transactions where currency = 'USD' or currency = 'USD\r'

select * from transactions where currency = 'INR'

select sum(sales_amount) from transactions t
inner join date d
on t.order_date = d.date
where year = 2020

select sum(sales_amount) from transactions t
inner join date d
on t.order_date = d.date
where year = 2020 and month_name = 'January'

select sum(t.sales_amount) from transactions t
inner join date d
on t.order_date = d.date
where year = 2020 and market_code = 'Mark001'
