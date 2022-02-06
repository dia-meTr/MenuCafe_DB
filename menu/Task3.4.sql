USE menu;

SELECT count(DishName), DishName, 
CASE
	WHEN count(DishName)>1
		THEN 'повторюється'
    ELSE 'не повторюється'
END AS res
FROM menuforweek
JOIN days ON DayId=IdDay
JOIN dishes ON IdDish=DishId
group by DishName