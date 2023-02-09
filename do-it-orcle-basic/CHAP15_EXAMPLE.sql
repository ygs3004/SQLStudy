-- EX01 
-- PREV_HW 계정 생성
-- 비밀번호 ORACLE
-- 접속 확인

--CMD 실행
SQLPLUS SYSTEM/oracle

CREATE USER PREV_HW IDENTIFIED BY ORACLE;

GRANT CREATE SESSION TO PREV_HW;

CONN PREV_HW/ORACLE


-- EX02
-- SCOTT 계정으로 접속하여 PREV_HW에 EMP,DEPT,SALGRADE 테이블 SELECT 권한부여
-- PREV_HW 계정으로 확인

CONN SCOTT/tiger

GRANT SELECT ON EMP TO PREV_HW;
GRANT SELECT ON DEPT TO PREV_HW;
GRANT SELECT ON SALGRADE TO PREV_HW;

CONN PREV_HW/ORACLE

SELECT*FROM SCOTT.EMP;
SELECT*FROM SCOTT.DEPT;
SELECT*FROM SCOTT.SALGRADE;

-- EX03 SCOTT 계정으로 PREV_HW 에게 주었던 권한 취소
-- PREV_HW 계정으로 SALGRADE 조회가능 여부로 취소 확인

CONN SCOTT/tiger

REVOKE SELECT ON EMP FROM PREV_HW;
REVOKE SELECT ON DEPT FROM PREV_HW;
REVOKE SELECT ON SALGRADE FROM PREV_HW;

CONN PREV_HW/ORACLE
SELECT*FROM SCOTT.SALGRADE;