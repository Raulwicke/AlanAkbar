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


