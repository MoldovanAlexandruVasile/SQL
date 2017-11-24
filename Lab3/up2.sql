CREATE PROCEDURE up2
AS
BEGIN
	ALTER TABLE Store
	ADD CONSTRAINT df_Store DEFAULT 'WithoutName' FOR StoreName
	PRINT 'Added default constraint "WithoutName" for StoreName in Store table.'
END
