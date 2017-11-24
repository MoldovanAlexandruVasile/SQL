CREATE PROCEDURE up1
AS
BEGIN
	ALTER TABLE Floor
	ALTER COLUMN Capacity BIGINT NOT NULL
	PRINT 'Changed the column type from INT to BIGINT for Capacity from Floor table.'
END