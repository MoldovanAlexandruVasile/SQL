CREATE TABLE Tables
(
	TableID INT PRIMARY KEY,
	Name VARCHAR(50)
)

CREATE TABLE Tests
(
	TestID INT PRIMARY KEY,
	Name VARCHAR(50) 
)

CREATE TABLE TestTables
(
	TableID INT FOREIGN KEY REFERENCES Tables(TableID),
	TestID INT FOREIGN KEY REFERENCES Tests(TestID),
	NrOfROws INT,
	Position INT,
	CONSTRAINT PK_TableTests PRIMARY KEY (TableID, TestID)
)

CREATE TABLE Views
(
	ViewID INT PRIMARY KEY,
	Name VARCHAR(50),
)

CREATE TABLE TestViews
(
	ViewID INT FOREIGN KEY REFERENCES Views(ViewID),
	TestID INT FOREIGN KEY REFERENCES Tests(TestID),
	CONSTRAINT PK_TestsViews PRIMARY KEY (ViewID, TestID)
)

CREATE TABLE TestRuns
(
	TestRunID INT PRIMARY KEY ,
	Description VARCHAR(50),
	StartAt DATE,
	EndAt DATE
)

CREATE TABLE TestRunViews
(
	TestRunID INT FOREIGN KEY REFERENCES TestRuns(TestRunID),
	ViewID INT FOREIGN KEY REFERENCES  Views(ViewID),
	StartAT DATE,
	EndAt DATE
	CONSTRAINT PK_TestRunViews PRIMARY KEY (TestRunID, ViewID)
)

CREATE TABLE TestRunTables
(
	TestRunID INT FOREIGN KEY REFERENCES TestRuns(TestRunID),
	TableID INT FOREIGN KEY REFERENCES Tables(TableID),
	StartAT DATE,
	EndAt DATE
	CONSTRAINT PK_TestRunTables PRIMARY KEY (TestRunID, TableID)
)