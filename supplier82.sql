create database supplier_82;
use supplier_82;
create table supplier(Sid int, Sname varchar(15), Address varchar(25));
alter table supplier add constraint PK_Sid primary key(Sid);
create table parts(Pid int, Pname varchar(15), Color varchar(10));
alter table parts add constraint PK_Pid primary key(Pid);
create table catalog(Sid int, Pid int, Cost real);
alter table catalog add constraint FK_Sid foreign key(Sid) references supplier(Sid) on delete cascade on update cascade;
alter table catalog add constraint FK_Pid foreign key(Pid) references parts(Pid) on delete cascade on update cascade;

insert into supplier values ('1','aa','blr'),('2','bb','blr'),('3','cc','blr'),('4','dd','blr'),('5','ee','blr');

insert into parts values ('11','aa','blue'),('22','bb','green'),('33','ccc','yellow'),('44','ee','grey'),('55','ff','black');

insert into catalog values ('1','11',5000),('1','22',6000),('2','33',1000);
insert into catalog values ('1','33',1000);
insert into catalog values ('1','33',5000),('1','44',6000),('2','55',1000);

select Pname from catalog, parts where parts.pid=catalog.pid;
commit;