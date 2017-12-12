CREATE VIEW View_3
AS
SELECT c.CarModel, COUNT(c.CarModel) AS CountCars
FROM Car c
INNER JOIN Store s ON c.StoreID = s.StoreID
GROUP BY c.CarModel