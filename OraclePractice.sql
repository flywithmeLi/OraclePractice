/*学生表*/  
#drop table cocostudent;
create table cocostudent  
(  
    sno varchar2(10) primary key not null,  
    sname varchar2(20),  
    sage number(2),  
    ssex varchar2(5)  
)  
   
/*教?表*/  
create table cocoteacher   
(  
   tno varchar2(10) primary key,  
   tname varchar2(20)  
)   
  
/*?程表*/  
create table cococourse  
(  
    cno varchar2(10),  
    cname varchar2(20),  
    tno varchar2(20),  
    constraint pk_course primary key (cno,tno)  
)   
  
/*成?表*/  
create table cocosc   
(  
    sno varchar2(10),  
    cno varchar2(10),  
    score number(4,2),  
    constraint pk_sc primary key (sno,cno)  
) 
select * from cocostudent;
insert into cocostudent values ('s001','?三',23,'男');  
insert into cocostudent values ('s002','李四',23,'男');  
insert into cocostudent values ('s003','??',25,'男');  
insert into cocostudent values ('s004','琴沁',20,'女');  
insert into cocostudent values ('s005','王?',20,'女');  
insert into cocostudent values ('s006','李波',21,'男');  
insert into cocostudent values ('s007','?玉',21,'男');  
insert into cocostudent values ('s008','?蓉',21,'女');  
insert into cocostudent values ('s009','???',23,'女');  
insert into cocostudent values ('s010','?美',22,'女');  
#delete from cocostudent where sno='s001';


insert into cocoteacher values ('t001','??');  
insert into cocoteacher values ('t002','?燕');  
insert into cocoteacher values ('t003','胡明星');  
select * from cocoteacher;
#delete from cocoteacher where tno='t001';


/*初始化?程表  course*/  
insert into cococourse values ('c001','J2SE','t002');   
insert into cococourse values ('c002','Java Web','t002');  
insert into cococourse values ('c003','SSH','t001');  
insert into cococourse values ('c004','Oracle','t001');  
insert into cococourse values ('c005','SQL SERVER 2005','t003');  
insert into cococourse values ('c006','C#','t003');  
insert into cococourse values ('c007','JavaScript','t002');  
insert into cococourse values ('c008','DIV+CSS','t001');  
insert into cococourse values ('c009','PHP','t003');  
insert into cococourse values ('c010','EJB3.0','t002');  

select * from cococourse;

/*初始化成?表  sc*/  
insert into cocosc values ('s001','c001',78.9);  
insert into cocosc values ('s002','c001',80.9);  
insert into cocosc values ('s003','c001',81.9);  
insert into cocosc values ('s004','c001',60.9);  
insert into cocosc values ('s001','c002',82.9);  
insert into cocosc values ('s002','c002',72.9);   
  
insert into cocosc values ('s005','c003',78.9);  
insert into cocosc values ('s006','c004',50.9);  
insert into cocosc values ('s007','c005',81.9);  
insert into cocosc values ('s008','c006',50.9);  
insert into cocosc values ('s005','c007',42.9);  
insert into cocosc values ('s006','c008',72.9);   
insert into cocosc values ('s005','c009',52.9);  
insert into cocosc values ('s006','c010',92.9);  
select * from cocosc;


/*1、??“c001”?程比“c002”?程成?高的所有学生的学号；*/   
#解决?法1 将的\所有学生加?列成?最后用where ?句?出 002?程比001 少的所有人的学号
select * from cocosc where cno='c001';
select * from cocosc where cno='c002';
/*
#方法一 
select sno from 
(select table1.sno,table1.score1,table2.score2 from (select sno,score score1 from cocosc where cno='c001') table1
inner join (select sno,score score2 from cocosc where cno='c002') table2
on table1.sno=table2.sno)table3 
where table3.score1>table3.score2;
*/

#方法二 
/*
select distinct table1.sno  
from cocosc table1
where (select score from cocosc table2 where table2.sno=table1.sno and table2.cno='c001')>
(select score from cocosc table3 where table3.sno=table1.sno and table3.cno='c002')      
*/


