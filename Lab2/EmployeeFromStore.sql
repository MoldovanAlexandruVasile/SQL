--All the employees that are working in the car store with ID 1 and sold a car

SELECT e.EName, e.EmployeeID
FROM Employee e
INNER JOIN Store s ON e.StoreID = s.StoreID
INNER JOIN EmployeeClient ec ON e.EmployeeID = ec.EmployeeID
WHERE s.StoreID = 1