CREATE DATABASE FairWayProtoType;

USE FairWayProtoType;

GRANT ALL PRIVILEGES ON FairWayProtoType.* TO 'CEO'@'%';
flush privileges;

CREATE TABLE Employee (
    employee_id BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Date_Been_Employed TEXT NOT NULL,
    Email_Address char(40) NOT NULL UNIQUE,
    First_Name char(40) NOT NULL,
    Last_Name char(40) NOT NULL,
    Supervisor_id BIGINT NOT NULL,
    FOREIGN KEY (Supervisor_id) REFERENCES Employee(employee_id)
    ON UPDATE cascade
    ON DELETE restrict
);

CREATE TABLE Customer (
    CustID BIGINT AUTO_INCREMENT NOT NULL,
    Email char(40) NOT NULL UNIQUE,
    Phone_Number char(20) NOT NULL UNIQUE,
    First_Name char(40) NOT NULL,
    Last_Name char(40) NOT NULL,
    Birth_Month char(2) NOT NULL,
    Day_Of_Birth char(2) NOT NULL,
    Year_Of_Birth char(4) NOT NULL,
    Street TEXT NOT NULL,
    Country TEXT NOT NULL,
    City TEXT NOT NULL,
    Zip_Code INT NOT NULL,
    State TEXT NOT NULL,
    PRIMARY KEY (CustID)
);

CREATE TABLE Invoice (
    InvoiceID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Purchase_Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Country TEXT NOT NULL,
    State TEXT,
    Street TEXT NOT NULL,
    City TEXT NOT NULL,
    Customer_ID BIGINT NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(CustID)
    ON UPDATE cascade
    ON DELETE restrict
);

CREATE TABLE Help_Request (
    RequestID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    requestSum TEXT,
    Customer_ID BIGINT NOT NULL,
    Customer_Service_ID BIGINT NOT NULL,
    Order_ID BIGINT NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(CustID)
    ON UPDATE cascade
    ON DELETE restrict,
    FOREIGN KEY (Customer_Service_ID) REFERENCES Employee(employee_id)
    ON UPDATE cascade
    ON DELETE restrict,
    FOREIGN KEY (Order_ID) REFERENCES Invoice(InvoiceID)
    ON UPDATE cascade
    ON DELETE restrict
);

CREATE TABLE Product (
    ProductId BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Price DECIMAL(19,2) UNSIGNED NOT NULL,
    Name TEXT NOT NULL
);

CREATE TABLE InvoiceLine (
    Invoice_LineID BIGINT AUTO_INCREMENT NOT NULL,
    Quantity INT UNSIGNED NOT NULL,
    UnitPrice DECIMAL(19,2) UNSIGNED NOT NULL,
    Receipt_ID BIGINT NOT NULL,
    Product_ID BIGINT NOT NULL,
    PRIMARY KEY (Invoice_LineID),
    FOREIGN KEY (Receipt_ID) REFERENCES Invoice(InvoiceID)
    ON UPDATE cascade
    ON DELETE restrict,
    FOREIGN KEY (Product_ID) REFERENCES Product(ProductId)
    ON UPDATE cascade
    ON DELETE restrict
);

CREATE TABLE Manufacturer (
    ManufacturerID BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Country TEXT NOT NULL,
    State_Or_Territory TEXT,
    Email TEXT NOT NULL,
    PhoneNum char(20) NOT NULL UNIQUE,
    First_Name TEXT NOT NULL,
    Last_Name TEXT NOT NULL
);

CREATE TABLE Creators (
    CreatorID BIGINT NOT NULL,
    ItemID BIGINT NOT NULL,
    FOREIGN KEY (CreatorID) REFERENCES Product(ProductId)
    ON UPDATE cascade
    ON DELETE restrict,
    FOREIGN KEY (ItemID) REFERENCES Manufacturer(ManufacturerID)
    ON UPDATE cascade
    ON DELETE restrict
);

insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values (9508797385, '5/17/2022', 'inapthine0@yahoo.co.jp', 'Iosep', 'Napthine', 9508797385);
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values (0946908037, '1/24/2022', 'bhattam1@netlog.com', 'Becka', 'Hattam', 9508797385);
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values (6914924911, '6/9/2022', 'cthorbon2@prnewswire.com', 'Caroljean', 'Thorbon', 9508797385);
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values (5298331150, '5/11/2022', 'akerwin3@unblog.fr', 'Alejandrina', 'Kerwin', 9508797385);
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values (7579396996, '12/7/2021', 'krunciman4@tinyurl.com', 'Karena', 'Runciman', 9508797385);
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values (0977934777, '8/22/2022', 'rtopaz5@ow.ly', 'Randi', 'Topaz', 9508797385);
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values (1974661298, '3/1/2022', 'smackeller6@ebay.com', 'Steve', 'MacKeller', 9508797385);
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values (8231436632, '8/11/2022', 'dbeardshall7@ihg.com', 'Darci', 'Beardshall', 9508797385);
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values (7996014494, '1/20/2022', 'sheninghem8@admin.ch', 'Siegfried', 'Heninghem', 9508797385);
insert into Employee (employee_id, Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) values (9320570308, '10/4/2022', 'igladtbach9@bloglines.com', 'Irma', 'Gladtbach', 9508797385);

insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State) values ('0576233818', 'hgratton0@mashable.com', '334-298-3882', 'Hilda', 'Gratton', 6, 9, 2006, 'Dryden', 'United States', 'Birmingham', '6252025', 'Alabama');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State) values ('4342204366', 'dortas1@yahoo.com', '574-737-8502', 'Damian', 'Ortas', 6, 23, 1993, 'Kingsford', 'United States', 'South Bend', '6557532', 'Indiana');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State) values ('7018339376', 'mbraker2@joomla.org', '832-145-6415', 'Matthieu', 'Braker', 10, 14, 1985, 'Hayes', 'United States', 'Houston', '7587272', 'Texas');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State) values ('6136802201', 'hdurden3@people.com.cn', '682-293-9486', 'Horatia', 'Durden', 10, 13, 2019, 'Meadow Vale', 'United States', 'Fort Worth', '3650144', 'Texas');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State) values ('8346207528', 'gcote4@merriam-webster.com', '859-310-8660', 'Gnni', 'Cote', 5, 1, 1998, 'Crownhardt', 'United States', 'Lexington', '8312912', 'Kentucky');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State) values ('1350068223', 'cbrightie5@soup.io', '772-684-8989', 'Chaim', 'Brightie', 8, 12, 2016, 'Clemons', 'United States', 'Fort Pierce', '1027525', 'Florida');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State) values ('0949877970', 'egilkison6@t-online.de', '601-853-8268', 'Evvy', 'Gilkison', 4, 1, 1992, 'Maple Wood', 'United States', 'Jackson', '8799199', 'Mississippi');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State) values ('5373314290', 'ypuckinghorne7@multiply.com', '772-618-4904', 'Yance', 'Puckinghorne', 1, 5, 2005, 'Vahlen', 'United States', 'Fort Pierce', '3441864', 'Florida');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State) values ('3717830517', 'jgotobed8@economist.com', '210-130-3870', 'Joli', 'Gotobed', 11, 11, 2011, 'Haas', 'United States', 'San Antonio', '8374344', 'Texas');
insert into Customer (CustID, Email, Phone_Number, First_Name, Last_Name, Birth_Month, Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State) values ('6378104203', 'rtruelock9@omniture.com', '713-939-0264', 'Rennie', 'Truelock', 7, 8, 2012, 'Onsgard', 'United States', 'Houston', '4788416', 'Texas');

insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (5641591974, '2022-04-24 12:32', 'United States', 'Maryland', 'Vahlen', 'Frederick', '0576233818');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (0414917496, '2022-03-25 12:32', 'United States', 'Florida', 'Del Sol', 'Miami', '6136802201');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (7928211549, '2021-12-05 12:32', 'United States', 'Louisiana', 'Nova', 'Baton Rouge', '0949877970');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (2747065547, '2022-03-09 12:32', 'United States', 'California', 'Fulton', 'Berkeley', '8346207528');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (1877930477, '2022-02-08 12:32', 'United States', 'Texas', 'Ohio', 'Plano', '0949877970');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (1496167355, '2022-07-17 12:32', 'United States', 'South Carolina', 'Petterle', 'Greenville', '8346207528');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (1881878623, '2022-06-15 12:32', 'United States', 'Florida', 'Anhalt', 'Miami', '0949877970');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (8863764876, '2022-05-04 12:32', 'United States', 'Texas', 'Muir', 'Houston', '8346207528');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (1546416761, '2022-11-06 12:32', 'United States', 'Florida', 'Kingsford', 'Tampa', '0949877970');
insert into Invoice (InvoiceID, Purchase_Date, Country, State, Street, City, Customer_ID) values (6721693740, '2021-12-21 12:32', 'United States', 'Washington', '3rd', 'Lakewood', '8346207528');

