USE menu;

USE menu;
SELECT sum(PortionsNum) As ProductNum, Provider
FROM menuforweek 
JOIN days ON DayId = IdDay
JOIN recipes ON recipes.DishId = menuforweek.DishId
JOIN products ON IdProduct=ProductId
group by Provider
order by ProductNum DESC
LIMIT 1;