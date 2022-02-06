USE hotels;

# В якій кімнаті живе/проживала/проживатиме конкретна людина?
SELECT RoomNumber, Floor, FullName
FROM room 
JOIN booking ON Room = RoomId
JOIN roomer ON RoomerId = Roomer
WHERE FullName = 'Quinn Flores';

# 2) Всі кімнати такого типу
SELECT RoomNumber, Floor, RoomTypeName, HotelName 
FROM room
JOIN roomtype ON RoomType = RoomTypeId
JOIN hotelbranch ON HotelBranchId = HotelBranch
WHERE RoomTypeName = 'semper';

# 3) Ціна на кімнату конкретного типу в конкретну пору в конкретному готелі
SELECT RoomTypeName, HotelName, Price, SeasonName 
FROM price
JOIN roomtype ON price.RoomType = RoomTypeId
JOIN hotelbranch ON HotelBranchId = price.HotelBranch
JOIN season ON SeasonId = Season
WHERE RoomTypeName = 'semper' AND HotelName = 'Zeus Hotel' AND  SeasonName = 'Winter';

# 4) Найдешевша кімната в цьому готелі 
SELECT HotelName, MIN(Price), RoomType, SeasonName 
FROM price 
JOIN hotelbranch ON HotelBranchId = HotelBranch 
JOIN roomtype ON RoomTypeId = RoomType 
JOIN season ON SeasonId = Season 
WHERE HotelName = 'Zeus Hotel';

# 5) Найдешевший тип кімнати в цей час в цьому готелі
SELECT hotelbranch, MIN(Price), RoomType, SeasonName
FROM price 
JOIN hotelbranch ON HotelBranchId = HotelBranch 
JOIN roomtype ON RoomTypeId = RoomType 
JOIN season ON SeasonId = Season 
WHERE HotelName = 'Zeus Hotel';

# 6) Всі номери кімнат такого типу в цьому готелі
SELECT RoomNumber, Floor, HotelName, RoomTypeName 
FROM room 
JOIN roomtype ON RoomTypeId = RoomType 
JOIN hotelbranch ON HotelBranchId = HotelBranch 
WHERE HotelName = 'Padlockurity Hotel' AND RoomTypeName = 'eros';

# 7) Всі типи кімнат у цьому готелі
SELECT RoomNumber, HotelName, RoomTypeName 
FROM room 
JOIN roomtype ON RoomTypeId = RoomType 
JOIN hotelbranch ON HotelBranchId = HotelBranch 
WHERE HotelName = 'Padlockurity Hotel';

# 8) Середні ціни за номер у всіх готелях
SELECT AVG(Price) AS avarage_price, 
(SELECT HotelName FROM hotelbranch WHERE HotelBranch = HotelBranchId) As HotelBranch 
FROM price group by HotelBranch;

# 9) Всі хто живуть в готелі в конкретний час 
SELECT RoomNumber, DepartureDate, FullName 
FROM booking 
JOIN room ON Room = RoomId 
JOIN roomer ON Roomer = RoomerId 
JOIN hotelbranch ON HotelBranchId = HotelBranch 
WHERE HotelName='Hercules Hotel' AND DepartureDate>='2021-11-01' AND DateOfArrival<='2021-11-01';

# 10) Всі хто живуть у цьому готелі на конкретному поверсі на даний момент
SELECT FullName, RoomNumber, HotelName, DateofArrival, DepartureDate, Floor
FROM booking 
JOIN room ON Room = RoomId 
JOIN roomer ON Roomer = RoomerId
JOIN hotelbranch ON HotelBranchId = HotelBranch 
WHERE Floor=1 AND HotelName='Hercules Hotel' AND DepartureDate>='2021-11-01' AND DateofArrival<='2021-11-01';

#  11)  Хто проживає в кімнаті в конкретну дату
SELECT FullName, RoomNumber, Floor, HotelName
FROM booking 
JOIN room ON Room = RoomId 
JOIN roomer ON Roomer = RoomerId 
JOIN hotelbranch ON HotelBranchId = HotelBranch 
WHERE RoomNumber=3 AND DateofArrival<='2021-11-11';

# 12) Усі вільні кімнати на конкретну дату
SELECT RoomId, RoomNumber,HotelName, Floor 
FROM room
JOIN hotelbranch ON HotelBranchId = HotelBranch 
WHERE HotelName = 'Hercules Hotel' AND RoomId NOT IN 
(SELECT Room FROM booking WHERE DepartureDate>='2021-11-01' AND DateofArrival<='2021-11-01');

# 13) Усі вільні номери в конкретному готелі
SELECT * 
FROM room 
WHERE RoomId NOT IN (SELECT Room FROM booking WHERE DepartureDate>='2021-11-01' AND DateofArrival<='2021-11-01');

# 14) Усі вільні кімнати конкретного типу в цьому готелі 
SELECT RoomTypeName, RoomNumber, Floor, RoomTypeName, HotelName
FROM room
JOIN hotelbranch ON HotelBranchId = HotelBranch 
JOIN roomtype ON RoomTypeId = RoomType 
WHERE HotelName = 'Hercules Hotel' 
AND RoomTypeName = 'a' 
AND RoomId NOT IN 
(SELECT Room FROM booking WHERE DepartureDate>='2021-11-01' AND DateofArrival<='2021-11-01');

# 15) Усі вільні кімнати у готелях конкретного міста
SELECT RoomId, RoomNumber, Floor, RoomTypeName, HotelName, City 
FROM room 
JOIN hotelbranch ON HotelBranchId = HotelBranch 
JOIN roomtype ON RoomTypeId = RoomType 
WHERE City = 'Odessa' 
AND RoomId NOT IN 
(SELECT Room FROM booking  WHERE DepartureDate >= '2021-11-01' AND DateofArrival <= '2021-11-01');

# 16) Всі додаткові послуги, які надали людині
SELECT FullName, NameofService, ProvisionDate 
FROM provisionofservises 
JOIN servicesbill ON ServicesBillId = ServicesBill 
JOIN roomer ON roomer.RoomerId = servicesbill.RoomerId 
JOIN typeofservice ON TypeofServiceId = provisionofservises.ServicesBill 
WHERE FullName = 'Lara Fletcher';

# 17) Яким клієнтам була надана ця послуга
SELECT FullName, NameofService, ProvisionDate
FROM provisionofservises 
JOIN servicesbill ON ServicesBillId = ServicesBill 
JOIN roomer ON roomer.RoomerId = servicesbill.RoomerId 
JOIN typeofservice ON TypeofServiceId = TypeOfService 
WHERE NameofService = 'sem';

# 18) Яка кімната заброньована на цю людину
SELECT FullName, PhoneNumber, DateOfArrival, DepartureDate, RoomNumber, RoomType, Floor 
FROM booking 
JOIN roomer ON RoomerId = Roomer 
JOIN room ON RoomId = Room 
WHERE FullName = 'Jeremy Matthews' AND DateofArrival = '2021-11-09';

# 19) Скільки має заплатити конкретна людина за проживання
SELECT Total, FullName 
FROM acomodationbill 
JOIN booking ON Booking = BookingId 
JOIN roomer ON RoomerId = Roomer 
WHERE FullName = 'Jeremy Matthews';

# 20) Скільки має заплатити конкретна людина за додаткові послуги
SELECT Total, FullName 
FROM servicesbill 
JOIN roomer ON roomer.RoomerId = servicesbill.RoomerId 
WHERE FullName = 'Jeremy Matthews';
