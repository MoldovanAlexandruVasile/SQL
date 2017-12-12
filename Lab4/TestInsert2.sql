USE StoreDB
GO

CREATE PROCEDURE TestInsert2
AS
BEGIN
	DECLARE @fk INT
	SELECT TOP 1 @fk = FloorID FROM Office

	DECLARE @NrOfRows INT
	SELECT  @NrOfRows = NrOfRows 
	FROM TestTables
	WHERE TableID = 2 AND TestID = 1

	DECLARE @n INT
	SELECT @n = MAX(OfficeID) FROM Office
	SET @n = @n + 1

	SET @NrOfRows = @NrOfRows + @n

	DECLARE @sid INT
	DECLARE @eid INT
	SET @eid = 500
	DECLARE @fid INT

	WHILE @n < @NrOfRows
	BEGIN
		INSERT INTO Office(OfficeID, StoreID, EmplyeeID, FloorID) VALUES (@n, 1, @eid, 3)
		SET @eid = @eid + 1
		SET @n = @n + 1
	END
END