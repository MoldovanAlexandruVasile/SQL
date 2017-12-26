USE StoreDB
GO
CREATE PROCEDURE CRUD_EmployeeClient
			@NrOfRows INT
AS
BEGIN
		
	--CREATE = INSERT
	DECLARE @CNP VARCHAR(50)
	SELECT TOP 1 @CNP = CNP FROM Client

	DECLARE @EmployeeID INT
	SET @EmployeeID = (SELECT MIN(EmployeeID) FROM Employee)

	DECLARE @n INT
	SET @n = 1
	SET @NrOfRows = @NrOfRows + @n

	WHILE @n < @NrOfRows 
	BEGIN
		INSERT INTO EmployeeClient(CNP, EmployeeID) VALUES (@CNP, @EmployeeID)
		SET @n = @n+1
		SET @EmployeeID = @EmployeeID + 1
	END

	--READ = SELECT from Floor
	EXECUTE RunViewCRUDEmployeeClient

	--UPDATE
	UPDATE EmployeeClient 
	SET CNP = @CNP
	WHERE EmployeeID = 19

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDEmployeeClient

	-- DELETE 
	DELETE FROM EmployeeClient
	WHERE CNP = @CNP

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDEmployeeClient

	PRINT 'CRUD operations for table -> EmployeeClient.'

END