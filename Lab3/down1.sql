CREATE PROCEDURE down1
AS
BEGIN
	ALTER TABLE Floor
	ALTER COLUMN Capacity INT NOT NULL
	PRINT 'Changed the column type from BIGINT to INT for Capacity in Floor table'
END
