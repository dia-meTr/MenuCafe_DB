DROP FUNCTION IF EXISTS count_total_services;
DELIMITER $$
CREATE FUNCTION count_total_services(id INT)
RETURNS FLOAT
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE price_ FLOAT;
	SELECT SUM(Price) INTO price_ 
    From provisionofservises
	JOIN typeofservice ON TypeOfServiceId = TypeOfService
	WHERE ServicesBill = id;
	RETURN price_;
END$$

DROP FUNCTION IF EXISTS count_total_acomodation;
DELIMITER $$
CREATE FUNCTION count_total_acomodation(room_id INT, day_arr DATE, day_dep DATE)
RETURNS FLOAT
READS SQL DATA
DETERMINISTIC
BEGIN
	DECLARE price_ float;
    DECLARE season_ INT;
    CALL deside_season(day_arr, season_);
    
    SELECT Price INTO price_
    FROM Price
    LEFT OUTER JOIN roomtype ON roomtype.RoomTypeId = Price.RoomType
    LEFT OUTER JOIN room 
    ON room.RoomType = roomtype.RoomTypeId 
    AND room.HotelBranch = price.HotelBranch 
    WHERE room.RoomId = room_id AND Price.Season = season_;
    
    RETURN price_ * DATEDIFF(day_dep, day_arr);
END$$
