-- EX01
-- 부서번호(DEPTNO), 평균급여(AVG_SAL), 최고급여(MAX_SAL), 최소급여(MIN_SAL), (사원수)CNT
-- 소숫점 제외 부서별 출력
SELECT DEPTNO,
        ROUND(AVG(SAL)) AVG_SAL,
        MAX(SAL) MAX_SAL,
        MIN(SAL) MIN_SAL,
        COUNT(*) CNT
    FROM EMP
    GROUP BY DEPTNO;
    
-- EX02
-- 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력
SELECT JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB
    HAVING COUNT(*) >= 3;
    
-- EX03
-- 사원들의 입사 연도(HIRE_YEAR)를 기준으로 부서별로 몇명이 입사했는지 출력하세요
SELECT TO_CHAR(HIREDATE, 'RRRR') HIRE_YEAR, DEPTNO, COUNT(*) CNT
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'RRRR'), DEPTNO;

-- EX04
-- 추가 수당을 받는 사원수, 받지 않는 사원수 출력
SELECT NVL2(COMM, 'O', 'X') EXIST_COMM, COUNT(*) CNT
    FROM EMP
    GROUP BY  NVL2(COMM, 'O', 'X');
    
SELECT DECODE(COMM, NULL, 'X', 'O') EXIST_COMM, COUNT(*) CNT
    FROM EMP
    GROUP BY DECODE(COMM, NULL, 'X', 'O');

-- EX05
-- 입사 연도별 사원수, 최고급여, 급여합, 평균 급여, 각 부서별 소계와 총계
SELECT DEPTNO, TO_CHAR(HIREDATE, 'RRRR') HIRE_YEAR,
            COUNT(*) CNT, MAX(SAL) MAX_SAL, SUM(SAL) SUM_SAL, AVG(SAL) AVG_SAL
    FROM EMP
    GROUP BY ROLLUP (DEPTNO, TO_CHAR(HIREDATE, 'RRRR'));
    