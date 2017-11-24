CREATE PROCEDURE down4
AS
BEGIN
	ALTER TABLE StoreService
	DROP COLUMN Manager
	PRINT 'Dropped column Manager from StoreService table.'
END
