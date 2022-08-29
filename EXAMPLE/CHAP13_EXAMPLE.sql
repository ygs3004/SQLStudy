-- EX01 
-- EMP 테이블과 같은 구조의 데이터를 저장하는 EMPIDX
-- EMPIDX 테이블 EMPNO열에 IDX_EMPIDX_EMPNO 인덱스 생성
-- 데이터 사전뷰에서 확인

CREATE TABLE EMPIDX
    AS (SELECT * FROM EMP);
    
CREATE INDEX IDX_EMPIDX_EMPNO
    ON EMPIDX(EMPNO);
    
SELECT * FROM USER_INDEXES;

-- EX02 
-- EMPIDX 급여 1500초과하는 사원 출력 이름이 있을경우 새로운 내용을 대체
-- 사원번호, 이름, 직책, 부서번호, 급여, 추가수당(존재하면 O, 아니면 X)

CREATE OR REPLACE VIEW EMPIDX_OVER15KVIEW 
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO, SAL, NVL2(COMM, 'O', 'X') AS COMM FROM EMPIDX WHERE SAL>1500);
    
SELECT * FROM EMPIDX_OVER15KVIEW;

-- EX03
-- DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 작성
-- DEPTSEQ 생성(부서 번호 시작값:1, 증가값:1, 최대값:99, 최솟값:1, 최댓값에서 생성 중단, 캐쉬없음)
-- DEPTSEQ에 부서 3개 추가(DATABASE-SEOUL, WEB-BUSAN, MOBILE-ILSAN)

CREATE TABLE DEPTSEQ
    AS SELECT* FROM DEPT;

CREATE SEQUENCE SEQ_DEPTSEQ 
   INCREMENT BY 1
   START WITH 1
   MAXVALUE 99
   MINVALUE 1
   NOCYCLE NOCACHE;
   
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC) VALUES(SEQ_DEPTSEQ.NEXTVAL, 'DATABASE', 'SEOUL');
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC) VALUES(SEQ_DEPTSEQ.NEXTVAL, 'WEB', 'BUSAN');
INSERT INTO DEPTSEQ(DEPTNO, DNAME, LOC) VALUES(SEQ_DEPTSEQ.NEXTVAL, 'MOBILE', 'ILSAN');

SELECT*FROM DEPTSEQ;