-- Question 1
SELECT DISTINCT city 
FROM Agents 
WHERE aid IN(
        SELECT aid  
    	FROM Orders
        WHERE cid = 'c002');

-- Question 2

-- Question 3




