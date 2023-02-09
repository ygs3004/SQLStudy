-- 9-1 JONES 급여
SELECT SAL
    FROM EMP
    WHERE ENAME = 'JONES';

-- 9-2
SELECT *
    FROM EMP
    WHERE SAL > 2975;
    
-- 9-3
SELECT *
    FROM EMP
    WHERE SAL > (SELECT SAL
                        FROM EMP
                        WHER ENAME = 'JONES');
                        
-- 9-4 날짜 서브쿼리
SELECT *
    FROM EMP
    WHERE HIREDATE<(SELECT HIREDATE
                            FROM EMP
                            WHERE ENAME = 'SCOTT');

-- 9-5 함수 서브쿼리
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
            AND E.DEPTNO = 20
            AND E.SAL > (SELECT AVG(SAL) FROM EMP);

-- 9-6 IN
SELECT * FROM EMP
WHERE DEPTNO IN(20, 30);

-- 9-7 부서별, 최고급여 받는사람
SELECT *
    FROM EMP
    WHERE SAL IN(SELECT MAX(SAL) 
                        FROM EMP 
                        GROUP BY DEPTNO);
                
-- 9-8 서브쿼리(9-7의) 부서별 최대급여
SELECT MAX(SAL) 
    FROM EMP GROUP BY DEPTNO;
    
-- 9-9 ANY, "=" 사용
SELECT *
    FROM EMP
    WHERE SAL = ANY(SELECT MAX(SAL) FROM EMP
                        GROUP BY DEPTNO);
                        
-- 9-10 SOME
SELECT * 
    FROM EMP
    WHERE SOME(SELECT MAX(SAL) FROM EMP
                        GROUP BY DEPTNO);
                        
-- 9-11 ANY 이용 => MAX 효과 30번 부서 최대 급여보다 적은 사원
SELECT * 
    FROM EMP
    WHERE SAL < ANY(SELECT SAL
                                FROM EMP
                                WHERE DEPTNO = 30)
    ORDER BY SAL, EMPNO;
    
-- 9-12 30번 부서 급여
SELECT *
    FROM EMP
    WHERE DEPTNO = 30;
    
-- 9-13 ANY 이용 => MIN 효과
SELECT *
    FROM EMP
    WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO = 30);
    
-- 9-14 ALL 사용 => MIN효과
SELECT *
    FROM EMP
    WHERE SAL < ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30);
    
-- 9-15 ALL 사용 => MAX효과
SELECT *
    FROM EMP
    WHERE SAL > ALL(SELECT SAL FROM EMP WHERE DEPTNO = 30);    
    
-- 9-16 EXISTS => 존재시 나머지도 모두 출력, 없을시 모두 미출력
SELECT * 
    FROM EMP
    WHERE EXISTS (SELECT DNAME
                        FROM DEPT     
                        WHERE DEPTNO = 10);

-- 9-17 EXISTS 미출력
SELECT *
    FROM EMP
    WHERE EXISTS (SELECT DNAME
                        FROM DEPT  
                        WHERE DEPTNO = 50);

-- 9-18 서브쿼리가 다중열일떄
SELECT *
    FROM EMP
    WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP  GROUP BY DEPTNO);
    
-- 9-19 FROM절 서브쿼리(인라인 뷰) WITH로 교체 가능
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
            (SELECT * FROM DEPT) D
    WHERE E10.DEPTNO = D.DEPTNO;

-- 9-20 WITH 서브쿼리가 많을때 유용
WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM E10, D
    WHERE E10.DEPTNO = D.DEPTNO;
    
-- 9-21 SELECT 절 서브쿼리 => 하나의 값만 반환하는 서브쿼리여야함
SELECT EMPNO, ENAME, JOB, SAL,
            (SELECT GRADE
            FROM SALGRADE
            WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
            DEPTNO,
            (SELECT DNAME
            FROM DEPT
            WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
    FROM EMP E;
    