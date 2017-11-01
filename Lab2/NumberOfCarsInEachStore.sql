-- Stores with a number of cars bigger than 3

SELECT COUNT(CarID), StoreID
FROM Car
GROUP BY StoreID
HAVING COUNT(CarID) >= 3