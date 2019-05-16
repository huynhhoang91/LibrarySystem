
insert into books (ID, booksName, publisher,cover,coverFull)
SELECT ISBN,`Book-Title`,Publisher,`Image-URL-M`,`Image-URL-L` FROM library.bxbooks;

insert into author (authorName)
SELECT `Book-Author` FROM library.bxbooks
group by `Book-Author`;

insert into writes (booksID, authorName, publishingDate)
SELECT ISBN,`Book-Author`, STR_TO_DATE(`Year-Of-Publication`, '%Y') FROM library.bxbooks;
