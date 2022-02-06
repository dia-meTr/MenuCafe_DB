USE ekz;

SELECT SubdivisionName, COUNT(LanguagId) As eng FROM knowinglanguages
JOIN employment ON TabNumber = Employment
JOIN languag ON LanguagId = Languag
JOIN subdivision ON Subdivision = SubdivisionId
WHERE LanguageName = 'English'
GROUP BY Subdivision
HAVING eng > 5



