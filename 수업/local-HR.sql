SELECT EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE ASC;

-- ROWNUM 행 번호
SELECT * FROM (SELECT EMPLOYEE_ID, HIRE_DATE
                    FROM EMPLOYEES
                    ORDER BY HIRE_DATE ASC)
                    WHERE ROWNUM <= 5;
                    
SELECT EMPLOYEE_ID, HIRE_DATE
    FROM EMPLOYEES
    WHERE ROWNUM <= 5;
    
--- 해당 테이블에서 n%의 데이터를 무작위로 추출 SAMPLE(N)
SELECT EMPLOYEE_ID, HIRE_DATE
FROM EMPLOYEES SAMPLE(5);

22-08-02
SET SERVEROUTPUT ON;
DECLARE
    HIREDATE DATE; -- 입사일
    CURDATE DATE; -- 오늘
    WDAYS NUMBER(5); -- 근무한 일수
BEGIN
    SELECT HIRE_DATE INTO HIREDATE
    FROM HR.EMPLOYEES
    WHERE EMPLOYEE_ID = 200;
    DBMS_OUTPUT.PUT_LINE(HIREDATE);
    
    CURDATE := CURRENT_DATE();
    DBMS_OUTPUT.PUT_LINE(CURDATE);
    
    WDAYS := CURDATE - HIREDATE;
    IF(WDAYS/365) >= 5 THEN
        DBMS_OUTPUT.PUT_LINE('입사한지 ' || WDAYS || '일이나 지났습니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('입사한지 ' || WDAYS || '일이 안 지났습니다.');
    END IF;
END;
----------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
    PNUMBER NUMBER(3); -- 점수
    CREDIT CHAR(1); -- 학점
BEGIN
    PNUMBER := 77;
    IF PNUMBER >= 90 THEN
        CREDIT := 'A';
    ELSIF PNUMBER >= 80 THEN
        CREDIT := 'B';
    ELSIF PNUMBER >= 70 THEN
        CREDIT := 'C';
    ELSIF PNUMBER >= 60 THEN
        CREDIT := 'D';
    ELSE 
        CREDIT := 'F';
    END IF;
       
    DBMS_OUTPUT.PUT_LINE('취득점수 ==> ' ||PNUMBER|| ', 학점 ==> ' || CREDIT);
END;

-- CASE 문
SET SERVEROUTPUT ON;
DECLARE
    PNUMBER NUMBER(3); -- 점수
    CREDIT CHAR(1); -- 학점
BEGIN
    PNUMBER := 77;
    CASE
        WHEN PNUMBER >= 90 THEN
            CREDIT := 'A';
        WHEN PNUMBER >= 80 THEN
            CREDIT := 'B';
        WHEN PNUMBER >= 70 THEN
            CREDIT := 'C';
        WHEN PNUMBER >= 60 THEN
            CREDIT := 'D';
    ELSE 
        CREDIT := 'F';
    END CASE;
       
    DBMS_OUTPUT.PUT_LINE('취득점수 ==> ' ||PNUMBER|| ', 학점 ==> ' || CREDIT);
END;
