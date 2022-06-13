--Creating database Telefonica
CREATE DATABASE Telefonica;

--Opening 'Telefonica' database
USE Telefonica;

--Creating 'ROL' table
CREATE TABLE Rol(
	Id_Rol INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Rol_Name VARCHAR(10) NOT NULL
);

--Creating 'USERS' table
CREATE TABLE Users(
	Id_User INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	UserName VARCHAR(10) NOT NULL,
	Pass_Word VARCHAR(50) NOT NULL,
	Avatar VARCHAR(500) NOT NULL,
	Biography VARCHAR(100) NOT NULL,
	Id_Rol INT NOT NULL,
	FOREIGN KEY (Id_Rol) REFERENCES Rol(Id_Rol)
);

--Creating 'Plan' table
CREATE TABLE Celphone_Plan(
	Celphone_Plan INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Name_Plan VARCHAR(50) NOT NULL,
	Price FLOAT NOT NULL,
);

--Creating 'Customers' table
CREATE TABLE Customers(
	Id_Customer INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Complete_Name VARCHAR(100) NOT NULL,
	Contract_Date DATETIME NOT NULL,
	Address_Customer VARCHAR(100) NOT NULL,
	Id_Celphone_Plan INT NOT NULL,
	FOREIGN KEY (Id_Celphone_Plan) REFERENCES Celphone_Plan (Celphone_Plan)
);

--Creating 'Address' table
CREATE TABLE Address_Customer(
	Id_Address INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Address_Customer VARCHAR(100) NOT NULL,
	Id_Customer INT NOT NULL
	FOREIGN KEY (Id_Customer) REFERENCES Customers (Id_Customer)
);

--Creating 'Identity_Type' table
CREATE TABLE Identity_Type(
	Id_Type INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Identity_Name VARCHAR(10) NOT NULL
);

--Creating 'Identification' table
CREATE TABLE Identification_Customer(
	Id_Identity INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Number VARCHAR(30) NOT NULL,
	Id_Type INT NOT NULL,
	Id_Customer INT NOT NULL
	FOREIGN KEY (Id_Customer) REFERENCES Customers (Id_Customer),
	FOREIGN KEY (Id_Type) REFERENCES Identity_Type(Id_Type)
);

--Creating 'Audit_Log' table
CREATE TABLE Audit_Log(
	Id_Log INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Action VARCHAR(30) NOT NULL,
	Date_Log DATETIME NOT NULL,
	Id_User INT NOT NULL,
	Id_Customer INT NOT NULL,
	FOREIGN KEY (Id_User) REFERENCES USERS(Id_User),
	FOREIGN KEY (Id_Customer) REFERENCES Customers(Id_Customer)
);
--=============================================================================================================================================================
-- Adding Celphone_Plan data
INSERT INTO Celphone_Plan VALUES ('Unlimited',30.50),('Hostpot',25.50),('Premium',20.50),('Basic',16.50);
SELECT * FROM Celphone_Plan;

-- Adding Identity_Type data
INSERT INTO Identity_Type VALUES('DUI'),('AFP'),('ISSS'),('NIT');
SELECT * FROM Identity_Type;

