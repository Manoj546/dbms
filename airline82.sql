create database airline_82;
use airline_82;
create table flights (flno int, afrom varchar(20), ato varchar(20), distance int, departs time, arrives time, price int);
create table aircraftss(id int , aname varchar(20), cruisingrange int);
create table CERTIFIED (eid int, aid int);
create table EMPLOYEE (eid int, ename varchar(20), salary int);
ALTER TABLE flights
ADD CONSTRAINT PK_flno PRIMARY KEY (flno);
ALTER TABLE aircraftss
ADD CONSTRAINT PK_id PRIMARY KEY (id);
ALTER TABLE employee
ADD CONSTRAINT PK_eid PRIMARY KEY (eid);
ALTER TABLE CERTIFIEd
ADD CONSTRAINT PK_details PRIMARY KEY (eid,aid);
ALTER TABLE CERTIFIED
ADD CONSTRAINT FK_eid
FOREIGN KEY (eid) REFERENCES EMPLOYEE(eid); 
alter table CERTIFIED
ADD CONSTRAINT FK_aid
FOREIGN KEY (aid) REFERENCES aircrafts(id);

insert into aircrafts values(101,'747',3000);
insert into aircrafts values(102,'boeing',900);
insert into aircrafts values(103,'647',800);
insert into aircrafts values(104,'dreamliner',10000);
insert into aircrafts values(105,'boeing',3500);
insert into aircrafts values(106,'707',1500);
insert into aircrafts values(107,'dream',12000);

insert into employee values(701,'A',50000);
insert into employee values(702,'B',100000);
insert into employee values(703,'C',150000);
insert into employee values(704,'D',90000);
insert into employee values(705,'E',40000);
insert into employee values(706,'F',60000);
insert into employee values(707,'G',90000);

insert into certified values(701,101);
insert into certified values(701,102);
insert into certified values(701,106);
insert into certified values(701,105);
insert into certified values(702,104);
insert into certified values(703,104);
insert into certified values(704,104);
insert into certified values(702,107);
insert into certified values(703,107);
insert into certified values(704,107);
insert into certified values(702,101);
insert into certified values(703,105);
insert into certified values(704,105);
insert into certified values(705,103);

insert into flights values(101,'bangalore','delhi',2500,timestamp '2005-05-13 07:15:31',timestamp '2005-05-13 17:15:31',5000);
insert into flights values(102,'bangalore','lucknow',300,timestamp '2005-05-13 07:15:31',timestamp '2005-05-13 11:15:31',6000);
insert into flights values(103,'lucknow','delhi',500,timestamp '2005-05-13 07:15:31',timestamp '2005-05-13 17:15:31',3000);
insert into flights values(107,'bangalore','frankfurt',8000,timestamp '2005-05-13 07:15:31',timestamp '2005-05-13 22:15:31',60000);
insert into flights values(104,'bangalore','frankfurt',8500,timestamp '2005-05-13 07:15:31',timestamp '2005-05-13 23:15:31',75000);
insert into flights values(105,'kolkota','delhi',3400,timestamp '2005-05-13 07:15:31',timestamp '2005-05-13 09:15:31',7000);

select * from certified;

select a.aname from aircrafts a, certified c, employee e where c.eid=e.eid and c.aid=a.id and e.salary>80000;

select c.eid, a.cruisingrange from aircrafts a, certified c group by c.eid having count(c.eid)>=3;

select e.ename,e.salary where e.salary > (select min(f.price) from flights f where ato="frankfurt" and afrom "bangalore");

commit;