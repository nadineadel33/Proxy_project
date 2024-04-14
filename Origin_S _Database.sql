create database Origin_S;
show databases;
use Origin_S;
show tables;
use Origin_S;
create table customer(
customer_id int not null auto_increment,
customer_name varchar(20),
customer_num  int not null,
customer_address varchar(30) not null,
customer_devnum int ,
Administrator_id int,
constraint customer_pk primary key (customer_id));


create table Administrator(
Administrator_id int not null auto_increment,
Administrator_name varchar(20),
Administrator_num  int not null,
Administrator_address varchar(30) not null,
Administrator_salary float,
constraint Administrator_pk primary key (Administrator_id));

create table Specialist(
Specialist_id int not null auto_increment,
Specialist_name varchar(20),
Specialist_num  int not null,
Specialist_address varchar(30) not null,
Specialist_salary float,
constraint Specialist_pk primary key (Specialist_id));

create table Panel(
Panel_id int not null auto_increment,
Expire_Date date not null,
Produce_Date date not null,
Panel_cost float,
Panel_size decimal(10,2),
Specialist_id int,
Administrator_id int,
customer_id int,
constraint Panel_pk primary key (Panel_id),
constraint Panel_fk1 foreign key (Specialist_id) references Specialist (Specialist_id),
constraint Panel_fk2 foreign key (customer_id) references customer (customer_id),
constraint Panel_fk3 foreign key (Administrator_id ) references Administrator (Administrator_id ));

create table Battery(
Battery_id int not null auto_increment,
Expire_Date date not null,
Produce_Date date not null,
Battery_cost float,
Battery_size decimal(10,2),
Battery_capacity float,
customer_id int,
constraint Battery_pk primary key (Battery_id),
constraint Battery_fk foreign key (customer_id) references customer (customer_id));

create table Bank(
Payment_id int not null auto_increment,
Pass int not null unique ,
Card_info int not null unique,
Administrator_id int, 
customer_id int,
constraint Bank_pk primary key (Payment_id),
constraint Bank_fk1 foreign key (Administrator_id ) references Administrator (Administrator_id ),
constraint Bank_fk2 foreign key (customer_id) references customer (customer_id));

alter table customer 
add constraint customer_fk foreign key (Administrator_id) references Administrator (Administrator_id );