-- Adding Customers data
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Hort Bootyman', '2021-11-30 10:14:28', '23237 Summerview Road', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Con Asch', '2021-07-14 10:38:19', '0 Meadow Vale Alley', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Freddi MacRirie', '2021-10-30 18:53:48', '4 Arrowood Pass', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Wyndham Layland', '2021-10-26 11:28:45', '59 Tennyson Parkway', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Krishna Witterick', '2022-03-01 06:03:05', '7220 Morningstar Center', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Aldus Tinline', '2022-02-12 08:49:52', '26 Sugar Court', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Caryn Aitken', '2021-11-18 05:47:39', '63914 Brown Center', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Karole Beckwith', '2021-07-16 04:48:03', '4480 Toban Pass', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Mallory Burchard', '2021-08-30 21:32:25', '6781 Hanover Pass', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Florenza Oates', '2022-05-10 03:26:49', '15452 Kingsford Hill', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Sinclare Kondratenko', '2021-10-30 05:26:57', '89999 Logan Pass', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Denny Caulfield', '2022-05-15 01:44:50', '917 Brentwood Alley', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Camille Cissen', '2021-08-02 14:25:32', '02 Namekagon Junction', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Kit Vain', '2021-12-01 23:27:04', '7638 Anderson Junction', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Madelon Aldcorne', '2022-02-08 16:15:13', '9 Buena Vista Parkway', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Sauveur Pyle', '2021-12-07 08:10:09', '84 Magdeline Road', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Gwenore Docker', '2021-08-24 19:07:26', '68 Ridge Oak Parkway', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Vanni Paulot', '2022-04-26 22:58:42', '7 Coolidge Avenue', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Yance Wooff', '2022-05-15 14:15:09', '94171 Thierer Drive', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Valencia Lowen', '2021-11-12 12:37:22', '7551 Reinke Terrace', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Anissa Alman', '2021-09-24 16:36:52', '18607 Mayer Place', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Estel Petrollo', '2022-03-01 10:03:24', '1763 Brown Court', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Veradis Morgan', '2022-03-18 12:55:16', '8018 East Junction', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Gladys Lydiatt', '2021-06-20 00:07:45', '9 Valley Edge Junction', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Lenka McAlester', '2022-02-05 17:57:57', '47799 Kingsford Pass', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Amalee Antonignetti', '2022-02-01 06:38:51', '8639 Summer Ridge Park', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Griff Gaber', '2022-04-30 17:27:41', '61 Coleman Terrace', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Shae Withams', '2022-04-27 15:25:16', '011 Northfield Way', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Perl Struttman', '2021-10-29 02:57:53', '89 Kennedy Center', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Gabbie Badsworth', '2022-01-16 22:02:15', '30 Armistice Plaza', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Huntley Calladine', '2021-07-01 07:57:29', '525 Merry Pass', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Humberto Walford', '2022-03-18 11:16:01', '40047 Milwaukee Way', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Demetra Ronchetti', '2021-10-30 08:02:00', '37 Laurel Park', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Zorah Chessun', '2022-05-09 08:23:01', '5 Main Place', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Debora Cutford', '2022-03-29 23:36:37', '556 Burning Wood Hill', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Guillaume Greim', '2022-01-19 05:43:10', '45149 Pierstorff Trail', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Chev MacCague', '2022-03-02 15:36:47', '501 Harbort Plaza', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Lowe McLanachan', '2021-08-29 10:56:59', '5 Coleman Hill', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Basil Nunson', '2022-02-24 21:38:29', '0 Paget Terrace', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Jamesy Spikins', '2022-05-10 15:11:18', '6300 Montana Pass', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Dorey Greenstock', '2022-02-12 10:55:29', '17 Karstens Trail', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Yetta Valintine', '2021-09-11 15:10:01', '4332 Hoffman Avenue', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Arch Tolomelli', '2022-03-22 01:54:05', '19529 Mesta Center', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Manon Hustler', '2022-05-31 11:17:01', '7792 Haas Park', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Annaliese Fortye', '2022-04-01 09:05:06', '31 Sommers Place', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Gretta Milmo', '2021-08-02 23:39:37', '57 Clove Pass', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Christoforo Challenor', '2021-11-09 22:46:33', '97417 Washington Point', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Carey Gianninotti', '2021-12-05 16:18:40', '811 Luster Trail', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Chrotoem Ronchka', '2021-12-24 23:52:32', '56 Knutson Street', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Page Jaffa', '2021-06-21 10:14:59', '99405 David Lane', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Lind Esposito', '2022-01-25 04:24:05', '8762 Chinook Alley', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Cooper Brockman', '2021-12-29 17:54:16', '2260 Namekagon Plaza', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Rubi Griffiths', '2021-12-29 02:46:07', '0953 Boyd Park', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Katine Pattillo', '2021-07-30 04:40:40', '8220 Maryland Center', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Nara Hardistry', '2021-07-10 17:44:26', '7584 Cordelia Plaza', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Prentice Reiner', '2021-06-16 16:37:16', '9 Lakewood Park', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Zacharias Wesgate', '2022-05-11 13:06:09', '9685 Vera Place', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Pierson McClaughlin', '2022-03-16 16:53:05', '37 Main Trail', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Camile Sutehall', '2021-11-21 12:56:48', '00472 Forster Alley', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Agnola Fist', '2022-01-01 06:17:52', '41710 Loftsgordon Pass', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Cookie Giraudot', '2022-05-09 04:03:47', '747 Becker Point', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Betsy Vanne', '2021-12-14 08:19:34', '4966 Fordem Park', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Davy Pote', '2021-06-11 16:28:49', '8315 Melby Parkway', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Bertina Houlison', '2022-02-27 17:15:57', '4055 Tomscot Place', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Pammie Baumert', '2021-09-10 16:46:05', '40 Grasskamp Avenue', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Geneva Girt', '2022-05-04 14:38:50', '446 Linden Trail', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Thurstan Gott', '2021-10-25 00:11:01', '95677 Roth Plaza', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Pooh Drivers', '2022-03-18 02:14:55', '27050 Merrick Road', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Teresina Casper', '2022-02-12 12:01:06', '1 Raven Plaza', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Cesare McCheyne', '2022-04-13 17:28:36', '0 Onsgard Crossing', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Salli Riccardo', '2021-08-15 09:36:51', '5 Charing Cross Plaza', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Sarine Stroulger', '2021-10-09 01:41:53', '6241 Pennsylvania Road', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Cloris Gowlett', '2022-01-06 10:39:49', '4 Dovetail Plaza', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Olvan Gladding', '2021-06-29 10:51:20', '517 Vera Drive', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Gaylor Klein', '2021-11-13 21:06:03', '79357 Warrior Terrace', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Livia Maloney', '2021-06-20 12:39:53', '94654 Jana Plaza', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Anders Delhanty', '2022-04-30 09:47:05', '4 Utah Avenue', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Clara Tilte', '2021-10-04 05:30:17', '96 Ramsey Pass', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Shanie Peasgood', '2021-11-23 22:24:54', '95088 Eagan Drive', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Hulda Trevers', '2022-01-21 21:17:43', '40800 Golf View Alley', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Sherlocke Kneller', '2021-10-12 18:19:20', '54563 Spenser Point', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Tabby Littlejohns', '2022-03-14 04:21:06', '8389 Menomonie Plaza', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Gayler De Benedetti', '2022-04-05 19:24:55', '67 Mockingbird Place', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Pierrette Risbridger', '2021-07-30 19:08:52', '419 Esker Drive', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Zacherie Farlham', '2021-08-05 06:39:01', '5 Lake View Parkway', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Seline Reaper', '2022-05-06 04:32:34', '97 Weeping Birch Lane', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Evangeline Bartalot', '2022-04-02 19:55:17', '9770 Dixon Lane', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Maire Pilling', '2021-11-11 13:00:52', '626 Schurz Pass', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Rey Millar', '2022-01-09 00:27:35', '03 Hoard Road', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Keefe Greggersen', '2022-01-16 23:25:28', '9 Lakewood Gardens Street', 1);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Sybyl Jahnke', '2021-09-14 07:14:11', '3 Bay Lane', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Marya Chichgar', '2022-04-24 11:08:06', '3697 Village Green Avenue', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Dal Maruszewski', '2021-07-02 18:35:29', '2168 Ridgeview Point', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Jeannie Bewshaw', '2022-01-25 02:20:31', '933 Lyons Parkway', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Adria Janu', '2022-03-18 23:25:34', '5 Mifflin Center', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Craggie Reppaport', '2021-06-29 20:02:42', '8 South Point', 4);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Jeanie Jeaycock', '2022-03-04 08:02:00', '84 Fairview Circle', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Magdalen Leeves', '2022-01-15 10:02:59', '4 Maple Point', 3);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Seka Kewzick', '2021-09-17 19:45:29', '44821 Homewood Trail', 2);
insert into Customers (Complete_Name, Contract_Date, Address_Customer, Id_Celphone_Plan) values ('Legra Valentinuzzi', '2021-07-31 05:49:47', '001 Bunker Hill Circle', 1);

