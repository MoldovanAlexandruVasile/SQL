-- All the sold cars that had a promotion

SELECT DISTINCT c.CarID, c.CarModel, p.Procent, p.AvailabilityDate, cl.CName
FROM Car c
INNER JOIN PromoCar pc ON pc.CarID = c.CarID
INNER JOIN Contract co ON c.CarID = co.CarID 
INNER JOIN Promotion p ON p.PromoID = pc.PromoID
INNER JOIN Client cl ON cl.CNP = co.CNP