insert into Help_Request (RequestID, requestSum, Customer_ID, Customer_Service_ID, Order_ID) values (798982534, 'I want to cancel the order. Please contact me by phonecall', 0949877970, 0977934777, 1881878623);
insert into Help_Request (RequestID, requestSum, Customer_ID, Customer_Service_ID, Order_ID) values (632525453, 'I want to cancel my order. Please contact me in email', 0949877970, 7579396996, 1877930477);
insert into Help_Request (RequestID, requestSum, Customer_ID, Customer_Service_ID, Order_ID) values (798032544, 'I want to return my order. Please contact me in email', 8346207528, 7996014494, 6721693740);
insert into Help_Request (RequestID, requestSum, Customer_ID, Customer_Service_ID, Order_ID) values (325454325, 'I am interested on working at Fairway as a customer service. Can you give me some information about where to apply for this job? Please contact me in email', 8346207528, 0977934777, 6721693740);
insert into Help_Request (RequestID, requestSum, Customer_ID, Customer_Service_ID, Order_ID) values (632413544, 'I accidentally cancel my previous order, can you recover the order for me? Please contact me by phonecall', 0949877970, 9320570308, 1546416761);

insert into Product (ProductId, Price, Name) values (8777303655, 97.96, 'Temp');
insert into Product (ProductId, Price, Name) values (3475769191, 38.14, 'Hatity');
insert into Product (ProductId, Price, Name) values (2604473318, 2.84, 'Y-find');
insert into Product (ProductId, Price, Name) values (3207670379, 70.66, 'Andalax');
insert into Product (ProductId, Price, Name) values (2361095623, 72.18, 'Matsoft');
insert into Product (ProductId, Price, Name) values (5200881801, 54.85, 'Zontrax');
insert into Product (ProductId, Price, Name) values (8574965176, 2.69, 'Tresom');
insert into Product (ProductId, Price, Name) values (2623741306, 13.14, 'Zamit');
insert into Product (ProductId, Price, Name) values (7602232225, 54.81, 'Tres-Zap');
insert into Product (ProductId, Price, Name) values (1303197542, 3.21, 'Redhold');

insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID, Product_ID) values (8783000960, 85, 77.48, 5641591974, 3475769191);
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID, Product_ID) values (9042357718, 63, 78.35, 1881878623, 2604473318);
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID, Product_ID) values (6539119653, 80, 13.4, 5641591974, 5200881801);
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID, Product_ID) values (0596087865, 9, 86.6, 1881878623, 5200881801);
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID, Product_ID) values (7757395069, 33, 43.94, 1546416761, 3207670379);
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID, Product_ID) values (3726370269, 36, 55.31, 1546416761, 8574965176);
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID, Product_ID) values (8151921466, 6, 29.38, 5641591974, 7602232225);
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID, Product_ID) values (1964349974, 29, 14.54, 1546416761, 8777303655);
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID, Product_ID) values (8467013135, 66, 89.01, 1881878623, 1303197542);
insert into InvoiceLine (Invoice_LineID, Quantity, UnitPrice, Receipt_ID, Product_ID) values (5659865292, 46, 97.39, 8863764876, 2361095623);

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

insert into Creators (CreatorID, ItemID) values (8777303655, 2658641613);
insert into Creators (CreatorID, ItemID) values (8574965176, 1073811902);
insert into Creators (CreatorID, ItemID) values (8777303655, 4381046908);
insert into Creators (CreatorID, ItemID) values (3207670379, 9473247069);
insert into Creators (CreatorID, ItemID) values (7602232225, 3384934458);
insert into Creators (CreatorID, ItemID) values (3207670379, 2658641613);
insert into Creators (CreatorID, ItemID) values (3207670379, 1073811902);
insert into Creators (CreatorID, ItemID) values (2604473318, 7465921943);
insert into Creators (CreatorID, ItemID) values (5200881801, 3491167110);
insert into Creators (CreatorID, ItemID) values (1303197542, 9373126228);