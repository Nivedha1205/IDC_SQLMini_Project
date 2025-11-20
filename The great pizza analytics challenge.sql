use IDC_Pizza;
select * from pizza_types;
select * from order_details;
select * from orders;
select * from pizzas;

#List all unique pizza categories (DISTINCT).
select distinct(category) as unique_pizza from pizza_types;

#Display pizza_type_id, name, and ingredients, replacing NULL ingredients with "Missing Data". Show first 5 rows.
select pizza_type_id, name, coalesce(ingredients, "Missing Data") as ingredients from pizza_types limit 5;

#Check for pizzas missing a price (IS NULL).
select * from pizzas where price is null;

#Phase 2: Filtering & Exploration**

#Orders placed on `'2015-01-01'` (`SELECT` + `WHERE`).
select order_id, date from orders where date = '2015-01-01';

#List pizzas with price descending.
select pizza_id, pizza_type_id, size, price from pizzas order by price desc;

#Pizzas sold in sizes 'L' or 'XL'.
select pizza_id, pizza_type_id, size from pizzas where (size = 'L') or (size = 'XL');

#Pizzas priced between $15.00 and $17.00.
select pizza_id, pizza_type_id, size, price from pizzas where price between 15.00 and 17.00;

#Pizzas with "Chicken" in the name.
select pizza_type_id, name from pizza_types where name like '%Chicken%';

#Orders on '2015-02-15' or placed after 8 PM.
select order_id, date, time from orders where (date = '2015-02-15') or (time >= '20:00:00');

#Phase 3: Sales Performance

#Total quantity of pizzas sold (SUM).
select sum(quantity) as pizzas_sold from order_details;

#Average pizza price (AVG).
select avg(price) as avg_pizza_price from pizzas;

#Total order value per order (JOIN, SUM, GROUP BY).
select od.order_id, sum(od.quantity * p.price) as total_order_value from order_details od
join pizzas p on p.pizza_id = od.pizza_id group by od.order_id;

#Total quantity sold per pizza category (JOIN, GROUP BY).
select pt.category, sum(od.quantity) as total_qty_sold from order_details od
join pizzas p on p.pizza_id = od.pizza_id
join pizza_types pt on pt.pizza_type_id = p.pizza_type_id
group by pt.category;

#Categories with more than 5,000 pizzas sold (HAVING).
select pt.category, sum(od.quantity) as total_qty_sold from order_details od
join pizzas p on p.pizza_id = od.pizza_id
join pizza_types pt on pt.pizza_type_id = p.pizza_type_id
group by pt.category having sum(od.quantity) > 5000;

#Pizzas never ordered (LEFT/RIGHT JOIN).
select p.pizza_id, p.pizza_type_id, p.size from pizzas p
left join order_details od on p.pizza_id = od.pizza_id
where od.order_details_id is null;

#Price differences between different sizes of the same pizza (SELF JOIN).
select p1.pizza_type_id,
p1.size as size_1,
p2.size as size_2,
p1.price as price_1,
p2.price as price_2,
abs(p1.price - p2.price) as price_difference from pizzas p1
join pizzas p2 on p1.pizza_type_id = p2.pizza_type_id
where p1.price < p2.price;
