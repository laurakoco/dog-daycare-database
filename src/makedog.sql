{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \
\
create table user_t\
(user_id varchar2(5),\
user_name varchar2(25),\
user_street varchar2(30),\
user_city varchar2(20),\
user_state char(2),\
user_zip varchar2(9),\
user_phone varchar(10), -- only us phone numbers\
user_email varchar(40),\
user_pw varchar(20),\
constraint user_pk primary key (user_id));\
\
create table employee_t\
(employee_id varchar2(5),\
employee_payrate number(4,2), -- hourly wage\
constraint employee_pk primary key (employee_id),\
constraint employee_fk foreign key (employee_id) references user_t(user_id));\
\
create table emerg_t\
(emerg_id varchar2(5),\
emerg_name varchar2(25),\
emerg_street varchar2(30),\
emerg_city varchar2(20),\
emerg_state char(2),\
emerg_zip varchar2(9),\
emerg_phone varchar(10), -- assume only us phone numbers\
emerg_email varchar(40),\
constraint emerg_pk primary key (emerg_id));\
\
create table client_t\
(client_id varchar2(5),\
emerg_id varchar2(5),\
constraint client_pk primary key (client_id),\
constraint client_fk1 foreign key (client_id) references user_t(user_id),\
constraint client_fk2 foreign key (emerg_id) references emerg_t(emerg_id));\
\
create table dog_t\
(dog_id varchar2(5),\
dog_name varchar2(25),\
dog_breed varchar2(25),\
dog_color varchar(25),\
dog_weight number(3,1),\
dog_dob date,\
constraint dog_pk primary key (dog_id));\
\
--dog client JUNCTION table\
create table client_dog_t\
(client_id varchar2(5),\
dog_id varchar2(5),\
constraint client_dog_pk primary key (client_id, dog_id),\
constraint client_dog_fk1 foreign key (client_id) references client_t(client_id),\
constraint client_dog_fk2 foreign key (dog_id) references dog_t(dog_id));\
\
-- skills table\
create table skill_t\
(skill_id varchar2(2),\
skill_description varchar2(25),\
constraint skill_pk primary key (skill_id));\
\
-- employee skill JUNCTION table\
create table employee_skill_t\
(employee_id varchar2(5),\
skill_id varchar(2),\
constraint employee_skill_pk primary key (employee_id, skill_id),\
constraint employee_skill_fk1 foreign key (employee_id) references employee_t(employee_id),\
constraint employee_skill_fk2 foreign key (skill_id) references skill_t(skill_id));\
\
create table service_t\
(service_id varchar2(2),\
service_description varchar2(25),\
service_price number(5,2),\
service_duration number(4,2), -- hours\
constraint service_pk primary key (service_id));\
\
create table appt_t\
(appt_id varchar2(5),\
appt_date date,\
appt_time varchar2(10),\
dog_id varchar2(5),\
employee_id varchar2(5),\
service_id varchar2(2),\
constraint appt_pk primary key (appt_id),\
constraint appt_fk1 foreign key (dog_id) references dog_t(dog_id),\
constraint appt_fk2 foreign key (employee_id) references employee_t(employee_id),\
constraint appt_fk3 foreign key (service_id) references service_t(service_id)); \
\
create table vaccine_t\
(vaccine_id varchar2(2),\
vaccine_description varchar2(25),\
constraint vaccine_pk primary key (vaccine_id));\
\
create table dog_vaccine_t\
(dog_id varchar2(5),\
vaccine_id varchar2(2),\
vaccine_date date,\
constraint dog_vaccine_pk primary key (dog_id, vaccine_id),\
constraint dog_vaccine_fk1 foreign key (dog_id) references dog_t(dog_id),\
constraint dog_vaccine_fk2 foreign key (vaccine_id) references vaccine_t(vaccine_id));\
}