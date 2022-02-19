create database Hyper_Market_System

create table employees
(employee_id int primary key identity(1,1),
employee_name nvarchar(50) NOT NULL,
employee_age int NOT NULL,
employee_addres nvarchar(50) NOT NULL,
employee_phoneNumber int NOT NULL,
employee_salary int NOT NULL,
gender VARCHAR(10) NOT NULL, check (gender = 'female' or gender='male'),
user_name nvarchar(20) foreign key references admin_login (user_name) on delete cascade on update cascade)

create table product
(product_id int primary key identity(1,1),
product_name nvarchar (50) NOT NULL,
product_amount int NOT NULL,
product_prices int NOT NULL,
product_expirydate date NOT NULL,
user_name nvarchar(20) foreign key references admin_login (user_name) on delete cascade on update cascade,
username nvarchar(20) foreign key references employee_login (user_name) on delete cascade on update cascade,
userSName nvarchar(20) foreign key references customar_login (user_name) on delete cascade on update cascade)

create table customar
(customar_id int primary key identity(1,1),
customar_name nvarchar(50) NOT NULL,
customar_age int NOT NULL,
custromar_phoneNumpere int NOT NULL,
gender VARCHAR(10) NOT NULL check (gender = 'female' or gender='male'),
customar_addres nvarchar(50) NOT NULL,
user_name nvarchar(20) foreign key references customar_login (user_name) on delete cascade on update cascade)

create table reports
(employee_id int foreign key references employees(employee_id),
product_id int foreign key references product(product_iD),
texet_reporte text NOT NULL,
username nvarchar(20) foreign key references admin_login (user_name) )

create table sell
(reset_number int primary key identity(1,1),
visa_number int NOT NULL, 
product_id int foreign key references product(product_id),
customar_id int foreign key references customar(customar_id)on delete cascade on update cascade)

create table offer
(offer_id int primary key identity(1,1),
date_of_offer date not null,
number_of_offer_day int not null,
persentage_offer int not null,
employee_id int foreign key references employees(employee_id),
product_id int foreign key references product(product_id),
user_name nvarchar(20) foreign key references admin_login (user_name))

create table admin_login
(user_name nvarchar(20) primary key not null,
pass int unique not null)


create table employee_login
(user_name nvarchar(20) primary key not null,
pass int unique not null)


create table customar_login
(user_name nvarchar(20) primary key not null,
pass int unique not null)