SELECT * FROM Customers WHERE Id_Customer = 4
SELECT * FROM Identification_Customer WHERE Id_Customer = 10

SELECT * FROM Identity_Type

SELECT TOP(1) Id_Customer FROM Customers ORDER BY Id_Customer DESC

DELETE FROM Audit_Log WHERE Id_Customer = 119
DELETE FROM Identification_Customer WHERE Id_Customer = 119
DELETE FROM Customers WHERE Id_Customer = 119





DELETE FROM Customers





--Adding Identification_Customer data
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('631536606-6', 4, 1);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('058203333-5', 2, 1);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('058204452-3', 3, 1);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('959466156-9', 1, 2);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('823574947-5', 2, 3);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('313101114-9', 4, 4);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('503438384-5', 1, 5);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('826035121-8', 1, 6);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('754241116-0', 3, 7);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('942243748-2', 2, 8);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('864819899-2', 2, 9);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('616153228-X', 4, 10);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('011336964-6', 2, 11);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('478188856-9', 1, 12);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('760299327-6', 1, 13);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('875675233-4', 4, 14);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('020266844-4', 2, 15);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('753645129-6', 4, 16);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('196463710-4', 4, 17);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('247546641-3', 4, 18);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('112267755-3', 1, 19);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('484714133-4', 3, 20);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('372498770-6', 3, 21);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('847247778-9', 4, 22);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('135106171-2', 1, 23);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('591416855-4', 2, 24);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('245734346-1', 4, 25);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('999818649-8', 2, 26);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('004336064-5', 1, 27);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('043621079-7', 3, 28);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('395440209-2', 4, 29);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('219778458-7', 3, 30);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('313018655-7', 4, 31);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('275031820-3', 3, 32);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('584203837-4', 2, 33);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('033061892-X', 1, 34);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('164698653-9', 4, 35);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('667220916-6', 4, 36);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('314316683-5', 3, 37);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('755512905-1', 2, 38);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('745774054-6', 1, 39);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('550164391-X', 3, 40);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('843542469-3', 1, 41);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('177352930-7', 3, 42);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('150765516-9', 2, 43);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('699328074-4', 1, 44);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('757628411-0', 1, 45);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('917761534-4', 4, 46);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('855825279-3', 1, 47);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('350651570-5', 1, 48);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('140857035-1', 2, 49);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('349474845-4', 2, 50);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('745229139-5', 3, 51);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('184979496-0', 4, 52);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('614161088-9', 2, 53);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('452762155-6', 3, 54);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('336129208-5', 1, 55);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('410809438-7', 1, 56);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('115360727-1', 4, 57);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('904687107-X', 4, 58);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('479192459-2', 4, 59);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('093899081-0', 4, 60);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('531581817-9', 3, 61);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('922244321-7', 3, 62);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('047847697-3', 4, 63);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('897033950-7', 2, 64);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('223586297-7', 2, 65);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('559430159-3', 4, 66);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('146899563-4', 2, 67);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('863827715-6', 4, 68);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('842364476-6', 3, 69);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('795442880-X', 3, 70);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('660160831-9', 1, 71);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('822548815-6', 1, 72);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('913692955-7', 2, 73);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('563660285-5', 2, 74);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('517293448-0', 2, 75);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('947342721-2', 3, 76);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('627964447-2', 3, 77);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('719751865-2', 1, 78);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('813445351-1', 1, 79);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('139599832-9', 1, 80);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('459681209-8', 3, 81);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('165427572-7', 3, 82);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('733734692-1', 3, 83);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('773780336-X', 4, 84);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('959909558-8', 4, 85);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('895769939-2', 1, 86);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('765701467-9', 3, 87);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('341367345-9', 4, 88);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('130650186-5', 3, 89);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('881487087-X', 4, 90);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('855557461-7', 4, 91);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('458040448-3', 1, 92);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('065804815-5', 3, 93);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('728794215-1', 3, 94);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('150179466-3', 1, 95);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('217398080-7', 3, 96);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('248930252-3', 2, 97);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('642955233-0', 4, 98);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('907748315-2', 2, 99);
INSERT INTO Identification_Customer (Number, Id_Type, Id_Customer) VALUES ('640066592-7', 1, 100);


