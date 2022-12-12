CREATE DATABASE FairWay;

SHOW DATABASES;

CREATE USER 'CEO' @ '%'
    IDENTIFIED BY 'abc123';

GRANT ALL PRIVILEGES ON FairWay.* TO 'CEO' @ '%';

USE FairWay;


CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Date_Been_Employed DATE NOT NULL,
    Email_Address TEXT NOT NULL UNIQUE,
    First_Name char(40) NOT NULL,
    Last_Name char(40) NOT NULL,
    Supervisor_id INT NOT NULL,
    FOREIGN KEY (Supervisor_id) REFERENCES Employee
);

CREATE TABLE Customer (
    CustID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Email TEXT NOT NULL UNIQUE,
    Phone_Number UNSIGNED char(20) NOT NULL UNIQUE,
    First_Name char(40) NOT NULL,
    Last_Name char(40) NOT NULL,
    Birth_Month char(2) NOT NULL,
    Day_Of_Birth char(2) NOT NULL,
    Year_Of_Birth char(4) NOT NULL,
    Street TEXT NOT NULL,
    Country TEXT NOT NULL,
    City TEXT NOT NULL,
    Zip_Code INTEGER NOT NULL,
    State TEXT NOT NULL,
    Support_Rep_id INTEGER NOT NULL,
    FOREIGN KEY (Support_Rep_id) REFERENCES Employee(employee_id)
);

CREATE TABLE Invoice (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Purchase_Date DATETIME DEFAULT CURRENT_TIMESTAMP
                      ON UPDATE CURRENT_TIMESTAMP,
    Country TEXT NOT NULL,
    State TEXT,
    Street TEXT NOT NULL,
    City TEXT NOT NULL,
    Customer_ID UNSIGNED INTEGER NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(CustID)
);

CREATE TABLE InvoiceLine (
    Invoice_LineID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Quantity UNSIGNED INTEGER NOT NULL,
    UnitPrice UNSIGNED DECIMAL(3,2) NOT NULL,
    Receipt_ID UNSIGNED INTEGER NOT NULL,
    FOREIGN KEY (Receipt_ID) REFERENCES Invoice(InvoiceID)
);

CREATE TABLE Product (
    ProductId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Price UNSIGNED DECIMAL(3,2) NOT NULL,
    Name TEXT NOT NULL UNIQUE,
    Purchaser_ID UNSIGNED INTEGER NOT NULL,
    FOREIGN KEY (Purchaser_ID) REFERENCES InvoiceLine(Invoice_LineID)
);

CREATE TABLE Creators (
    CreatorID INT NOT NULL,
    ItemID INT NOT NULL,
    FOREIGN KEY (CreatorID) REFERENCES Product(ProductId),
    FOREIGN KEY (ItemID) REFERENCES Manufacturer(ManufacturerID)
);

CREATE TABLE Manufacturer (
    ManufacturerID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Country TEXT NOT NULL,
    State_Or_Territory TEXT,
    Email TEXT NOT NULL UNIQUE,
    PhoneNum UNSIGNED char(20) NOT NULL UNIQUE,
    First_Name TEXT NOT NULL,
    Last_Name TEXT NOT NULL
);

insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values ('9508797385', '5/17/2022', 'inapthine0@yahoo.co.jp', 'Iosep', 'Napthine', '0422607620');
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values ('0946908037', '1/24/2022', 'bhattam1@netlog.com', 'Becka', 'Hattam', '9154342820');
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values ('6914924911', '6/9/2022', 'cthorbon2@prnewswire.com', 'Caroljean', 'Thorbon', '9426435451');
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values ('5298331150', '5/11/2022', 'akerwin3@unblog.fr', 'Alejandrina', 'Kerwin', '3653324797');
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values ('7579396996', '12/7/2021', 'krunciman4@tinyurl.com', 'Karena', 'Runciman', '5175701037');
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values ('0977934777', '8/22/2022', 'rtopaz5@ow.ly', 'Randi', 'Topaz', '9918551608');
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values ('1974661298', '3/1/2022', 'smackeller6@ebay.com', 'Steve', 'MacKeller', '6601564228');
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values ('8231436632', '8/11/2022', 'dbeardshall7@ihg.com', 'Darci', 'Beardshall', '6516117589');
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values ('7996014494', '1/20/2022', 'sheninghem8@admin.ch', 'Siegfried', 'Heninghem', '1953270291');
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values ('9320570308', '10/4/2022', 'igladtbach9@bloglines.com', 'Irma', 'Gladtbach', '7743217156');

insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State, Support_Rep_id) values ('0576233818', 'hgratton0@mashable.com', '334-298-3882', 'Hilda', 'Gratton', 6, 9, 2006, 'Dryden', 'United States', 'Birmingham', '6252025', 'Alabama', '6298758097');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State, Support_Rep_id) values ('4342204366', 'dortas1@yahoo.com', '574-737-8502', 'Damian', 'Ortas', 6, 23, 1993, 'Kingsford', 'United States', 'South Bend', '6557532', 'Indiana', '6121460030');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State, Support_Rep_id) values ('7018339376', 'mbraker2@joomla.org', '832-145-6415', 'Matthieu', 'Braker', 10, 14, 1985, 'Hayes', 'United States', 'Houston', '7587272', 'Texas', '4459457891');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State, Support_Rep_id) values ('6136802201', 'hdurden3@people.com.cn', '682-293-9486', 'Horatia', 'Durden', 10, 13, 2019, 'Meadow Vale', 'United States', 'Fort Worth', '3650144', 'Texas', '9597639208');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State, Support_Rep_id) values ('8346207528', 'gcote4@merriam-webster.com', '859-310-8660', 'Gnni', 'Cote', 5, 1, 1998, 'Crownhardt', 'United States', 'Lexington', '8312912', 'Kentucky', '2809029423');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State, Support_Rep_id) values ('1350068223', 'cbrightie5@soup.io', '772-684-8989', 'Chaim', 'Brightie', 8, 12, 2016, 'Clemons', 'United States', 'Fort Pierce', '1027525', 'Florida', '9579492284');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State, Support_Rep_id) values ('0949877970', 'egilkison6@t-online.de', '601-853-8268', 'Evvy', 'Gilkison', 4, 1, 1992, 'Maple Wood', 'United States', 'Jackson', '8799199', 'Mississippi', '9114180894');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State, Support_Rep_id) values ('5373314290', 'ypuckinghorne7@multiply.com', '772-618-4904', 'Yance', 'Puckinghorne', 1, 5, 2005, 'Vahlen', 'United States', 'Fort Pierce', '3441864', 'Florida', '2370595082');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State, Support_Rep_id) values ('3717830517', 'jgotobed8@economist.com', '210-130-3870', 'Joli', 'Gotobed', 11, 11, 2011, 'Haas', 'United States', 'San Antonio', '8374344', 'Texas', '8138751160');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State, Support_Rep_id) values ('6378104203', 'rtruelock9@omniture.com', '713-939-0264', 'Rennie', 'Truelock', 7, 8, 2012, 'Onsgard', 'United States', 'Houston', '4788416', 'Texas', '7647636297');

insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (5641591974, '4/24/2022', 'United States', 'Maryland', 'Vahlen', 'Frederick', '4663379474');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (0414917496, '3/25/2022', 'United States', 'Florida', 'Del Sol', 'Miami', '2149350838');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (7928211549, '12/5/2021', 'United States', 'Louisiana', 'Nova', 'Baton Rouge', '4849930785');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (2747065547, '3/9/2022', 'United States', 'California', 'Fulton', 'Berkeley', '9070656414');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (1877930477, '2/8/2022', 'United States', 'Texas', 'Ohio', 'Plano', '6799170415');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (1496167355, '7/17/2022', 'United States', 'South Carolina', 'Petterle', 'Greenville', '8618730516');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (1881878623, '6/15/2022', 'United States', 'Florida', 'Anhalt', 'Miami', '5683701760');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (8863764876, '5/4/2022', 'United States', 'Texas', 'Muir', 'Houston', '6993477013');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (1546416761, '11/6/2022', 'United States', 'Florida', 'Kingsford', 'Tampa', '8873823243');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (6721693740, '12/21/2021', 'United States', 'Washington', '3rd', 'Lakewood', '8175274402');

insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID) values (8783000960, 85, 77.48, '1341903065');
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID) values (9042357718, 63, 78.35, '5490744103');
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID) values (6539119653, 80, 13.4, '6748545864');
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID) values (0596087865, 9, 86.6, '9078999092');
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID) values (7757395069, 33, 43.94, '1521302192');
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID) values (3726370269, 36, 55.31, '3544498428');
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID) values (8151921466, 6, 29.38, '2172961925');
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID) values (1964349974, 29, 14.54, '6835569755');
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID) values (8467013135, 66, 89.01, '2500725428');
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID) values (5659865292, 46, 97.39, '0898289915');

