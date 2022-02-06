DROP PROCEDURE IF EXISTS deside_season;
DELIMITER $$
CREATE PROCEDURE deside_season(IN arrival_date DATE, OUT season_ INT)
BEGIN
		DECLARE month_ INT;
        SET month_ = MONTH(arrival_date);
        IF month_>=3 AND month_<=5 THEN SET season_=2;
        ELSE IF month_>=6 AND month_<=8 THEN SET season_=3;
        ELSE IF month_>=9 AND month_<=11 THEN SET season_=4;
        ELSE SET season_=1;
        END IF;
        END IF;
        END IF;
END$$

