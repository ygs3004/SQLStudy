create table userTBL(
userID char(8) not null primary key,
userName nvarchar2(10)  not null,
birthYear number(4) not null,
addr nchar(2) not null,
mobile1 char(3),
mobile2 char(8),
height number(3),
mDate date
);

create table buyTBL(
idNum number(8) not null primary key,
userID char(8) not null,
prodName nchar(6) not null,
groupName nchar(4),
price number(8) not null,
amount number(3) not null,
foreign key(userID) references userTBL(userID)
);

insert into userTBL values('LSG','이승기',1987,'서울','011','11111111',182,'2008-8-8');
insert into userTBL values('KBS','김범수',1979,'경남','011','22222222',173,'2012-4-4');
insert into userTBL values('KKH','김경호',1971,'전남','011','33333333',177,'2007-7-7');
insert into userTBL values('JYP','조용필',1950,'경기','011','44444444',166,'2009-4-4');
insert into userTBL values('SSK','성시경',1979,'서울',null,null,186,'2013-12-12');
insert into userTBL values('LJB','임재범',1963,'서울','016','66666666',182,'2009-9-9');
insert into userTBL values('YJS','윤종신',1969,'경남',null,null,170,'2005-5-5');
insert into userTBL values('EJW','은지원',1972,'경북','011','88888888',174,'2014-3-3');
insert into userTBL values('JKW','조관우',1965,'경기','018','99999999',172,'2010-10-10');
insert into userTBL values('BBK','바비킴',1973,'서울','010','00000000',176,'2013-5-5');

select * from userTBL;
delete from userTBL;
select  * from userTBL;

create sequence idSEQ;
insert into buyTBL values(idSEQ.nextval, 'KBS', '운동화', null, 30, 2);
insert into buyTBL values(idSEQ.nextval, 'KBS', '노트북', '전자', 1000, 1);
insert into buyTBL values(idSEQ.nextval, 'JYP', '모니터', '전자', 200, 1);
insert into buyTBL values(idSEQ.nextval, 'BBK', '모니터', '전자', 200, 5);
insert into buyTBL values(idSEQ.nextval, 'KBS', '청바지', '의류', 50, 3);
insert into buyTBL values(idSEQ.nextval, 'BBK', '메모리', '전자', 80, 10);
insert into buyTBL values(idSEQ.nextval, 'SSK', '책', '서적', 15, 5);
insert into buyTBL values(idSEQ.nextval, 'EJW', '책', '서적', 15, 2);
insert into buyTBL values(idSEQ.nextval, 'EJW', '청바지', '의류', 50, 1);
insert into buyTBL values(idSEQ.nextval, 'BBK', '운동화', null, 30, 2);
insert into buyTBL values(idSEQ.nextval, 'EJW', '책', '서적', 15, 1);
insert into buyTBL values(idSEQ.nextval, 'BBK', '운동화', null, 30, 2);

drop sequence idSEQ;
delete from buyTBL;
drop table buyTBL;
select * from buyTBL;

commit;

select * from buyTBL;
select * from userTBL;

select * from userTBL
where username='김경호';

--1970년 이후에 출생하고 신장이 182 이상인 사람의 아이디와 이름을 조회
select userID, userName from userTBL where birthYear >= 1970 and height >= 182;

--1970년 이후에 출생이거나 신장이 182 이상인 사람의 아이디와 이름을 조회
select userID, userName from userTBL where birthYear >= 1970 or height >= 182;

-- 키가 180~183인 사람 조회
select userName, height from userTBL where height >= 180 and height <=183;

-- between~and
select userName, height from userTBL where height between 180 and 183;

-- 지역이 '경남' '전남' '경북' 인 사람의 정보 조회
select userName, addr from userTBL where addr='경남' or addr='전남' or addr='경북';

-- 연속적인 (continuous) 값이 아닌 이산적인(discrete)값을 처리
select userName, addr from userTBL where addr in('경남','전남','경북');

-- 문자열의 내용을 검색 LIKE 연산자
-- 성이 '김'씨로 시작하는 모든 사람 조회
select userName, height from userTBL where userName like '김%';

