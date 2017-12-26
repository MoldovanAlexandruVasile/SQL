USE StoreDB
GO
CREATE PROCEDURE CRUD_PromoCar
			@NrOfRows INT
AS
BEGIN
	SET NOCOUNT ON;
	
	--CREATE = INSERT
	DECLARE @PromoID VARCHAR(50)
	SET @PromoID = (SELECT MIN(PromoID) FROM Promotion) 

	DECLARE @CarID INT
	SET @CarID = (SELECT MIN(CarID) FROM Car) 

	DECLARE @n INT
	SET @n = 1
	SET @NrOfRows = @NrOfRows + @n

	WHILE @n < @NrOfRows 
	BEGIN
		INSERT INTO PromoCar(CarID, PromoID) VALUES (@CarID, @PromoID)
		SET @n = @n+1
	END

	--READ = SELECT from Floor
	EXECUTE RunViewCRUDPromoCar

	--UPDATE
	SET @PromoID = (SELECT MAX(PromoID) FROM Promotion) 
	UPDATE PromoCar 
	SET PromoID = @PromoID
	WHERE CarID = @CarID

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDPromoCar

	-- DELETE 
	DELETE FROM PromoCar
	WHERE PromoID = @PromoID

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDPromoCar

	PRINT 'CRUD operations for table -> PromoCar.'

END