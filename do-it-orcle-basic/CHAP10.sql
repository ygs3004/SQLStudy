-- 10-1 COPY TABLE
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
    
-- 10-2 Copy check
SELECT * FROM DEPT_TEMP;

-- 10-3 ADD DATA
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) 
                VALUES(50, 'DATABASE', 'SEOUL');
SELECT * FROM DEPT_TEMP;

-- 10-4 열 지정 없는 INSER
INSERT INTO DEPT_TEMP
        VALUES(60, 'NETWORK', 'BUSAN');
SELECT * FROM DEPT_TEMP;

-- 10-5 NULL 입력
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
            VALUES(70, 'WEB', NULL);
SELECT * FROM DEPT_TEMP;

-- 10-6 공백으로 NULL 입력
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
                    VALUES(80, 'MOBILE', '');
SELECT * FROM DEPT_TEMP;

-- 10-7 NULL 암시적 입력 (입력 안하면 NULL)
INSERT INTO DEPT_TEMP(DEPTNO, LOC)
            VALUES(90,'INCHEON');
SELECT * FROM DEPT_TEMP;

-- 10-8 EMP 열구조만 복사
CREATE TABLE EMP_TEMP
    AS SELECT *
        FROM EMP
        WHERE 1<>1;
        
SELECT * FROM EMP_TEMP;

-- 10-9 INSERT 날짜입력 (사이에 / 입력) 
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
            
SELECT * FROM EMP_TEMP;

-- 10-10 INSERT 문으로 날짜 데이터 입력하기(날짜 사이에 - 입력)
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(1111, '성춘향', 'MANAGER', 9999, '200-01-05', 4000, NULL, 20);
            
SELECT*FROM EMP_TEMP;

-- 10-11 년/월/일 순으로 입력하지 않으면 오류
INSERT INTO EMP_TEMP (EMPNO, ENMAE, JOB, MGR, HIREEDATE, SAL, COMM, DEPTNO)
            VALUES(2111, '이순신', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20);  -- 일월년 입력 방식으로 오류

-- 10-12 TO_DATE를 이용하여 안전하게 입력
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(2111, '이순신', 'MANAGER', 9999, TO_DATE('07/01/2001', 'DD/MM/YYYY'),
                    4000, NULL, 20);

SELECT*FROM EMP_TEMP;

-- 10-13 SYSDATE 현재 날짜 기준 입력
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);
            
SELECT*FROM EMP_TEMP;

-- 10-14 서브쿼리로 여러 데이터 추가 -> VALUSE 절 사용(X)
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
        SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
        FROM EMP E, SALGRADE S
        WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND S.GRADE = 1;
        
-- 10-15 테이블 복사
CREATE TABLE DEPT_TEMP2
    AS SELECT*FROM DEPT;

SELECT*FROM DEPT_TEMP2;


-- 10-16 UPDATE
UPDATE DEPT_TEMP2
    SET LOC = 'SEOUL';

SELECT*FROM DEPT_TEMP2;

-- 10-17 ROLLBACK
ROLLBACK;

-- 10-18 UPDATE , WHERE
UPDATE DEPT_TEMP2
    SET DNAME = 'DATABASE',
              LOC = 'SEOUL'
    WHERE DEPTNO=40;
    
SELECT*FROM DEPT_TEMP2;

-- 10-19 UPDATE, 서브쿼리 이용
UPDATE DEPT_TEMP2
    SET(DNAME, LOC) = (SELECT DNAME, LOC
                                FROM DEPT
                                WHERE DEPTNO=40)
    WHERE DEPTNO = 40;
    
SELECT * FROM DEPT_TEMP2;

-- 10-20 서브쿼리로 1열씩 수정
UPDATE DEPT_TEMP2
        SET DNAME = (SELECT DNAME FROM DEPT WHERE DEPTNO=40),
              LOC =(SELECT LOC FROM DEPT WHERE DEPTNO=40)
        WHERE DEPTNO=40;

-- 10-21 UPDATE문의 WHERE절에 서브쿼리 사용
UPDATE DEPT_TEMP2
        SET LOC = 'SEOUL'
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT_TEMP2 WHERE DNAME='OPERATIONS');

SELECT*FROM DEPT_TEMP2;

-- 10-22 연습용 테이블 복사
CREATE TABLE EMP_TEMP2
        AS SELECT * FROM EMP;
SELECT*FROM EMP_TEMP2;

-- 10-23 DELETE, WHERE절 사용(일부 삭제)
DELETE FROM EMP_TEMP2
    WHERE JOB = 'MANAGER';
    
SELECT*FROM EMP_TEMP2;

-- 10-24 WHERE절, 서브쿼리 이용
DELETE FROM EMP_TEMP2
    WHERE EMPNO IN(SELECT E.EMPNO
                                FROM EMP_TEMP2 E, SALGRADE S
                                WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                                AND S.GRADE = 3
                                AND DEPTNO = 30);
                                
SELECT*FROM EMP_TEMP2;

-- 10-25 테이블 모든 데이터 삭제
DELETE FROM EMP_TEMP2;
SELECT*FROM EMP_TEMP2;