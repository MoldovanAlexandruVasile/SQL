USE StoreDB
GO
CREATE PROCEDURE CRUD_Floor
			@Capacity INT,
			@NrOfRows INT
AS
BEGIN
	
	--CREATE = INSERT
	DECLARE @n INT
	SET @n = 0
	SELECT @n = MAX(FloorID) FROM Floor
	SET @n = @n + 1

	SET @NrOfRows = @NrOfRows + @n
	WHILE @n < @NrOfRows 
	BEGIN
		INSERT INTO Floor(FloorID, Capacity) VALUES (@n, @Capacity) 
		SET @n=@n+1
	END

	--READ = SELECT from Floor
	EXECUTE RunViewCRUDFloor

	--UPDATE
	UPDATE Floor 
	SET Capacity = 50 
	WHERE FloorID = 1

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDFloor

	-- DELETE 
	DELETE 
	FROM Office
	WHERE FloorID = 1
	DELETE FROM Floor 
	WHERE Capacity = 50 

	--PRINT AGAIN THE CHANGES
	EXECUTE RunViewCRUDFloor

	PRINT 'CRUD operations for table -> Floor.'

END