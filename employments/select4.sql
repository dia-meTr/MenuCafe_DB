
CREATE VIEW oldest AS SELECT TabNumber, FullName, BirthDate FROM employment
JOIN positionhistory ON Employment = TabNumber
WHERE BirthDate = 
(SELECT MIN(BirthDate) FROM employment
JOIN positionhistory ON Employment = TabNumber
);

SELECT * FROM oldest 
JOIN positionhistory ON Employment = TabNumber
WHERE FromDate = (SELECT MAX(FromDate) FROM oldest 
JOIN positionhistory ON Employment = TabNumber)