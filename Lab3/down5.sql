CREATE PROCEDURE down5
AS
BEGIN
	ALTER TABLE StoreService
	DROP CONSTRAINT fk_StoreService
	PRINT 'Dropped the foreign key constraint from StoreService table.'
END
GO
