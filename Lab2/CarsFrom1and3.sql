--All the cars with from the car shop with ID 1 and 3 that have a promotion

SELECT c.CarID, c.CarModel, c.Price, p.Procent, c.StoreID
FROM Car c
INNER JOIN Store s ON s.StoreID = c.StoreID
INNER JOIN PromoCar pc ON pc.CarID = c.CarID
INNER JOIN Promotion p ON pc.PromoID = p.PromoID
WHERE s.StoreID = 1 OR s.StoreID = 3