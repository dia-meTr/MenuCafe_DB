USE menu;

SELECT sum(PortionsNum), ProductName,
CASE
	WHEN sum(PortionsNum) >0
    THEN 'need'
    ELSE "don't need"
END AS ToBuy
FROM menuforweek 
JOIN days ON DayId = IdDay
JOIN recipes ON recipes.DishId = menuforweek.DishId
JOIN products ON IdProduct=ProductId
WHERE ProductName='Product1'