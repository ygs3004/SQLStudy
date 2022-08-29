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

SET SERVEROUTPUT ON;
DECLARE
    MYVAR1 NUMBER(3);
    MYVAR2 NUMBER(5,2) := 3.14;
    MYVAR3 NVARCHAR2(20) := '본인의 키 ->';
                   --N -> 유니코드 의미
BEGIN
    MYVAR1 := 5;
    DBMS_OUTPUT.PUT_LINE(MYVAR1);
    DBMS_OUTPUT.PUT_LINE(MYVAR1+MYVAR2);
    SELECT HEIGHT INTO MYVAR1 FROM USERTBL WHERE USERNAME='이승기';
    DBMS_OUTPUT.PUT_LINE(MYVAR3 || TO_CHAR(MYVAR1));
END;

SELECT SUBSTR('노원구 노원 전철역 2번 출구', 3, 10) FROM DUAL;

DECLARE
    VAR1 NUMBER(5);
BEGIN
    VAR1 :=100;
    IF VAR1 = 100 THEN
        DBMS_OUTPUT.PUT_LINE('100 입니다.');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('100 입니다.');
        END IF;
END;


SELECT U.USERID, U.USERNAME, SUM(PRICE*AMOUNT) AS "총 구매액"
FROM BUYTBL B
    RIGHT OUTER JOIN USERTBL U
    ON B.USERID=U.USERID
GROUP BY U.USERID, U.USERNAME
ORDER BY SUM(PRICE*AMOUNT) DESC NULLS LAST;

--
SELECT U.USERID, U.USERNAME, SUM(PRICE*AMOUNT) AS "총 구매액", 
        CASE 
            WHEN (SUM(PRICE*AMOUNT) >=1500) THEN '최우수 고객'
            WHEN (SUM(PRICE*AMOUNT) >=1000) THEN '우수고객'
            WHEN (SUM(PRICE*AMOUNT) >=1) THEN '일반고객'
            WHEN (SUM(PRICE*AMOUNT) >=1000) THEN '우수고객'
            ELSE '불량고객'
            END AS "고객등급"
FROM BUYTBL B
    RIGHT OUTER JOIN USERTBL U
    ON B.USERID = U.USERID
    GROUP BY U.USERID, U.USERNAME
    ORDER BY SUM(PRICE*AMOUNT) DESC NULLS LAST;

-- NO_DATA_FOUND => 값이 없을때, TOO_MANY_ROWS ==> DATA가 너무 많을때
DECLARE
V_USERNAME USERTBL.USERNAME%TYPE;
BEGIN
    SELECT USERNAME INTO V_USERNAME FROM USERTBL
    WHERE USERNAME LIKE('김%');    
    DBMS_OUTPUT.PUT_LINE('김씨 고객 이름은' || V_USERNAME || '입니다');
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            DBMS_OUTPUT.PUT_LINE('김씨 고객이 없습니다');    
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('김씨 고객이 너무 많습니다');    
END;


DECLARE
V_USERNAME USERTBL.USERNAME%TYPE;
userEXCEPTION EXCEPTION;
PRAGMA EXCEPTION_INIT(USEREXCEPTION, -1422);
BEGIN
    SELECT USERNAME INTO V_USERNAME FROM USERTBL
    WHERE USERNAME LIKE('김%');    
    DBMS_OUTPUT.PUT_LINE('김씨 고객 이름은' || V_USERNAME || '입니다');
    
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            DBMS_OUTPUT.PUT_LINE('김씨 고객이 없습니다');    
        WHEN userEXCEPTION THEN
            DBMS_OUTPUT.PUT_LINE('김씨 고객이 너무 많습니다');    
END;

DECLARE
V_USERNAME USERTBL.USERNAME%TYPE;
ZERODELETE EXCEPTION;
BEGIN
    V_USERNAME := '무명씨';
    DELETE FROM USERTBL WHERE USERNAME = V_USERNAME;
    IF SQL%NOTFOUND THEN
        RAISE ZERODELETE;
    END IF;
    EXCEPTION
        WHEN ZERODELETE THEN
        DBMS_OUTPUT.PUT_LINE(V_USERNAME || '데이터 없음. 확인 바래요^^');
END;


DECLARE
V_USERNAME USERTBL.USERNAME%TYPE;
BEGIN
    V_USERNAME := '무명씨';
    DELETE FROM USERTBL WHERE USERNAME = V_USERNAME;
    IF SQL%NOTFOUND THEN
        RAISE_APPLICATION_ERROR(-20999,'데이터 없음 오류 발생!!');
    END IF;
END;