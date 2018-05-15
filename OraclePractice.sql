/*�w���\*/  
#drop table cocostudent;
create table cocostudent  
(  
    sno varchar2(10) primary key not null,  
    sname varchar2(20),  
    sage number(2),  
    ssex varchar2(5)  
)  
   
/*��?�\*/  
create table cocoteacher   
(  
   tno varchar2(10) primary key,  
   tname varchar2(20)  
)   
  
/*?���\*/  
create table cococourse  
(  
    cno varchar2(10),  
    cname varchar2(20),  
    tno varchar2(20),  
    constraint pk_course primary key (cno,tno)  
)   
  
/*��?�\*/  
create table cocosc   
(  
    sno varchar2(10),  
    cno varchar2(10),  
    score number(4,2),  
    constraint pk_sc primary key (sno,cno)  
) 
select * from cocostudent;
insert into cocostudent values ('s001','?�O',23,'�j');  
insert into cocostudent values ('s002','���l',23,'�j');  
insert into cocostudent values ('s003','??',25,'�j');  
insert into cocostudent values ('s004','�՟�',20,'��');  
insert into cocostudent values ('s005','��?',20,'��');  
insert into cocostudent values ('s006','���g',21,'�j');  
insert into cocostudent values ('s007','?��',21,'�j');  
insert into cocostudent values ('s008','?�u',21,'��');  
insert into cocostudent values ('s009','???',23,'��');  
insert into cocostudent values ('s010','?��',22,'��');  
#delete from cocostudent where sno='s001';


insert into cocoteacher values ('t001','??');  
insert into cocoteacher values ('t002','?��');  
insert into cocoteacher values ('t003','�Ӗ���');  
select * from cocoteacher;
#delete from cocoteacher where tno='t001';


/*���n��?���\  course*/  
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

/*���n����?�\  sc*/  
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


/*1�A??�gc001�h?����gc002�h?����?���I���L�w���I�w���G*/   
#��r?�@1 ���I\���L�w����?��?�ō@�pwhere ?��?�o 002?����001 ���I���L�l�I�w��
select * from cocosc where cno='c001';
select * from cocosc where cno='c002';
/*
#���@�� 
select sno from 
(select table1.sno,table1.score1,table2.score2 from (select sno,score score1 from cocosc where cno='c001') table1
inner join (select sno,score score2 from cocosc where cno='c002') table2
on table1.sno=table2.sno)table3 
where table3.score1>table3.score2;
*/

#���@�� 
/*
select distinct table1.sno  
from cocosc table1
where (select score from cocosc table2 where table2.sno=table1.sno and table2.cno='c001')>
(select score from cocosc table3 where table3.sno=table1.sno and table3.cno='c002')      
*/


