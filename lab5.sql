-- Question 1
SELECT a.city
FROM Orders o, Agents a, Customers c, Products p
WHERE (o.aid = a.aid)
	and (o.pid = p.pid)
    and (o.cid = c.cid)
    and (c.cid = 'c006');
    
-- Question 2
SELECT DISTINCT p.pid
FROM Orders o, Agents a, Customers c, Products p
WHERE (o.aid = a.aid)
	and (o.pid = p.pid)
    and (o.cid = c.cid)
	and (c.city = 'Kyoto');

-- Question 3
SELECT c.name
FROM CUSTOMERS c
WHERE c.cid NOT IN(
    SELECT o.cid
    FROM ORDERS o);

-- Question 4
SELECT  *
FROM  Customers c
LEFT OUTER JOIN ORDERS o 
		on o.cid = c.cid;

-- Question 5
SELECT DISTINCT c.name, a.name
FROM Orders o, Agents a, Customers c, Products p
WHERE (o.aid = a.aid)
	and (o.pid = p.pid)
    and (o.cid = c.cid)
    and (c.city = a.city);

-- Question 6
SELECT DISTINCT c.name, a.name,  c.city, a.city
FROM Orders o, Agents a, Customers c, Products p
WHERE c.city = a.city;

-- Question 7





