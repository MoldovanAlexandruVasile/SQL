USE StoreDB
GO

CREATE PROCEDURE TestInsert1
AS
BEGIN

	DECLARE @NrOfRows INT

	DECLARE @n INT
	SELECT @n = MAX(CarID) FROM Car
	SET @n = @n + 1

	DECLARE @cm VARCHAR(50)
	DECLARE @c VARCHAR(50)
	DECLARE @ec VARCHAR(50)
	DECLARE @hp VARCHAR(50)

	SELECT TOP 1 @NrOfRows = NrOfRows 
	FROM TestTables
	WHERE TableID = 1 AND TestID = 1

	SET @NrOfRows = @NrOfRows + @n


	WHILE @n < @NrOfRows
	BEGIN
		SET @cm = 'CarModel' + CONVERT(VARCHAR(3), @n)
		SET @c = 'Color' + CONVERT(VARCHAR(3), @n)
		SET @ec = 'EngineCapacity' + CONVERT(VARCHAR(3), @n)
		SET @hp = 'HorsePower' + CONVERT(VARCHAR(3), @n)

		INSERT INTO Car(CarID, CarModel, Price, Color, FabricationDate, EngineCapacity, HorsePower, StoreID) VALUES (@n, @cm, 2000, @c, '2010-12-12', @ec, @hp, 1)
		SET @n = @n + 1
	END

END