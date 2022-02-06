USE menu;

SELECT sum(PortionsNum), ProductName
FROM menuforweek 
JOIN days ON DayId = IdDay
JOIN recipes ON recipes.DishId = menuforweek.DishId
JOIN products ON IdProduct=ProductId
WHERE ProductName='Product1'