create database insurance82;
use insurance82;
show tables;
create table PERSON (driver_id varchar(10), name varchar(15), address varchar(20), primary key (driver_id));
desc PERSON;
create table CAR (Regno varchar(10), model varchar(10), year int, primary key(Regno));
create table ACCIDENT (report_number int, date date, location varchar(15), primary key(report_number));
create table owns (driver_id varchar(10), Regno varchar(10), 
foreign key(driver_id) references person(driver_id), 
foreign key(Regno) references CAR(Regno) on delete cascade on update cascade);
create table PARTICIPANTS (driver_id varchar(10), Regno varchar(10), report_number int, damage_amt int, 
foreign key(driver_id) references PERSON(driver_id),
foreign key(Regno) references CAR(Regno), 
foreign key(report_number) references ACCIDENT(report_number) on delete cascade on update cascade);
alter table PERSON rename column name to pname;
insert into PERSON values('1','manoj','dsfdsf');
insert into PERSON values('2','lokesh','dsfdsffdsf');
insert into PERSON values('3','uday','dsfyiuydsf');
insert into PERSON values('4','mounesh','cvxxc');
insert into PERSON values('5','krip','qeqw');
select * from PARTICIPANTS;
insert into CAR values('44','audi','2345');
insert into CAR values('55','benz','1234');
insert into CAR values('11','maruti','2315');
insert into CAR values('24','bmw','7821');
insert into CAR values('18','waganor','5567');
insert into owns values('1','44');
insert into owns values('2','55');
insert into owns values('3','11');
insert into owns values('4','24');
insert into owns values('5','18');
select * from ACCIDENT;
insert into ACCIDENT values('99','2022-10-07','bangalore');
insert into ACCIDENT values('100','2022-11-24','bangalore');
insert into ACCIDENT values('102','2022-07-30','bangalore');
insert into ACCIDENT values('101','2022-02-11','bangalore');
insert into ACCIDENT values('103','2022-01-25','bangalore');
insert into PARTICIPANTS values('1','44','99','50000');
insert into PARTICIPANTS values('2','55','100','54000');
insert into PARTICIPANTS values('3','11','101','10000');
insert into PARTICIPANTS values('4','24','102','1000');
insert into PARTICIPANTS values('5','18','103','5000');
update PARTICIPANTS set damage_amt='11000' where report_number='101';
insert into ACCIDENT values('104','2022-08-12','chennai');
select count(date) from ACCIDENT where year(date)='2022';
commit;