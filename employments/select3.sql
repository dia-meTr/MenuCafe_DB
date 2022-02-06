
CREATE VIEW Cocunt_langs AS SELECT FullName, COUNT(LanguagId) As lang FROM knowinglanguages
JOIN employment ON TabNumber = Employment
JOIN languag ON LanguagId = Languag
GROUP BY TabNumber;


SELECT FullName, lang
FROM cocunt_langs
WHERE lang =
(SELECT MAX(lang) FROM cocunt_langs)


