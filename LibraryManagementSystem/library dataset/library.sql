CREATE TABLE Books (
    ID char(13) primary key,
    booksName text,
    Copys int default 5,
    borrows int default 0,
    category varchar(255) ,
    price float,
    cover text
);

create table Users(
	ID int primary key,
    userPassword varchar(255),
    firstName varchar(255),
    lastName varchar(255),
    email varchar(255)
    
);

create table Author(
    authorName varchar(255) primary key,
    DOB date,
    Gender char(1)
);

create table Equipment(
	ID int primary key,
    equipName varchar(255),
    totalNumber int,
    borrows int
);

create table Admins(
	ID int primary key,
    authorsName varchar(255),
    adminPassword varchar(255)
);

create table Writes(
	booksID char(13), FOREIGN KEY (booksID) REFERENCES Books(ID),
    authorsName varchar(255), FOREIGN KEY (authorsName) REFERENCES Author(authorName),
    publishingDate date
);

create table BorrowBook(
	userID int, FOREIGN KEY (userID) REFERENCES Users(ID),
    booksID char(13), FOREIGN KEY (booksID) REFERENCES Books(ID),
    borrowDate date,
    returnDate date
);

create table BorrowEquipment(
	userID int, FOREIGN KEY (userID) REFERENCES Users(ID),
    equipmentID int, FOREIGN KEY (equipmentID) REFERENCES Equipment(ID),
	borrowDate date,
    returnDate date
);