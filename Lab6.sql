-- Question 1
SELECT c.name, c.city
FROM CUSTOMERS c
WHERE c.city IN(
    SELECT prime
    FROM ( 
        SELECT p1.city as prime 
    	FROM PRODUCTS p1, PRODUCTS p2
        WHERE p1.pid = p2.pid
        GROUP BY p1.city
        HAVING COUNT(p1.city) = (SELECT MAX(cityCount)
                                 FROM (
                                     SELECT COUNT(city) as cityCount
                                     FROM PRODUCTS
                                     GROUP BY city) as maxCityCount
                                 )
        ) as maxCity
    );

-- Question 2
SELECT p.name
FROM PRODUCTS p
WHERE p.priceUSD < (
    				SELECT avg(p.priceUSD)
    				FROM PRODUCTS p
					)
ORDER BY p.name DESC;

-- Question 3
SELECT c.name AS Name, o.pid AS PID, o.totalUSD AS Total
FROM ORDERS o INNER JOIN CUSTOMERS c on o.cid = c.cid
ORDER BY o.totalUSD ASC;

-- Question 4
SELECT c.name, COALESCE(SUM(o.qty),0) as TOTAL
FROM ORDERS o INNER JOIN CUSTOMERS c on o.cid = c.cid
GROUP BY c.name, c.city
ORDER BY c.name;

-- Question 5
SELECT c.name, p.name, a.name
FROM ORDERS o INNER JOIN CUSTOMERS c on o.cid = c.cid
			  INNER JOIN AGENTS    a on o.aid = a.aid
              INNER JOIN PRODUCTS  p on o.pid = p.pid
WHERE a.city = 'New York';

-- Question 6
SELECT (p.priceUSD * o.qty *(1-(c.discount/100))) as calc_Total, o.totalUSD, o.qty, p.priceUSD, c.discount
FROM ORDERS o INNER JOIN CUSTOMERS c on o.cid = c.cid
			  INNER JOIN PRODUCTS  p on o.pid = p.pid
WHERE(p.priceUSD * o.qty *(1-(c.discount/100))) != o.totalUSD;

-- Question 7

              