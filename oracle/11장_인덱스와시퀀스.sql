-- 인덱스

-- 인덱스 조회하기
SELECT *
FROM ALL_IND_COLUMNS
WHERE table_name = 'MEMBERS';

-- 새 테이블 만들기
DROP TABLE members;
CREATE TABLE members (
    member_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    gender VARCHAR2(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL
);
SELECT * FROM members order by member_id;    
    
-- 일반 열을 검색하기 이름이 하스인 사람
SELECT * FROM members WHERE last_name = 'Harse';

-- 아래의 쿼리문의 실행보고서를 작성한다.
EXPLAIN PLAN FOR
SELECT * FROM members WHERE last_name = 'Harse';

-- 저장된 실행보고서를 읽기
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

-- 인덱스 만들기
CREATE INDEX members_last_name_i ON members(last_name);
    
-- 인덱스 삭제 
DROP INDEX members_last_name_i;


-- 멀티 인덱스 만들기
CREATE INDEX members_name_i ON members(first_name, last_name);    

SELECT * FROM members WHERE last_name LIKE 'A%' AND first_name LIKE 'M%';

EXPLAIN PLAN FOR
SELECT * FROM members WHERE last_name LIKE 'A%' AND first_name LIKE 'M%';    
    
-- 저장된 실행보고서를 읽기
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

-- 시퀸스
create sequence 시퀀스1;
drop SEQUENCE 시퀀스1;

select * from user_sequences where sequence_name = '시퀀스1';

--시퀀스 테스트 (이름.nextval => 증가하는 값이 리턴)
select 시퀀스1.nextval from dual;

create table 부서_테스트 (
    부서번호 number primary key,
    부서이름 VARCHAR2(100)
);

insert into 부서_테스트 (부서번호, 부서이름) values (시퀀스1.nextval, '영업부');
insert into 부서_테스트 (부서번호, 부서이름) values (시퀀스1.nextval, '개발부');

select * from 부서_테스트;

drop table 부서_테스트;

--시퀀스 값은 증가시키지 않고 현재 값을 알고 싶을때 (이름.currval)
select 시퀀스1.CURRVAL from dual;

-- 시퀀스 옵션 시작값 10 부터 증가는 20
drop sequence 시퀀스2;
create sequence 시퀀스2
start with 10
INCREMENT by 20;

--시퀀스 확인
select * from user_sequences where sequence_name = '시퀀스2';

--입력
insert into 부서_테스트 (부서번호, 부서이름) values (시퀀스2.nextval, '마케팅부');
insert into 부서_테스트 (부서번호, 부서이름) values (시퀀스2.nextval, '교육부');
insert into 부서_테스트 (부서번호, 부서이름) values (시퀀스2.nextval, '경영부');
select * from 부서_테스트 order BY 부서번호;

--시퀀스로 업데이트
UPDATE 부서_테스트 SET 부서번호 = 시퀀스2.nextval;

-- 시퀀스2의 증가값을 2로 수정해보자 (시작값은 수정불가) 
alter sequence 시퀀스2
increment by 2;
