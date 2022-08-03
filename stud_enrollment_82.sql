create database enrollment_82;
use enrollment_82;

create table STUDENT (regno varchar(20), sname varchar(20), major varchar(20), bdate date, primary key (regno));

create table COURSE (course int, cname varchar(20), dept varchar(20), primary key (course));

create table ENROLL (regno varchar(20), cname varchar(20), sem int, marks int, 
primary key (regno), 
foreign key (regno) references STUDENT(regno) on delete cascade on update cascade);

create table BOOK_ADOPTION (course int, sem int, book_ISBN int, primary key (course,book_ISBN),
foreign key (course) references COURSE(course) on delete cascade on update cascade, 
foreign key (book_ISBN) references TEXTBOOK(book_ISBN) on delete cascade on update cascade);

create table TEXTBOOK(book_ISBN int, book_title varchar(20), publisher varchar(20), author varchar(20), primary key (book_ISBN));

INSERT INTO STUDENT VALUES ('1pe11cs001','a','sr',19931230),
	 ('1pe11cs002','b','sr','19930924'),
     ('1pe11cs003','c','sr','19931127'),
     ('1pe11cs004','d','sr','19930413'),
     ('1pe11cs005','e','jr','19940824');
 INSERT INTO course VALUES (111,'OS','CSE'),
     (112,'EC','CSE'),
     (113,'SS','ISE'),
     (114,'DBMS','CSE'),
     (115,'SIGNALS','ECE');
 INSERT INTO TEXTBOOK VALUES
     (10,'DATABASE SYSTEMS','PEARSON','SCHIELD'),
     (900,'OPERATING SYS','PEARSON','LELAND'),
     (901,'CIRCUITS','HALL INDIA','BOB'),
     (902,'SYSTEM SOFTWARE','PETERSON','JACOB'),
     (903,'SCHEDULING','PEARSON','PATIL'),
     (904,'DATABASE SYSTEMS','PEARSON','JACOB'),
     (905,'DATABASE MANAGER','PEARSON','BOB'),
     (906,'SIGNALS','HALL INDIA','SUMIT');
 INSERT INTO ENROLL VALUES ('1pe11cs001',115,3,100),
     ('1pe11cs002',114,5,100),
     ('1pe11cs003',113,5,100),
     ('1pe11cs004',111,5,100),
     ('1pe11cs005',112,3,100);
 INSERT INTO BOOK_ADOPTION VALUES
(111,5,900),
(111,5,903),
(111,5,904),
(112,3,901),
(113,3,10),
(114,5,905),
(113,5,902),
(115,3,906);

INSERT INTO TEXTBOOK VALUES (100,'Unread','PEARSON','SCHIELD');
INSERT INTO course VALUES (1246,'new','CSE');
INSERT INTO BOOK_ADOPTION VALUES (1246,9,100);
 select * from BOOK_ADOPTION;
 
select c.course, t.book_ISBN, t.book_title from COURSE c, TEXTBOOK t, BOOK_ADOPTION ba 
where t.book_ISBN=ba.book_ISBN and ba.course=c.course and c.dept="CSE" 
order by t.book_title;