-- 맨 앞글자가 한글자이고 그다음은 '종신'인 사람 조회
select userName, height from userTBL where userName like '_종신';

-- '조용필' '사용한 사람' '이용해 줘서 감사합니다'에 해당하는 쿼리 명령문(용자가 들어감)
select userName, height from userTBL where userName like '_용%';

-- 서브쿼리란 쿼리문 안에 또 쿼리문이 들어있는 구조이다
-- 김경호보다 키가 큰 사람의 이름과 키를 조회
select userName, height from userTBL where height > 177;

select userName, height from userTBL
where height > (select height from userTBL where userName='김경호');

-- 지역이 '경남' 사람의 키보다 키가 크거나 같은 사람을 조회
-- 김범수(키 173), 윤종신(키 170) => 비교대상이 모호 

-- 실행안됨
SELECT USERNAME, HEIGHT 
FROM USERTBL
WHERE HEIGHT >=  (SELECT HEIGHT FROM USERTBL WHERE ADDR='경남');

-- ANY : 다수의 비교값들 중 한개라도 만족하면 성공(OR)
SELECT USERNAME, HEIGHT 
FROM USERTBL
WHERE HEIGHT >=  ANY(SELECT HEIGHT FROM USERTBL WHERE ADDR='경남');

-- ALL : 다수의 비교값들을 모두 만족하면 성공(AND)
SELECT USERNAME, HEIGHT 
FROM USERTBL
WHERE HEIGHT >=  ALL(SELECT HEIGHT FROM USERTBL WHERE ADDR='경남');

-- 오름차순
SELECT USERNAME,MDATE 
FROM USERTBL ORDER BY MDATE;
-- 내림차순
SELECT USERNAME,MDATE
FROM USERTBL ORDER BY MDATE DESC;

SELECT USERNAME, HEIGHT
FROM USERTBL ORDER BY HEIGHT DESC, USERNAME ASC; --먼저 오는 순서로 정렬

SELECT ADDR FROM USERTBL 
ORDER BY ADDR;

-- 중복제거
SELECT DISTINCT ADDR FROM USERTBL;

-- CREATE TABLE 새로운 테이블 AS (SELECT 복사할 열 FROM 기존 테이블), 
--*PRIMARY KEY는 복사되지 않음*
CREATE TABLE buyTBL2 AS (SELECT * FROM BUYTBL);
SELECT * FROM BUYTBL2;

CREATE TABLE buyTBL3 AS (SELECT userID, prodName FROM buyTBL);
SELECT * FROM BUYTBL3;

--SUM() 집계함수
--[GROUPY BY 컬럼명] [HAVING 조건]
SELECT USERID, SUM(AMOUNT) FROM BUYTBL; --오류

-- AS : 별칭(ALIAS)
--SELECT USERID AS "사용자  아이디", SUM(AMOUNT) AS "총 구매개수" FROM BUY TBL GROUP BY USERID;
SELECT USERID AS "사용자 아이디", SUM(AMOUNT) AS "총 구매개수"
    FROM BUYTBL GROUP BY USERID;
    
-- AVG( )
-- 전체 구매자가 구매한 물품의 개수의 평균, 
SELECT AVG(AMOUNT) AS "평균 구매 개수" FROM BUYTBL;

--소숫점 조절 CAST(숫자 AS 변환할 형식)
SELECT CAST(AVG(AMOUNT) AS NUMBER(5, 3)) AS "평균 구매 개수" FROM BUYTBL;

--각 사용자 별로 한 번 구매 시 물건을 평균적으로 몇 개 구매했는지 조회
SELECT USERID, CAST(AVG(AMOUNT) AS NUMBER(5, 3)) AS "평균 구매 개수" FROM BUYTBL GROUP BY USERID;

