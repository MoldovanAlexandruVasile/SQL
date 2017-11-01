--All the clients that have bought a car after they spoke with an employee

SELECT DISTINCT c.CNP, c.CName
FROM Client c
INNER JOIN EmployeeClient ec ON c.CNP = ec.CNP
INNER JOIN Employee e ON e.EmployeeID = ec.EmployeeID
INNER JOIN Contract co ON c.CNP = co.CNP 