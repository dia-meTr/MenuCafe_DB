USE hotels5;

DROP TRIGGER IF EXISTS AddBill;
DELIMITER |
CREATE TRIGGER AddBill 
AFTER INSERT ON roomer
	FOR EACH ROW 
    INSERT INTO servicesbill(RoomerId, Total) 
    VALUE
		(NEW.RoomerId, 0);

DROP TRIGGER IF EXISTS UpdateBill;
DELIMITER |
CREATE TRIGGER UpdateBill 
AFTER INSERT ON provisionofservises
	FOR EACH ROW BEGIN
    UPDATE servicesbill
    SET total = count_total_services(NEW.ServicesBill)
    WHERE ServicesBillId = NEW.ServicesBill;
END |;

DROP TRIGGER IF EXISTS AddAcomodation;
DELIMITER |
CREATE TRIGGER AddAcomodation
AFTER INSERT ON booking
	FOR EACH ROW 
    INSERT INTO acomodationbill(Booking, Total) 
    VALUE
		(NEW.BookingId, count_total_acomodation(NEW.Room, NEW.DateOfArrival, NEW.DepartureDate));
