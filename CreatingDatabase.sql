CREATE DATABASE IF NOT EXISTS Menu;

USE Menu;

CREATE TABLE IF NOT EXISTS Dishes
(
	IdDish INT PRIMARY KEY AUTO_INCREMENT,
    DishName TEXT NOT NULL,
    ProductAmount INT
);

CREATE TABLE IF NOT EXISTS Products
(
	IdProduct INT PRIMARY KEY,
    ProductName TEXT NOT NULL,
    Provider TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Recipes
(
	DishId INT NOT NULL,
    ProductId INT NOT NULL,
    ProductWeight FLOAT,
    FOREIGN KEY (DishId)  REFERENCES Dishes (IdDish) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ProductId)  REFERENCES Products (IdProduct) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Days
(
	IdDay INT PRIMARY KEY AUTO_INCREMENT,
    DayName TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS MenuForWeek
(
	DayId  INT NOT NULL,
    DishId  INT NOT NULL,
    PortionsNum INT NOT NULL CHECK(PortionsNum > 0),
    FOREIGN KEY (DayId)  REFERENCES Days (IdDay) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (DishId)  REFERENCES Dishes (IdDish) ON UPDATE CASCADE ON DELETE CASCADE
)


