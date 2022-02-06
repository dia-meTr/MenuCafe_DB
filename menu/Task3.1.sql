USE Menu;

SELECT ProductName, Provider 
From products 
WHERE IdProduct IN (SELECT ProductId FROM recipes 
    WHERE DishId IN (SELECT DishId FROM menuforweek 
		WHERE DayID IN (SELECT IdDay FROM days 
			WHERE days.DayName='Tuesday')))
ORDER BY Provider;
