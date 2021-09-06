create database guvi;
use guvi;
create table users (user_name varchar(30),user_email varchar(30),user_id integer(10));
create table codekata (question_no integer(5),user_id integer(10));
create table attendance (user_id integer(10),today date,present varchar(1));
create table topics (topic_id varchar(5),topic_name varchar(10));
create table task (task_id varchar(10),task_name varchar (20));
create table company_drives(company_name varchar(20),salary float(10));
create table mentors(mentors_name varchar(20),mentors_id varchar(10));
create table students_activated_courses(users_id integer(10),course_name varchar(20),course_id varchar(10));
create table courses(courses_name varchar(20),courses_id varchar(10));

create table drives(user_id integer(10),company_name varchar(20));
create table mentor_assignment(mentors_id varchar(10),user_id integer(10));

insert into users (user_name,user_email,user_id) values ('Steve Rogers','steve@gmail.com',1) , ('Tony Stark','tony@gmail.com',2) , ('Bruce Banner','bruce@gmail.com',3),('Thor','thor@gmail.com',4),('Natasha','natasha@gmail.com',5);
insert into codekata (question_no,user_id) values(1,1),(2,1),(3,2),(4,3),(5,4),(6,5);
insert into attendance (user_id,today,present) values (1,sysdate(),'Y'),(2,sysdate(),'Y'),(3,sysdate(),'Y'),(4,sysdate(),'N'),(5,sysdate(),'Y');
insert into topics  values ('1','JAVA'),('2','JDBC'),('3','SpringBoot'),('4','Spring'),(5,'DBMS');
insert into task values('1','JAVA TASK'),('2','JDBC TASK'),('3','SpringBoot TASK'),('4','Spring TASK'),('4','DBMS TASK');
insert into company_drives values ('Microsoft',1000),('Chubb',2000),('Amazon',3000),('Flipkart',4000),('Highradius',5000);
insert into mentors values('Venkat',1),('Ashish',2),('Tapas',3),('Biswa',4),('Shuvam',5);
insert into students_activated_courses values(1,'JAVA','1'),(2,'JDBC','2'),(1,'SpringBoot','3'),(3,'Spring','4'),(4,'DBMS','5');
insert into courses values('JAVA Course',1),('JDBC Course',2),('Spring boot course',3),('Spring course',4),('DBMS Course',5);

insert into drives values(1,'Amazon'),(2,'Microsoft'),(3,'highradius'),(4,'Chubb'),(5,'Amazon'),(2,'Chubb');
insert into mentor_assignment values(1,1),(2,1),(3,2),(4,3),(5,4),(5,5);

select question_no,count(*) from codekata group by user_id;

select company_name,count(*) from drives group by user_id;



select * from mentors;

select mentors_id,count(*) from mentor_assignment group by user_id;



