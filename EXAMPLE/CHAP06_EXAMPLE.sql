--EX01
--EMPNO -> ENAME 다섯글자 이상, 여섯글자 미만
--MASKING_EMPNO -> 사원번호 앞 두자리 외 뒷자리 *기호
--MASKING_ENAME 첫 글자만 정상, 나머지 글자수 * 출력
SELECT
        EMPNO,
        RPAD(SUBSTR(EMPNO, 1, 2), 4, '*') AS MASKING_EMPNO,
        ENAME,
        RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
    FROM EMP
    WHERE LENGTH(ENAME)<6 AND LENGTH(ENAME)>=5;
    
    
    
--EX02
-- 월 평균 일수 21.5 근무시간 8로 보았을때
-- 일당, 시급 계산 -> 일당은 소수점 3자리버림,  시급은 두번쨰 소수점 반올림
SELECT EMPNO, ENAME, SAL,
    TRUNC(SAL/21.5, 2) AS DAY_PAY,
    ROUND(SAL/21.5/8, 1) AS TIME_PAY
    FROM EMP;
    
SELECT NVL(COMM, 0) FROM EMP;
--EX03
-- 입사일 3개월후 첫 월요일에 정직원 되는 날짜 R_day
-- YYYY-MM-DD 출력,  추가수당(COMM)이 없으면 N/A로 출력
SELECT EMPNO, ENAME, HIREDATE,
        TO_CHAR((NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '월요일')) , 'YYYY-MM-DD') AS R_DAY,
        NVL(TO_CHAR(COMM), 'N/A')
    FROM EMP;
    
--EX04 
--직속상관의 사원번호가 존재하지 않을경우 : 0000
--사원번호 앞 두자리가 75 : 5555
--사원번호 앞 두자리가 76 : 6666
--사원번호 앞 두자리가 77 : 7777
--사원번호 앞 두자리가 78 : 8888
--그 외 : 그대로 출력

SELECT EMPNO, ENAME, MGR,
        CASE 
        WHEN MGR IS NULL THEN 0000
        WHEN MGR LIKE '75%' THEN 5555
        WHEN MGR LIKE '76%' THEN 6666
        WHEN MGR LIKE '77%' THEN 7777
        WHEN MGR LIKE '78%' THEN 8888
        ELSE MGR
        END AS CHG_MGR
    FROM EMP;
        