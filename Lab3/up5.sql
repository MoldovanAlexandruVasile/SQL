CREATE PROCEDURE up5
AS
BEGIN
	ALTER TABLE StoreService
	ADD CONSTRAINT fk_StoreService FOREIGN KEY(Manager) REFERENCES Employee(EName)
	PRINT 'Foreign Key constraint added for table StoreService, column Manager'
END
