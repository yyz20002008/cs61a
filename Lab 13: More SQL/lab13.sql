.read data.sql


CREATE TABLE average_prices AS
  SELECT category,avg(MSRP) average_price 
  from products
  group by category;


CREATE TABLE lowest_prices AS
  SELECT i1.*
  from inventory i1
  join (
  select item,min(price) min_price
  from inventory
  group by item
  )i2
  on i1.item=i2.item and i1.price=i2.min_price;


CREATE TABLE shopping_list AS
  SELECT A.name,l.store
  From (
  select *,row_number() over(partition by category order by (MSRP*1.0/rating)) RK
  from products
  ) A
  join lowest_prices l
	on A.name=l.item and    A.RK=1
  ;


CREATE TABLE total_bandwidth AS
  SELECT sum(Mbs) Mb
  from shopping_list s1
  join stores s2
  on s1.store=s2.store
  ;

