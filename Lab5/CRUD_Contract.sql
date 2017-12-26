USE StoreDB
GO
CREATE PROCEDURE CRUD_Contract
			@NrOfRows INT
AS
BEGIN
	SET NOCOUNT ON;
	
	--CREATE = INSERT
	DECLARE @CNP VARCHAR(50)
	SELECT TOP 1 @CNP = CNP FROM Contract

	DECLARE @CarID INT
	SET @CarID = (SELECT MAX(CarID) FROM Car) 

	DECLARE @n INT
	SET @n = 1

	SET @NrOfRows = @NrOfRows + @n
	WHILE @n <=  @NrOfRows 
	BEGIN
		INSERT INTO Contract(CNP, CarID) VALUES (@CNP, @CarID)
		SET @n = @n+1
	END

	--READ = SELECT from Floor
	EXECUTE RunViewCRUDContract

	--UPDATE
	SET @CarID = (SELECT MIN(CarID) FROM Car) 
	UPDATE Contract 
	SET CarID = @CarID
	WHERE CNP = @CNP

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDContract

	-- DELETE 
	DELETE FROM Contract
	WHERE CNP = @CNP

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDContract

	PRINT 'CRUD operations for table -> Contract.'

END