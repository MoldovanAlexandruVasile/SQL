CREATE PROCEDURE up4
AS
BEGIN
	ALTER TABLE StoreService
	ADD Manager VARCHAR(50)
	PRINT 'Added the column Manager for the StoreService table.'
END
