{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0  \
-- get age of dogs\
select dog_name, cast((sysdate-dog_dob)/365.25 as decimal(2,1)) as age\
from dog_t\
\
-- return dogs younger than 2 years old\
-- these dogs require kennel cough booster every 6 months\
select dog_name, cast((sysdate-dog_dob)/365.25 as decimal(2,1)) as age\
from dog_t\
where (sysdate-dog_dob)/365.25 < 2\
\
-- select employee names\
select user_name\
from user_t\
inner join employee_t\
on user_t.user_id = employee_t.employee_id\
\
-- list employees and their skills\
select user_t.user_name, skill_t.skill_description\
from (((user_t\
inner join employee_t\
on user_t.user_id = employee_t.employee_id)\
inner join employee_skill_t\
on employee_t.employee_id = employee_skill_t.employee_id)\
inner join skill_t\
on employee_skill_t.skill_id = skill_t.skill_id)\
\
\
-- select names of employees who can groom\
select user_t.user_name, skill_t.skill_description\
from (((user_t\
inner join employee_t\
on user_t.user_id = employee_t.employee_id)\
inner join employee_skill_t\
on employee_t.employee_id = employee_skill_t.employee_id)\
inner join skill_t\
on employee_skill_t.skill_id = skill_t.skill_id)\
where skill_t.skill_description = 'Grooming'\
\
-- select dogs and their owner\
select user_t.user_name, dog_t.dog_name\
from (((dog_t\
inner join client_dog_t\
on dog_t.dog_id = client_dog_t.dog_id)\
inner join client_t\
on client_dog_t.client_id = client_t.client_id)\
inner join user_t\
on client_t.client_id = user_t.user_id)\
\
-- how many dogs does each owner have\
select user_t.user_name, count(dog_t.dog_id)\
from (((dog_t\
inner join client_dog_t\
on dog_t.dog_id = client_dog_t.dog_id)\
inner join client_t\
on client_dog_t.client_id = client_t.client_id)\
inner join user_t\
on client_t.client_id = user_t.user_id)\
group by user_t.user_name\
\
-- show appointments \
select dog_t.dog_name, appt_t.appt_date, appt_t.appt_time, service_t.service_description, user_t.user_name as employee\
from ((((dog_t\
inner join appt_t\
on dog_t.dog_id = appt_t.dog_id)\
inner join service_t\
on service_t.service_id = appt_t.service_id)\
inner join employee_t\
on appt_t.employee_id = employee_t.employee_id)\
inner join user_t\
on employee_t.employee_id = user_t.user_id)\
\
-- show vaccines for dog Tink\
select dog_t.dog_name, vaccine_t.vaccine_description, dog_vaccine_t.vaccine_date\
from ((dog_t\
inner join dog_vaccine_t\
on dog_t.dog_id = dog_vaccine_t.dog_id)\
inner join vaccine_t\
on dog_vaccine_t.vaccine_id = vaccine_t.vaccine_id)\
where dog_t.dog_name = 'Tink'\
\
\pard\pardeftab720\ri0\partightenfactor0
\cf0 -- return how much to pay each employee per appointment\
select user_t.user_name as employee, employee_t.employee_payrate, dog_t.dog_name, appt_t.appt_date, appt_t.appt_time, service_t.service_description, service_t.service_duration, employee_t.employee_payrate*service_t.service_duration as pay\
from ((((dog_t\
inner join appt_t\
on dog_t.dog_id = appt_t.dog_id)\
inner join service_t\
on service_t.service_id = appt_t.service_id)\
inner join employee_t\
on appt_t.employee_id = employee_t.employee_id)\
inner join user_t\
on employee_t.employee_id = user_t.user_id)\
order by user_t.user_name\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 \
\
}