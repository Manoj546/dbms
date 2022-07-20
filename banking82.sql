create database banking_82;
use banking_82;
show tables;
create table BRANCH (
branch_name varchar(15), 
branch_city varchar(15),
assets FLOAT
);
ALTER TABLE BRANCH
ADD CONSTRAINT PK_Baranchname PRIMARY KEY (branch_name);
create table ACCOUNT (
acc_no int,
branch_name varchar(15),
balance FLOAT
);
ALTER TABLE ACCOUNT
ADD CONSTRAINT PK_accno PRIMARY KEY (acc_no);
ALTER TABLE ACCOUNT
ADD CONSTRAINT FK_branch_name FOREIGN KEY (branch_name) references BRANCH(branch_name);
create table DEPOSITOR (
customer_name varchar(15),
acc_no int
);
ALTER TABLE DEPOSITOR
ADD CONSTRAINT PK_customer_details PRIMARY KEY (customer_name,acc_no);
ALTER TABLE DEPOSITOR
ADD CONSTRAINT FK_acc_no FOREIGN KEY (acc_no) references ACCOUNT(acc_no); 
CREATE TABLE CUSTOMER(
customer_name varchar(15),
customer_street VARCHAR(15),
city varchar(15)
);
ALTER TABLE CUSTOMER
ADD CONSTRAINT FK_customer_name FOREIGN KEY (customer_name) references DEPOSITOR(customer_name);
alter table CUSTOMER
add constraint PK_customer_name primary key (customer_name);
create table LOAN(
loan_number int,
branch_name varchar(15),
amount real
); 
alter table LOAN
add constraint PK_loan_number primary key (loan_number);
create table BORROWER(
customer_name varchar(15),
loan_number int
);
alter table BORROWER
add constraint PK_borrower primary key (customer_name,loan_number);
ALTER TABLE BORROWER
ADD CONSTRAINT FK_custome_name FOREIGN KEY (customer_name) references CUSTOMER(customer_name);
ALTER TABLE BORROWER
ADD CONSTRAINT FK_loanno FOREIGN KEY (loan_number) references LOAN(loan_number);
commit;

insert into branch values("cbank","blr","1200.9"); 
insert into branch values("dbank","blr","1.1");
insert into branch values("ebank","blr","12.1");
insert into branch values("fbank","blr","12.9");
insert into branch values("gbank","blr","10.9");
select * from BRANCH;
insert into account values("112233","cbank","45000");
insert into account values("112333","dbank","15000");
insert into account values("112433","dbank","36000");
insert into account values("112533","ebank","5000");
insert into account values("112633","fbank","4000");
select * from account;
insert into depositor values("uday","112233");
insert into depositor values("suraj","112333");
insert into depositor values("lokesh","112433");
insert into depositor values("mouneash","112533");
insert into depositor values("amarnath","112633");
select * from depositor;
insert into customer values("uday","bb","rcr");
insert into customer values("suraj","cc","blr");
insert into customer values("lokesh","dd","ble");
insert into customer values("mouneash","ee","rcr");
insert into customer values("amarnath","ff","mys");
select * from customer;
insert into loan values("1","cbank","1000");
insert into loan values("2","dbank","2000");
insert into loan values("3","dbank","3000");
insert into loan values("4","ebank","4000");
insert into loan values("5","fbank","5000");
select * from loan;
insert into borrower values("uday","1");
insert into borrower values("suraj","2");
insert into borrower values("lokesh","3");
insert into borrower values("mouneash","4");
insert into borrower values("amarnath","5");
select * from borrower;
commit;

select customer_name from DEPOSITOR
where acc_no in (select acc_no from account
where branch_name in(select branch_name from branch where branch_city='blr'));

delete from account 
where branch_name in(select branch_name from branch where branch_city='blr');