insert into Product (ProductId, Price, Name, Purchaser_ID) values (8777303655, 97.96, 'Temp', '5805369648');
insert into Product (ProductId, Price, Name, Purchaser_ID) values (3475769191, 38.14, 'Hatity', '5608109853');
insert into Product (ProductId, Price, Name, Purchaser_ID) values (2604473318, 2.84, 'Y-find', '1630689136');
insert into Product (ProductId, Price, Name, Purchaser_ID) values (3207670379, 70.66, 'Andalax', '6661792534');
insert into Product (ProductId, Price, Name, Purchaser_ID) values (2361095623, 72.18, 'Matsoft', '1216526389');
insert into Product (ProductId, Price, Name, Purchaser_ID) values (5200881801, 54.85, 'Zontrax', '9584544611');
insert into Product (ProductId, Price, Name, Purchaser_ID) values (8574965176, 2.69, 'Tresom', '9497151660');
insert into Product (ProductId, Price, Name, Purchaser_ID) values (2623741306, 13.14, 'Zamit', '6810500608');
insert into Product (ProductId, Price, Name, Purchaser_ID) values (7602232225, 54.81, 'Tres-Zap', '4195742183');
insert into Product (ProductId, Price, Name, Purchaser_ID) values (1303197542, 3.21, 'Redhold', '1314293009');

insert into Creators (CreatorID, ItemID) values (2174046810, 6504441501);
insert into Creators (CreatorID, ItemID) values (7701633399, 1079760205);
insert into Creators (CreatorID, ItemID) values (2514317324, 8761426274);
insert into Creators (CreatorID, ItemID) values (6826840310, 4390618446);
insert into Creators (CreatorID, ItemID) values (8571334119, 9880547441);
insert into Creators (CreatorID, ItemID) values (8523731197, 6991595102);
insert into Creators (CreatorID, ItemID) values (8297171667, 4046300151);
insert into Creators (CreatorID, ItemID) values (5020150843, 3279156025);
insert into Creators (CreatorID, ItemID) values (0965690107, 3908587248);
insert into Creators (CreatorID, ItemID) values (4288704729, 2059385417);

insert into Manufacturer (ManufacturerID, Country, State_Or_Territory, Email, PhoneNum, First_Name, Last_Name) values ('9473247069', 'China', null, 'smotherwell0@un.org', '725-835-6598', 'Sid', 'Motherwell');
insert into Manufacturer (ManufacturerID, Country, State_Or_Territory, Email, PhoneNum, First_Name, Last_Name) values ('3384934458', 'Philippines', null, 'ogeach1@google.it', '640-412-6354', 'Ozzy', 'Geach');
insert into Manufacturer (ManufacturerID, Country, State_Or_Territory, Email, PhoneNum, First_Name, Last_Name) values ('6071011070', 'China', null, 'ccalan2@webmd.com', '547-386-1805', 'Connor', 'Calan');
insert into Manufacturer (ManufacturerID, Country, State_Or_Territory, Email, PhoneNum, First_Name, Last_Name) values ('3491167110', 'Portugal', 'Braga', 'boshirine3@desdev.cn', '156-921-6635', 'Bettye', 'O''Shirine');
insert into Manufacturer (ManufacturerID, Country, State_Or_Territory, Email, PhoneNum, First_Name, Last_Name) values ('9373126228', 'Brazil', null, 'rmingus4@cbslocal.com', '350-393-7618', 'Raffarty', 'Mingus');
insert into Manufacturer (ManufacturerID, Country, State_Or_Territory, Email, PhoneNum, First_Name, Last_Name) values ('4381046908', 'Sweden', 'Södermanland', 'lwilne5@desdev.cn', '320-415-3884', 'Lorianna', 'Wilne');
insert into Manufacturer (ManufacturerID, Country, State_Or_Territory, Email, PhoneNum, First_Name, Last_Name) values ('1073811902', 'Chile', null, 'kbims6@timesonline.co.uk', '895-109-0744', 'Kacy', 'Bims');
insert into Manufacturer (ManufacturerID, Country, State_Or_Territory, Email, PhoneNum, First_Name, Last_Name) values ('2658641613', 'Brazil', null, 'eshillitto7@prlog.org', '459-743-9322', 'Edgard', 'Shillitto');
insert into Manufacturer (ManufacturerID, Country, State_Or_Territory, Email, PhoneNum, First_Name, Last_Name) values ('2138867807', 'Egypt', null, 'ctesmond8@blogger.com', '565-925-3264', 'Carmelina', 'Tesmond');
insert into Manufacturer (ManufacturerID, Country, State_Or_Territory, Email, PhoneNum, First_Name, Last_Name) values ('7465921943', 'China', null, 'tjillions9@free.fr', '435-720-7126', 'Thomas', 'Jillions');