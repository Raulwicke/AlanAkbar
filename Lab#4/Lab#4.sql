-- Question 1
SELECT city
FROM   AGENTS
WHERE  aid IN
   (SELECT aid
    FROM   orders
    WHERE  cid = 'c006'
    );

-- Question 2
SELECT pid
FROM ORDERS
WHERE aid IN
	(SELECT aid
     FROM ORDERS
     WHERE cid in
     	(SELECT cid
         FROM CUSTOMERS
         WHERE city = 'Kyoto')
    )
ORDER BY pid DESC;

-- Question 3
SELECT cid,name
FROM CUSTOMERS
WHERE cid NOT IN
	(SELECT cid
     FROM ORDERS
     WHERE aid IN (
         SELECT aid 
         FROM AGENTS
         WHERE aid = 'a03')
     );
-- Question 4
SELECT cid
FROM CUSTOMERS
WHERE cid IN(
    SELECT cid
    FROM ORDERS
    WHERE pid IN(
        SELECT pid
        FROM PRODUCTS
        WHERE pid = 'p01'
				OR
        	  pid = 'p07')
    );
-- Question 5
SELECT pid
FROM   PRODUCTS
WHERE  pid NOT IN
	(SELECT pid
	 FROM   ORDERS
     WHERE  aid  IN
		(SELECT aid
         FROM   AGENTS
         WHERE  aid = 'a08')
     )
ORDER BY pid DESC;

-- Question 6
SELECT name, discount, city
FROM   CUSTOMERS
WHERE  cid IN
	(SELECT cid
     FROM   ORDERS
     WHERE  aid IN
     	(SELECT aid
         FROM   AGENTS
         WHERE  city = 'New York'
         		 		  OR
         	    city = 'Dallas')
     );
-- Question 7
SELECT *
FROM  CUSTOMERS AS c1
WHERE discount IN
	(SELECT discount
     FROM   CUSTOMERS
     WHERE  city = 'Dallas'
     			OR
     		city = 'London'
     );