SELECT * FROM Identification_Customer


--Adding Rol Data
INSERT INTO Rol VALUES('Admin'),('Guest');
SELECT * FROM Rol;


--Adding Users Data
INSERT INTO Users (UserName,Pass_Word,Avatar,Biography,Id_Rol) 
VALUES ('Noah07','Myhero07','https://avataaars.io/?avatarStyle=Circle&topType=ShortHairShortWaved&accessoriesType=Wayfarers&hairColor=Platinum&facialHairType=BeardLight&facialHairColor=Brown&clotheType=Hoodie&clotheColor=PastelGreen&eyeType=Wink&eyebrowType=RaisedExcitedNatural&mouthType=Serious&skinColor=Black','Hi this is Noah',1),
	   ('Hector','abc123','https://avataaars.io/?avatarStyle=Circle&topType=LongHairNotTooLong&accessoriesType=Sunglasses&hairColor=Blonde&facialHairType=MoustacheFancy&facialHairColor=Platinum&clotheType=ShirtScoopNeck&clotheColor=Heather&eyeType=Squint&eyebrowType=SadConcerned&mouthType=Smile&skinColor=Light','Hi this is Hector',2);

SELECT * FROM Users;

SELECT * FROM Users WHERE UserName = 'Noah07' AND Pass_Word = 'Myhero07';

