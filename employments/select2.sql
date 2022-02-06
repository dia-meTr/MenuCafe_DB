
CREATE VIEW koef AS SELECT SubdivisionName, COUNT(TabNumber) AS peop, SUM(DaysNum) AS days FROM Subdivision
JOIN employment ON Subdivision = SubdivisionId
JOIN vacation ON Employment = TabNumber
GROUP BY SubdivisionId;

SELECT *, peop/days FROM koef;