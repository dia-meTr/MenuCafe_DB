CREATE OR REPLACE VIEW AcomodationBills 
AS SELECT FullName, PhoneNumber, Total 
FROM acomodationbill 
JOIN booking ON Booking = BookingId 
JOIN roomer ON RoomerId = Roomer; 

SELECT * FROM acomodationbills;

CREATE OR REPLACE VIEW ServicesBills 
As SELECT FullName, PhoneNumber, Total 
FROM servicesbill 
JOIN roomer ON roomer.RoomerId = servicesbill.RoomerId; 

SELECT * FROM ServicesBills;