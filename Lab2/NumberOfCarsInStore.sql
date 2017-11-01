--The number of cars of each type from store ID 1

SELECT COUNT(CarID), CarModel
FROM Car c
INNER JOIN Store s ON s.StoreID = c.StoreID
WHERE s.StoreID = 1
GROUP BY CarModel;