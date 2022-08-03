create database order_82;
use order_82;
create table CUSTOMER (custid  int, cname varchar(20), city varchar(20), primary key(custid));
create table ORDERS (orderid  int, odate date, custid  int, ord_Amt int,primary key(orderid), foreign key (custid) references CUSTOMER(custid));
create table ITEM (ITEMno  int, unit_price int,primary key(ITEMno));
create table ORDERITEM (orderid  int, ITEMno  int, qty int, primary key(orderid,ITEMno), foreign key (orderid) references orders(orderid),foreign key (ITEMno) references ITEM(ITEMno));
create table WAREHOUSE (WAREHOUSEno  int, city varchar(20), primary key(WAREHOUSEno));
create table SHIPMENT (orderid  int, WAREHOUSEno  int, ship_date date, primary key(orderid,WAREHOUSEno), foreign key (orderid) references orders(orderid), foreign key (WAREHOUSEno) references WAREHOUSE(WAREHOUSEno));
commit;

insert into CUSTOMER values(1, 'Sai Ganesh S', 'Ballari');
insert into CUSTOMER values(2, 'Rahul', 'Bengaluru');
insert into CUSTOMER values(3, 'Rohit', 'Mysuru');
insert into CUSTOMER values(4, 'John', 'Chennai');
insert into CUSTOMER values(5, 'Prateek', 'Delhi');

insert into ORDERS values(1, '2022-06-26', 2, 200);
insert into ORDERS values(2, '2021-12-13', 1, 1000);
insert into ORDERS values(3, '2022-03-04', 3, 500);
insert into ORDERS values(4, '2021-08-14', 5, 700);
insert into ORDERS values(5, '2022-06-11', 4, 1200);
insert into ORDERS values(6, '2022-07-13', 1, 500);

insert into ITEM values(1, 1000);
insert into ITEM values(2, 500);
insert into ITEM values(3, 500);
insert into ITEM values(4, 700);
insert into ITEM values(5, 1200);

insert into ORDERITEM values(1, 3, 1);
insert into ORDERITEM values(1, 4, 2);
insert into ORDERITEM values(2, 3, 1);
insert into ORDERITEM values(3, 3, 3);
insert into ORDERITEM values(5, 1, 2);

insert into WAREHOUSE values(1, 'Bengaluru');
insert into WAREHOUSE values(2, 'Mysuru');
insert into WAREHOUSE values(3, 'Delhi');
insert into WAREHOUSE values(4, 'Chennai');
insert into WAREHOUSE values(5, 'Ballari');
insert into WAREHOUSE values(6, 'Ballari');

insert into SHIPMENT values(1, 2, '2022-06-12');
insert into SHIPMENT values(2, 5, '2022-08-17');
insert into SHIPMENT values(4, 4, '2022-02-05');
insert into SHIPMENT values(5, 2, '2022-01-24');
insert into SHIPMENT values(3, 1, '2022-06-16');

