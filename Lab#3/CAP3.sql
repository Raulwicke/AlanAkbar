-- Question 1
SELECT ordnum,totalUSD
from Orders;

-- Question 2
SELECT name,city
From Agents
Where name = 'Smith';

-- Question 3
SELECT pid,name,priceUSD
From Products
Where quantity > 201000;

-- Question 4
SELECT name,city
From customers
where city = 'Duluth';

-- Question 5
Select name
from agents
where NOT
	(city  =  'Duluth'
		OR
    city = 'New York');

-- Question 6
SELECT *
From products
where NOT (city = 'Dallas' 
           OR
           city = 'Duluth'
           OR
           priceUSD < 1.0);

-- Question 7
Select *
From orders
where not (mon = 'feb'
           or
           mon = 'mar');
           
-- Question 8
Select *
from orders
where (mon = 'feb'
       and
       totalUSD > 599);
       
-- Question 9
Select *
from orders
where orders.cid = 'c005';