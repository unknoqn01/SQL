select dbms_xdb.gethttpport() from dual;

exec dbms_xdb.sethttpport(8080);

create user ORCLSTUDY  identified by oracle;

grant connect,create table, resource to ORCLSTUDY;

revoke connect from ORCLSTUDY;

alter user ORCLSTUDY identified by orcl;

drop user ORCLSTUDY;

create table EMP_DDL (
    EMPNO   NUMBER(4) primary key,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);

desc EMP_DDL;

alter table EMP_DDL RENAME TO EMP_ALTER;

select * from EMP_ALTER;

alter table EMP_ALTER ADD (HP VARCHAR2 (20));

select * from EMP_ALTER;

alter table EMP_ALTER 
rename column HP to TEL;

alter table EMP_ALTER modify (EMPNO number(5));

desc emp_alter;

alter table emp_alter 
drop COLUMN TEL;

select * from emp_alter;

drop table emp_alter;
desc emp_alter;

create index IDX_EMP_SAL on emp(sal); 

select * from USER_IND_COLUMNS;

drop index IDX_EMP_SAL;

grant create view to scott;
revoke create view from scott;