-- 가장 큰 키와 가장 작은 키의 회원 이름과 키를 조회
SELECT USERNAME, HEIGHT
FROM USERTBL
WHERE HEIGHT = (SELECT MAX(HEIGHT) FROM USERTBL)
        OR HEIGHT = (SELECT MIN(HEIGHT) FROM USERTBL);
 count()
 selct count(8) from user tbl
 
 -- 휴대폰이 있는 회원만 카운트
 -- 컬럼의 값이 null이면 카운트 하지 안흔다.;
 SELECT COUNT(MOBILE1) AS "휴대폰이 있는 사용자" FROM USERTBL;
 
 SELECT USERID AS "사용자 아이디", SUM(PRICE*AMOUNT) AS "총 구매액"
 FROM BUYTBL
 GROUP BY USERID;
 
 -- 총 구매액이 1000이상인 사용자
 -- 집계 함수는 WHERE 절에 사용할 수 없다. -> HAVING으로 조건
 SELECT USERID AS "사용자 아이디", SUM(PRICE*AMOUNT) AS "총 구매액"
 FROM BUYTBL
 GROUP BY USERID
 HAVING SUM(PRICE * AMOUNT) > 1000;
 
 CREATE TABLE TESTTBL1(ID NUMBER(4), USERNAME NCHAR(3), AGE NUMBER(2));
 INSERT INTO TESTTBL1 VALUES(1,'홍길동', 25);
 
CREATE TABLE TESTTBL2(ID NUMBER(4), USERNAME NCHAR(3), AGE NUMBER(2), NATION NCHAR(4) DEFAULT '대한민국');
 
CREATE SEQUENCE IDSEQ
    START WITH 1
    INCREMENT BY 1;
    
INSERT INTO TESTTBL2 VALUES(IDSEQ.NEXTVAL, '유나', 25, DEFAULT);
INSERT INTO TESTTBL2 VALUES(IDSEQ.NEXTVAL, '혜정', 24, '영국');
INSERT INTO TESTTBL2 VALUES(3, '혜정2', 24, '영국2');
INSERT INTO TESTTBL2 VALUES(IDSEQ.NEXTVAL, '혜정3', 24, '영국3');

DROP TABLE TESTTBL2;
DROP SEQUENCE IDSEQ;
SELECT * FROM TESTTBL2;

INSERT INTO TESTTBL2 VALUES(11, '쯔위', 18, '대만');
ALTER SEQUENCE IDSEQ
        INCREMENT BY 10;

INSERT INTO TESTTBL2 VALUES(IDSEQ.NEXTVAL, '미나', 21, '일본');
ALTER SEQUENCE IDSEQ
        INCREMENT BY 1;
        
INSERT INTO TESTTBL2 VALUES(IDSEQ.NEXTVAL, '미나2', 21, '일본2');

-- SEQUENCE 현재값 확인
SELECT IDSEQ.CURRVAL FROM DUAL;

CREATE TABLE TESTTBL3(EMPID NUMBER(6), FIRSTNAME VARCHAR2(20), LASTNAME VARCHAR2(25), PHONE VARCHAR2(20));
INSERT INTO TESTTBL3 
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, PHONE_NUMBER
    FROM HR.EMPLOYEES;
    
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, PHONE_NUMBER
    FROM HR.EMPLOYEES;
    
UPDATE BUYTBL SET PRICE = PRICE*1.5;

-- INNER JOIN(내부 조인)
--SELECT <열 목록>
--FROM <첫번째 테이블>
--        INNER JOIN <두 번째 테이블>
--        ON <조인될 조건>
--[WHERE 검색 조건]

SELECT *
    FROM BUYTBL
        INNER JOIN USERTBL
            ON BUYTBL.USERID = USERTBL.USERID;
--        WHERE BUYTBL.USERID='JYP';

SELECT USERID, USERNAME, PRODNAME, ADDR, MOBILE1 || MOBILE2 AS "연락처"
    FROM BUYTBL
        INNER JOIN USERTBL
            ON BUYTBL.USERID= USERTBL.USERID;
            
SELECT BUYTBL.USERID, USERNAME, PRODNAME, ADDR, MOBILE1 || MOBILE2 AS "연락처"
    FROM BUYTBL
        INNER JOIN USERTBL
            ON BUYTBL.USERID= USERTBL.USERID;

SELECT B.USERID, U.USERNAME, B.PRODNAME, U.ADDR, U.MOBILE1 || U.MOBILE2 AS "연락처"            
    FROM BUYTBL B
        INNER JOIN USERTBL U
            ON B.USERID= U.USERID;