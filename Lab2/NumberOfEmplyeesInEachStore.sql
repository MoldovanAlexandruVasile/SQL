--Number of emplyees in store with id 1 that are born after 1995 and spoken with a client

SELECT COUNT(e.EmployeeID), s.StoreID
FROM Employee e
INNER JOIN Store s ON s.StoreID = e.StoreID
INNER JOIN EmployeeClient ec ON e.EmployeeID = ec.EmployeeID 
INNER JOIN Client c ON c.CNP = ec.CNP
WHERE s.StoreID = 1 OR s.StoreID = 2 OR s.StoreID = 3 AND e.Birthday >= '19950101'
GROUP BY s.StoreID