--All the cars with a number of models bigger than 1

SELECT COUNT(c.CarID), c.CarModel
FROM Car c
GROUP BY c.CarModel
HAVING COUNT(c.CarID) >= 2