--===================================================================

--CONSULTA GENERAL VISTA
CREATE VIEW GeneralCustomerInfo AS
SELECT 
	customers.Id_Customer,Complete_Name, Number, Identity_Name, Address_Customer,Contract_Date,Name_Plan, Price
FROM 
	Identification_Customer AS identityCustomer, 
	Customers AS customers, 
	Identity_Type AS identityType,
	Celphone_Plan AS celphone
WHERE
	identityCustomer.Id_Customer = customers.Id_Customer AND 
	identityCustomer.Id_Type = identityType.Id_Type AND
	celphone.Celphone_Plan = customers.Id_Celphone_Plan
--ORDER BY Complete_Name ASC


SELECT * FROM GeneralCustomerInfo WHERE Id_Customer = 6


--UPDATE employees
--SET last_name = 'Johnson'
--WHERE employee_id = 10;

UPDATE Customers 
SET
Complete_Name = 'Rebeca Lara', 
Contract_Date = '2022-06-12 07:31:09.00',
Address_Customer = 'Colonia Ciudad Arce cerca de Termos',
Id_Celphone_Plan = 1
WHERE 
Id_Customer = 5

UPDATE Identification_Customer
SET
Number = '05820444-5'
WHERE
Id_Type = 1 AND Id_Customer = 5



SELECT * FROM Customers WHERE Id_Customer = 3
SELECT * FROM Identification_Customer WHERE Id_Customer = 3


SELECT * FROM Audit_Log;
SELECT * FROM Users;
SELECT * FROM Customers;

INSERT INTO Audit_Log (Action,Date_Log,Id_User,Id_Customer) VALUES ('CREATE ON CUSTOMER','2022-03-18 02:14:55',1,6);
INSERT INTO Audit_Log (Action,Date_Log,Id_User,Id_Customer) VALUES ('CREATE ON CUSTOMER','2022-6-13 13:27:27',1,6);

--update on Identification_Customer
--delete on Identification_Customer
--create on Identification_Customer
--select on Identification_Customer