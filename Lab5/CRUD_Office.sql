USE StoreDB
GO
CREATE PROCEDURE CRUD_Office
			@NrOfRows INT
AS
BEGIN
	SET NOCOUNT ON;
	
	--CREATE = INSERT
	DECLARE @n INT
	SET @n = 0
	SELECT @n = MAX(OfficeID) FROM Office
	SET @n = @n + 1

	DECLARE @StoreID INT
	DECLARE @EmployeeID INT
	DECLARE @FloorID INT

	SET @StoreID = (SELECT MIN(StoreID) FROM Store)
	SET @EmployeeID = (SELECT MAX(EmployeeID) FROM Employee)
	SET @FloorID = (SELECT MIN(FloorID) FROM Floor)

	SET @NrOfRows = @NrOfRows + @n
	WHILE @n < @NrOfRows 
	BEGIN
		INSERT INTO Office(OfficeID, StoreID, EmplyeeID, FloorID) VALUES (@n, @StoreID, @EmployeeID, @FloorID) 
		SET @n=@n+1
	END

	--READ = SELECT from Floor
	EXECUTE RunViewCRUDOffice

	--UPDATE
	UPDATE Office 
	SET EmplyeeID = @EmployeeID 
	WHERE FloorID = 1

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDOffice

	-- DELETE 
	DELETE FROM Office
	WHERE FloorID = 1

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDOffice

	PRINT 'CRUD operations for table -> Office.'

END