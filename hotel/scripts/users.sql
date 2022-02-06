DROP USER IF EXISTS 'Admin'@'localhost';
CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON hotels3.* TO 'Admin'@'localhost';

DROP USER IF EXISTS 'Receptionist'@'localhost';
CREATE USER 'Receptionist'@'localhost' IDENTIFIED BY 'receptionist123';
GRANT INSERT ON hotels3.booking TO 'Receptionist'@'localhost';
GRANT INSERT ON hotels3.provisionofservises TO 'Receptionist'@'localhost';
GRANT SELECT ON hotels3.roomer TO 'Receptionist'@'localhost';
GRANT SELECT ON hotels3.servicesbill TO 'Receptionist'@'localhost';