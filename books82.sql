create database books_82;
use books_82;

create table AUTHOR(author_id int, name varchar(20), city varchar(20), country varchar(20), primary key (author_id));

create table PUBLISHER(publisher_id int, name varchar(20), city varchar(20), country varchar(20), primary key (publisher_id));

create table CATEGORY(category_id int, description varchar(20), primary key (category_id));

create table CATALOG (book_id int, title varchar(20), author_id int, publisher_id int, category_id int, year int, price int, 
primary key (book_id), 
foreign key (author_id) references AUTHOR(author_id) on delete cascade, 
foreign key (publisher_id) references PUBLISHER(publisher_id) on delete cascade, 
foreign key (category_id) references CATEGORY(category_id) on delete cascade);

create table ORDERDETAILS(order_no int, book_id int, quantity int, 
primary key (order_no), 
foreign key (book_id) references CATALOG(book_id) on delete cascade);

INSERT INTO AUTHOR VALUES
          (1001,'JK Rowling','London','England'),
          (1002,'Chetan Bhagat','Mumbai','India'),
          (1003,'John McCarthy','Chicago','USA'),
          (1004,'Dan Brown','California','USA') ;
          
INSERT INTO PUBLISHER VALUES
          (2001,'Bloomsbury','London','England'),
          (2002,'Scholastic','Washington','USA'),
          (2003,'Pearson','London','England'),
          (2004,'Rupa','Delhi','India') ;
          
INSERT INTO CATEGORY VALUES (3001,'Fiction'),
          (3002,'Non-Fiction'), (3003,'thriller'),
          (3004,'action'), (3005,'fiction') ;
          
INSERT INTO CATALOG VALUES (4001,'Goblet',1001,2001,3001,2002,600), (4002,'Phoenix',1001,2002,3001,2005,650),
          (4003,'Two States',1002,2004,3001,2009,65), (4004,'3 Mistakes',1002,2004,3001,2007,55),
          (4005,'DaCode',1004,2003,3001,2004,450), (4006,'Angels',1004,2003,3001,2003,350),
          (4007,'Artificial',1003,2002,3002,1970,500) ;          

INSERT INTO ORDERDETAILS VALUES
          (5001,4001,5), (5002,4002,7),
          (5003,4003,15), (5004,4004,11),
          (5005,4005,9), (5006,4006,8),
          (5007,4007,2), (5008,4004,3) ;
          select  * from catalog;
          
select c.author_id, a.name, c.book_id, c.price from AUTHOR a, CATALOG c where c.author_id=a.author_id and c.year>2000 group by c.author_id having count(c.book_id)>1;

SELECT * FROM AUTHOR
          WHERE author_id IN
          (SELECT author_id FROM CATALOG WHERE
          year>2000 AND price>
          (SELECT AVG(price) FROM CATALOG)
          GROUP BY author_id HAVING COUNT(*)>1);
          
SELECT * FROM AUTHOR
               WHERE author_id IN
               (SELECT author_id FROM CATALOG WHERE
               year>2000 AND price>
               (SELECT AVG(price) FROM CATALOG)
               GROUP BY author_id HAVING COUNT(*)>1);
               
UPDATE CATALOG SET price=1.1*price
          WHERE publisher_id IN
          (SELECT publisher_id FROM PUBLISHER WHERE
         name='pearson');     
          commit;
	  