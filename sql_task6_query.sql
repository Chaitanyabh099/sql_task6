--sales_data : customer_id	product_id	product_category	region	store_type	sales_amount	discount	units_sold

create table sales_data(
	customer_id varchar,
	product_id	varchar,
	product_category varchar,
	region	varchar,
	store_type	varchar,
	sales_amount float,
	discount float,
	units_sold float

)
select * from sales_data
	
--product_data : product_id	product_category	region	store_type	brand	sales_amount	discount	units_sold	purchase_amount	delivery_time	return_rate
create table product_data(
	product_id varchar,	
	product_category varchar,
	region	varchar,
	store_type	varchar,
	brand	varchar,
	sales_amount float,
	discount float,	
	units_sold	float,	
	purchase_amount float,		
	delivery_time float,	
	return_rate float

)
select * from product_data	
--- customer_data : customer_id	customer_segment	payment_method	shipping_mode	purchase_amount	delivery_time	items_purchased
create table customer_data(
	customer_id	varchar,
	customer_segment varchar,	
	payment_method	varchar,
	shipping_mode	varchar,
	purchase_amount	float,
	delivery_time	float,
	items_purchased float

)
select * from customer_data

/*task	
	get data from any website, data must be in csv file that you download , should have  min 3 table. 
2 table should contain  min 3 category data and 3 numerical data , 
1 table should contain 5 categorical data and 4 numerical .    
do joins , group by , having, union example.    
min rows should be 1000			*/
		

-- join in 2 tables
select * from sales_data as s --1068
select * from customer_data as c --1429
select * from product_data --1484

select customer_id,product_category,sales_amount from sales_data
select customer_id,customer_segment,shipping_mode,purchase_amount from customer_data

--inner join
select s.customer_id,s.product_category,s.sales_amount,
	c.customer_id,c.customer_segment,c.shipping_mode,c.purchase_amount from sales_data as s
inner join customer_data as c
on s.customer_id = c.customer_id
--data 1113

select * from sales_data as s
inner join customer_data as c
on s.customer_id = c.customer_id
	
--left join
select * from sales_data as s 
left join customer_data as c
on s.customer_id = c.customer_id
---data 1231
	
--right join
select * from sales_data as s
right join  customer_data as c
on s.customer_id = c.customer_id
--- data 1554

--full join
select * from sales_data as s
full join  customer_data as c
on s.customer_id = c.customer_id
--data 1672

--group by and limit with 2 table product and sales data
select *from sales_data
select * from product_data

select sum(s.sales_amount), avg(s.units_sold),s.region , s.product_category from sales_data as s
select p.brand,p.store_type from product_data as p

--inner join
select * from sales_data as s
inner join product_data as p
on s.product_id = p.product_id
--1150
	
select sum(s.sales_amount), avg(s.units_sold), s.product_category, 
	s.region ,p.brand,p.store_type from sales_data as s
inner join product_data as p
on s.product_id = p.product_id
group by s.product_category, 
	s.region ,p.brand,p.store_type
having sum(s.sales_amount) > 3000


--left join
select * from sales_data as s
left join product_data as p
on s.product_id = p.product_id
--1217
	
select sum(s.sales_amount), avg(s.units_sold), s.product_category, 
	s.region ,p.brand,p.store_type from sales_data as s
left join product_data as p
on s.product_id = p.product_id
group by s.product_category, 
	s.region ,p.brand,p.store_type
having sum(s.sales_amount) > 3000
order by avg(s.units_sold)


--right join
select * from sales_data as s
right join product_data as p
on s.product_id = p.product_id
--1614
	
select sum(s.sales_amount), avg(s.units_sold), s.product_category, 
	s.region ,p.brand,p.store_type from sales_data as s
right join product_data as p
on s.product_id = p.product_id
group by s.product_category, 
	s.region ,p.brand,p.store_type
having sum(s.sales_amount) > 3000
order by avg(s.units_sold)
limit 50

--full join
select * from sales_data as s
full join product_data as p
on s.product_id = p.product_id
--1681
	
select sum(s.sales_amount), avg(s.units_sold), s.product_category, 
	s.region ,p.brand,p.store_type from sales_data as s
full join product_data as p
on s.product_id = p.product_id
group by s.product_category, 
	s.region ,p.brand,p.store_type
having sum(s.sales_amount) > 3000
order by avg(s.units_sold)
limit 50

--- multi join
select * from sales_data
select * from product_data
select * from customer_data

	
select * from sales_data as s
inner join product_data as p
on s.product_id = p.product_id
inner join customer_data as c
on s.customer_id = c.customer_id

	
select s.customer_id,s.product_id,s.product_category,s.sales_amount,
	p.brand,p.units_sold,p.purchase_amount,c.customer_segment,c.shipping_mode
	from sales_data as s
inner join product_data as p
on s.product_id = p.product_id
inner join customer_data as c
on s.customer_id = c.customer_id

--left join
select s.customer_id as s_customer_id,c.customer_id as c_customer_id,s.product_id,s.product_category,s.sales_amount,
	p.brand,p.units_sold,p.purchase_amount,c.customer_segment,c.shipping_mode
	from sales_data as s
left join product_data as p
on s.product_id = p.product_id
left join customer_data as c
on s.customer_id = c.customer_id

select *
	from sales_data as s
left join product_data as p
on s.product_id = p.product_id
left join customer_data as c
on s.customer_id = c.customer_id

--right join
select s.customer_id as s_customer_id,c.customer_id as c_customer_id,s.product_id,s.product_category,s.sales_amount,
	p.brand,p.units_sold,p.purchase_amount,c.customer_segment,c.shipping_mode
	from sales_data as s
right join product_data as p
on s.product_id = p.product_id
right join customer_data as c
on s.customer_id = c.customer_id

select *
	from sales_data as s
right join product_data as p
on s.product_id = p.product_id
right join customer_data as c
on s.customer_id = c.customer_id



--full join
select s.customer_id as s_customer_id,c.customer_id as c_customer_id,s.product_id,s.product_category,s.sales_amount,
	p.brand,p.units_sold,p.purchase_amount,c.customer_segment,c.shipping_mode
	from sales_data as s
full join product_data as p
on s.product_id = p.product_id
full join customer_data as c
on s.customer_id = c.customer_id

select *
	from sales_data as s
full join product_data as p
on s.product_id = p.product_id
full join customer_data as c
on s.customer_id = c.customer_id


select * from customer_data where purchase_amount < 100
union
select * from customer_data where purchase_amount between 1000 and 1500

select * from product_data
select * from product_data where units_sold < 10
union
select * from product_data where units_sold between 30 and 55















