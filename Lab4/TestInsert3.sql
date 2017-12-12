USE StoreDB
GO

CREATE PROCEDURE TestInsert3
AS
BEGIN
	DECLARE @pk1 VARCHAR(50)
	SELECT TOP 1 @pk1 = CNP FROM Contract

	DECLARE @pk2 VARCHAR(50)
	SELECT TOP 1 @pk2 = CarID FROM Contract

	DECLARE @NrOfRows INT
	SELECT  @NrOfRows = NrOfRows 
	FROM TestTables
	WHERE TableID = 3 AND TestID = 1

	DECLARE @n INT
	SELECT @n = MAX(CarID) FROM Contract
	SET @n = @n + 1

	SET @NrOfRows = @NrOfRows + @n

	DECLARE @cnp VARCHAR(50)

	WHILE @n < @NrOfRows
	BEGIN
		SELECT TOP 1 @cnp = CNP FROM Client
		INSERT INTO Contract(CNP, CarID) VALUES (@cnp, @n)
		SET @n = @n + 1
	END
END