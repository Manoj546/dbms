create database order_82;
use order_82;
create table CUSTOMER (custid  int, cname varchar(20), city varchar(20), primary key(custid));
create table ORDERS (orderid  int, odate date, custid  int, ord_Amt int,primary key(orderid), foreign key (custid) references CUSTOMER(custid));
create table ITEM (itemno  int, unit_price int,primary key(itemno));
create table ORDERITEM (orderid  int, itemno  int, qty int, primary key(orderid,itemno), foreign key (orderid) references orders(orderid),foreign key (itemno) references item(itemno));
create table WAREHOUSE (warehouseno  int, city varchar(20), primary key(warehouseno));
create table SHIPMENT (orderid  int, warehouseno  int, ship_date date, primary key(orderid,warehouseno), foreign key (orderid) references orders(orderid), foreign key (warehouseno) references warehouse(warehouseno));
commit;