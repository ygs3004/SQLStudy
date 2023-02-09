-- CHAP05

--EX01
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

--EX02
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
 AND JOB = 'SALESMAN';
 
--EX03
--?? ???? ???? ?? ??
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE (DEPTNO = 20 OR DEPTNO=30)
    AND SAL > 2000;
    
--?? ???? ??? ??
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL > 2000;

--EX04
SELECT *
FROM EMP
WHERE NOT (SAL >= 2000
    AND SAL<=3000);
    
--EX05
SELECT ENAME LI , EMPNO, SAL, DEPTNO
FROM EMP
WHERE  SAL NOT BETWEEN 1000 AND 2000
  AND ENAME LIKE '%E%'
  AND DEPTNO = 30;
  
--EX06
SELECT *
FROM EMP
WHERE COMM IS NULL
 AND MGR IS NOT NULL
 AND (JOB ='MANAGER' OR JOB='CLERK')
 AND ENAME NOT LIKE '_L%';