CREATE TABLE Books (
    ID char(13) primary key,
    booksName text,
    publisher varchar(255),
    Copys int default 5,
    borrows int default 0,
    category varchar(255) ,
    price float,
    cover text,
    coverFull text
);

create table Users(
	username varchar(255) binary primary key,
    userPassword varchar(255) binary,
    firstName varchar(255),
    lastName varchar(255),
    email varchar(255) unique
    
);

create table Author(
    authorName varchar(255) primary key,
    DOB date,
    Gender char(1)
);

create table Equipment(
	ID int primary key AUTO_INCREMENT,
    equipName varchar(255),
    totalNumber int,
    borrows int
);

create table Admins(
	ID int primary key,
    adminName varchar(255),
    adminPassword varchar(255)
);

create table Writes(
	booksID char(13), FOREIGN KEY (booksID) REFERENCES Books(ID),
    authorName varchar(255), FOREIGN KEY (authorName) REFERENCES Author(authorName),
    publishingDate date
);

create table BorrowBook(
	username  varchar(255) binary, FOREIGN KEY (username) REFERENCES Users(username),
    booksID char(13), FOREIGN KEY (booksID) REFERENCES Books(ID),
    borrowDate date,
    returnDate date,
    returned boolean default 0 
);

create table BorrowEquipment(
	username  varchar(255)binary, FOREIGN KEY (username) REFERENCES Users(username),
    equipmentID int, FOREIGN KEY (equipmentID) REFERENCES Equipment(ID),
	borrowDate date,
    returnDate date,
    returned boolean default 0 
);