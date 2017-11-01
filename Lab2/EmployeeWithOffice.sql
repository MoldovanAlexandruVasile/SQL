-- All the employees that have an office and have spoken with a client

SELECT DISTINCT e.EmployeeID, e.EName, o.OfficeID, f.FloorID
FROM Office o
INNER JOIN Floor f ON f.FloorID = o.FloorID
INNER JOIN Employee e ON e.EmployeeID = o.EmplyeeID
INNER JOIN EmployeeClient ec ON ec.EmployeeID = e.EmployeeID
WHERE o.FloorID = 1 OR o.FloorID = 2 OR o.FloorID = 3