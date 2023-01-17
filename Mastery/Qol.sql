use master;
GO

-- alter database BRF set single_user with ROLLBACK IMMEDIATE;
-- drop database if exists BRF

-- create database BRF
-- go

use BRF
GO

drop table if exists RiskFactors
GO
drop table if exists Question
go
drop table if exists BreakOut
go
drop table if exists Location
GO
drop table if exists Income
go


create table Question (
    QuestionID int PRIMARY Key IDENTITY (1,1),
    Question VARCHAR (100) not null,
    Topic varchar (100) not null,
);
GO

Create table BreakOut (
    BreakOutID int PRIMARY KEY IDENTITY (1,1),
    BreakOut varchar (100),
    BreakOutCategory varchar (50),
    CONSTRAINT unq_BreakOut UNIQUE (BreakOut),
);
GO


Create table Location (
    LocationID int PRIMARY KEY IDENTITY (1,1),
    LocationAbbr VARCHAR(50) not null,
    Longitude DECIMAL (8,5) not null,
    Latitude DECIMAL (8,5) not null,
    Population2000 int null,
    Population2010 int null,
    [State] VARCHAR (100) not null,
    CONSTRAINT unq_Location UNIQUE (LocationAbbr, Longitude, Latitude),
);
GO

create table Income (
    IncomeID int PRIMARY Key IDENTITY (1,1),
    [State] varchar (100) not null,
    Income2000 int null,
    Income2007 int null,
    Income2008 int null,
    Income2009 int null,
    Income2010 int null,
);
GO

create table RiskFactors (
    RiskFactorID int PRIMARY KEY IDENTITY (1,1),
    [Year] int null,
    DataValueAverage decimal (3,1) null,
    DataValuePercentage decimal (3,1) null,
    SampleSize int,
    QuestionID int not null,
     BreakOutID int not null,
    LocationID int not null,
    IncomeID int not null,
    CONSTRAINT fk_Question_QuestionID FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
    CONSTRAINT fk_BreakOut_BreakOutID FOREIGN KEY (BreakOutID) REFERENCES BreakOut(BreakOutID),
    CONSTRAINT fk_Location_LocationID FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
    CONSTRAINT fk_Income_IncomeID FOREIGN KEY (IncomeID) REFERENCES Income(IncomeID)
);
go
