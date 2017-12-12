CREATE VIEW View_2
AS
SELECT e.EName, e.EmployeeID
FROM Employee e
INNER JOIN Store s ON e.StoreID = s.StoreID
INNER JOIN EmployeeClient ec ON e.EmployeeID = ec.EmployeeID
WHERE s.StoreID = 1