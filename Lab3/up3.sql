CREATE PROCEDURE up3
AS
BEGIN
	CREATE TABLE StoreService
	(
	StoreServiceID INT PRIMARY KEY,
	SSLocation VARCHAR(50) NOT NULL
	)
	PRINT 'Created table StoreService.'
END