--All the cars with a bigger price than 9999 from store with ID 1,2 or 3 that was sold

SELECT c.CarID, c.CarModel, c.Price, c.StoreID
FROM Car c
INNER JOIN Store s ON  c.Price >= 10000  and s.StoreID = c.StoreID
INNER JOIN Contract ct ON ct.CarID = c.CarID
WHERE s.StoreID = 1 OR s.StoreID = 2 OR s.StoreID = 3