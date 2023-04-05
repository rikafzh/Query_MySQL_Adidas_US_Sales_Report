-- Using data from Kaggle
-- https://www.kaggle.com/datasets/heemalichaudhari/adidas-sales-dataset

select * from adidas_ds;

-- 1. The number of products sold by Adidas in the US
select
	count(distinct product) as count_product
from adidas_ds ad;

-- 2. The types of products sold by Adidas in the US
select
	distinct product as product_name
from adidas_ds ad;

-- 3. Average unit price of products, operating profit, and operating margin per product
	product,
	round(avg(price_per_unit), 2) as avg_price_per_unit,
	round(avg(operating_profit), 2) as avg_op_profit,
	round(avg(operating_margin), 2) as avg_op_margin
from adidas_ds ad
group by 1;

-- 4. Total products sold, total sales, and total profit in the years 2020 and 2021
select
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
group by 1
order by 1;

-- 5. Total products sold, total sales, and total profit per Retailer in the years 2020 and 2021
select 
	retailer,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
group by 1,2
order by 2,3 desc;

-- 6. Total products sold, total sales, and total profit per Region in the years 2020 and 2021
select 
	region,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
group by 1,2
order by 2,3 desc;

-- 7. Total products sold, total sales, and total profit per sales method in the years 2020 and 2021
select 
	sales_method,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
group by 1,2
order by 2 asc;

-- 8.1 Total products sold, total sales, and total profit from Street Footwear products in 2020 and 2021
select 
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where product like '%Street Footwear'
group by 1
order by 2,1;

-- 8.2 Total products sold, total sales, and total profit from Athletic Footwear products in 2020 and 2021
select 
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where product like '%Athletic Footwear'
group by 1
order by 2,1;

-- 8.3 Total products sold, total sales, and total profit from Apparel products in 2020 and 2021
select
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where product like '%Apparel'
group by 1
order by 2,1;

-- 9.1 Total products sold, total sales, and total profit from the street footwear breakdown of each product in 2020 and 2021
select 
	product,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where product like '%Street Footwear'
group by 1,2
order by 2,3 desc;

-- 9.2 Total products sold, total sales, and total profit from the athletic footwear breakdown of each product in 2020 and 2021
select 
	product,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where product like '%Athletic Footwear'
group by 1,2
order by 2,3 desc;

-- 9.3 Total products sold, total sales, and total profit from the apparel breakdown of each product in 2020 and 2021
select
	product,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where product like '%Apparel'
group by 1,2
order by 2,3 desc;

-- 10.1 Total products sold, total sales, and total profit from men's categories of each product in 2020 and 2021
select 
	product,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where product like 'Men%'
group by 1,2
order by 2,3 desc;

-- 10.2 Total products sold, total sales, and total profit from women's categories of each product in 2020 and 2021
select 
	product,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where product like 'Women%'
group by 1,2
order by 2,3 desc;

-- 11.1 Cities with the most and least products sold, total sales, and total profit for men's street footwear products in 2020
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Street Footwear'
	and year(invoice_date) = 2020
group by 1,2
limit 1)
union
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Street Footwear'
	and year(invoice_date) = 2020
group by 1,2
order by 4 asc
limit 1);

-- 11.2 Cities with the most and least products sold, total sales, and total profit for men's street footwear products in 2021
(select 
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Street Footwear'
	and year(invoice_date) = 2021
group by 1,2
limit 1)
union
(select 
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Street Footwear'
	and year(invoice_date) = 2021
group by 1,2
order by 4 asc
limit 1);

-- 12.1 Cities with the most and least products sold, total sales, and total profit for men's athletic footwear products in 2020
(select 
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Athletic Footwear'
	and year(invoice_date) = 2020
group by 1,2
limit 1)
union
(select 
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Athletic Footwear'
	and year(invoice_date) = 2020
group by 1,2
order by 4 asc
limit 1);

-- 12.2 Cities with the most and least products sold, total sales, and total profit for men's athletic footwear products in 2021
(select 
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Athletic Footwear'
	and year(invoice_date) = 2021
group by 1,2
limit 1)
union
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Athletic Footwear'
	and year(invoice_date) = 2021
group by 1,2
order by 4 asc
limit 1);

-- 13.1 Cities with the most and least products sold, total sales, and total profit for men's apparel products in 2020
(select 
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Apparel'
	and year(invoice_date) = 2020
group by 1,2
limit 1)
union
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Apparel'
	and year(invoice_date) = 2020
group by 1,2
order by 4 asc
limit 1);

-- 13.2 Cities with the most and least products sold, total sales, and total profit for men's apparel products in 2021
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Apparel'
	and year(invoice_date) = 2021
group by 1,2
limit 1)
union
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Men%Apparel'
	and year(invoice_date) = 2021
group by 1,2
order by 4 asc
limit 1);

-- 14.1 Cities with the most and least products sold, total sales, and total profit for women's street footwear products in 2020
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Street Footwear'
	and year(invoice_date) = 2020
group by 1,2
limit 1)
union 
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Street Footwear'
	and year(invoice_date) = 2020
group by 1,2
order by 4 asc
limit 1);

-- 14.2 Cities with the most and least products sold, total sales, and total profit for women's street footwear products in 2021
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Street Footwear'
	and year(invoice_date) = 2021
group by 1,2
limit 1)
union
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Street Footwear'
	and year(invoice_date) = 2021
group by 1,2
order by 4 asc
limit 1);

-- 15.1 Cities with the most and least products sold, total sales, and total profit for women's athletic footwear products in 2020
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Athletic Footwear'
	and year(invoice_date) = 2020
group by 1,2
limit 1)
union
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Athletic Footwear'
	and year(invoice_date) = 2020
group by 1,2
order by 4 asc
limit 1);

-- 15.2 Cities with the most and least products sold, total sales, and total profit for women's athletic footwear products in 2021
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Athletic Footwear'
	and year(invoice_date) = 2021
group by 1,2
limit 1)
union
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Athletic Footwear'
	and year(invoice_date) = 2021
group by 1,2
order by 4 asc
limit 1);

-- 16.1 Cities with the most and least products sold, total sales, and total profit for women's apparel products in 2020
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Apparel'
	and year(invoice_date) = 2020
group by 1,2
limit 1)
union
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Apparel'
	and year(invoice_date) = 2020
group by 1,2
order by 4 asc
limit 1);

-- 16.2 Cities with the most and least products sold, total sales, and total profit for women's apparel products in 2021
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Apparel'
	and year(invoice_date) = 2021
group by 1,2
limit 1)
union
(select
	city,
	year(invoice_date) as year,
	sum(units_sold) as total_sold,
	sum(total_sales) as total_sales,
	sum(operating_profit) as total_profit
from adidas_ds ad
where
	product like 'Women%Apparel'
	and year(invoice_date) = 2021
group by 1,2
order by 4 asc
limit 1);