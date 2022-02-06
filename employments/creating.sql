CREATE DATABASE IF NOT EXISTS Ekz;

USE Ekz;

CREATE TABLE IF NOT EXISTS Languag
(
	LanguagId INT PRIMARY KEY AUTO_INCREMENT,
    LanguageName Varchar(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS Positio
(
	PositioId INT PRIMARY KEY AUTO_INCREMENT,
    PositionName Varchar(256) NOT NULL,
    Salary FLOAT NOT NULL,
    Premium FLOAT
);

CREATE TABLE IF NOT EXISTS Subdivision
(
	SubdivisionId INT PRIMARY KEY AUTO_INCREMENT,
    SubdivisionName Varchar(256) NOT NULL,
    Leader Varchar(256)
);

CREATE TABLE IF NOT EXISTS Employment
(
	TabNumber INT PRIMARY KEY AUTO_INCREMENT,
    FullName Varchar(256) NOT NULL,
    Adress  Varchar(256),
    BirthDate DATE,
    PassportNum Varchar(256),
    FamilyInf Varchar(256),
    University Varchar(256),
    DateEnding DATE,
    Specialty  Varchar(256),
    TypeDegree Varchar(256),
    Qualification Varchar(256),
    Subdivision INT NOT NULL,
    CONSTRAINT isAdress CHECK(Adress != ''),
    FOREIGN KEY (Subdivision)  REFERENCES Subdivision (SubdivisionId) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS KnowingLanguages
(
	Employment INT NOT NULL,
    Languag INT NOT NULL,
    FOREIGN KEY (Employment)  REFERENCES Employment (TabNumber) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Languag)  REFERENCES Languag (LanguagId) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PositionHistory
(
	Employment INT NOT NULL,
    Positio INT NOT NULL,
    FromDate DATE,
    ToDate Date,
    FOREIGN KEY (Employment)  REFERENCES Employment (TabNumber) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Positio)  REFERENCES Positio (PositioId) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Vacation
(
	VacationId INT PRIMARY KEY AUTO_INCREMENT,
    Employment INT NOT NULL,
    StartDate Date,
    DaysNum INT NOT NULL DEFAULT 24,
    FOREIGN KEY (Employment)  REFERENCES Employment (TabNumber) ON UPDATE CASCADE ON DELETE CASCADE
)



