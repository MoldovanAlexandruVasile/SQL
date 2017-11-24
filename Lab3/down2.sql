CREATE PROCEDURE down2
AS
BEGIN
	ALTER TABLE Store
	DROP df_Store
	PRINT 'Dropped default constraint for StoreName in Store table.'
END
