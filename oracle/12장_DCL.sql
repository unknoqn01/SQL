-- DCL : 데이터 제어어 (데이터베이스 사용권한을 주고 회수하는 명령어)

--테이블스페이스의 생성 (테이블을 생성할 수 있는 공간)
create tablespace johnSpace
datafile 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' size 10m
autoextend on next 5m; 
--파일이름 jhon.dbf에 10mb 사이즈로 파일 생성, 자동으로 5mb씩 증가

-- 새 유저 존 생성, 비밀번호 1234, 테이블스페이스 johnSpace 사용
create user john identified by 1234 default tablespace johnSpace;

-- 존에게 접속권한주기
grant create session to john;

-- 존에게 테이블 만들기 권한 주기
grant create table to john;

-- 롤(권한들의 모음)을 주기, connect는 접속관련 권한, resource는 테이블 및 객체 사용 권한
grant connect, resource to john;

-- DBA 롤은 관리자권하들이기 때문에 주지 않는다

-- 권한을 제거 reovoke 명령어
-- 유저 존에 테이블생성, 객체 관련 모든 권한 제거
revoke create table , resource from john;

revoke connect from john;

-- 계정 삭제 (접속중에 안되므로 접속해제 한 후에 삭제)
drop user john cascade;

-- 테이블스페이스 삭제
drop tablespace johnSpace;

-- 계정에 비밀번호 변경: 스콧계정의 비번을 tiger로 변경
alter user scott identified by "tiger";

-- 현재 오라클 서버의 포트번호를 확인
select dbms_xdb.gethttpport() from dual;

-- 나중에 톰캣 프로그램을 설치하면 이 서버는 똑같이 기본 8080이기 때문에 포트가 같아서 에러 발생

-- 오라클의 포트 9090으로 바꿔보자
exec dbms_xdb.sethttpport(9090);
commit;



