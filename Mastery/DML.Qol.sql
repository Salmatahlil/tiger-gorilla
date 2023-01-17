use BRF
go

-- select * from CDC
-- select * from Question
-- Select * from RiskFactors
-- select * from TotalStatePopulation
-- select * from CDC
-- select * from PerCapitaIncome

insert into Question (Question, Topic)
select distinct Question, Topic 
from CDC

insert into BreakOut (Breakout, BreakOutCategory)
select distinct BreakOut, BreakoutCategory
from CDC

insert into Location (LocationAbbr, Longitude, Latitude, Population2000, Population2010, [State])
select distinct C.LocationAbbr, C.Longitude, C.Latitude, T.Population2000, T.Population2010, C.[State]
from CDC C
join TotalStatePopulation T on C.LocationAbbr = T.[State]

insert into Income ([State],Income2000, Income2007, Income2008, Income2009, Income2010)
select distinct State, Income2000, Income2007, Income2008, Income2009, Income2010
from PerCapitaIncome


insert into RiskFactors ([Year], DataValueAverage, DataValuePercentage, SampleSize, QuestionID, BreakOutID, LocationID, IncomeID)
select [Year], DataValueAverage, DataValuePercentage, Sample_Size, Q.QuestionID, B.BreakOutID, L.LocationID, I.IncomeID
from CDC as C
join Question Q on C.Question = Q.Question
join BreakOut B on C.Breakout = B.BreakOut
join Location L on C.State = L.[State]
Join Income I on C.State = I.[State]


