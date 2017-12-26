USE StoreDB
GO
CREATE PROCEDURE CRUD_Contract
			@NrOfRows INT
AS
BEGIN
	SET NOCOUNT ON;
	
	--CREATE = INSERT
	DECLARE @CNP VARCHAR(50)
	SELECT TOP 1 @CNP = CNP FROM Client

	DECLARE @CarID INT
	SET @CarID = (SELECT MIN(CarID) FROM Car) 

	DECLARE @n INT
	SET @n = 1

	SET @NrOfRows = @NrOfRows + @n
	WHILE @n < @NrOfRows 
	BEGIN
		INSERT INTO Contract(CNP, CarID) VALUES (@CNP, @CarID)
		SET @CarID = @CarID + 1
		SET @n = @n+1
	END

	--READ = SELECT from Floor
	EXECUTE RunViewCRUDContract

	--How many cars did @CNP client bought
	SELECT * FROM ContractF (@CNP)

	--UPDATE
	UPDATE Contract 
	SET CNP = '2671201260054'
	WHERE CarID = @CarID - 1

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDContract

	-- DELETE 
	DELETE FROM Contract
	WHERE CNP = @CNP

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDContract

	PRINT 'CRUD operations for table -> Contract.'

END