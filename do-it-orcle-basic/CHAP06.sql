-- 6-1 UPPER, LOWER, INITCAP
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

-- 6-2 
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE ('%SCOTT%');

-- 6-3 
SELECT *
FROM EMP
WHERE UPPER(ENAME) LIKE ('%SCOTT%');

-- 6-4 )
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

-- 6-5 
SELECT LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME)>=5;

-- 6-6 LENGTHB 
SELECT LENGTH('??'), LENGTHB('??')
FROM DUAL;

-- 6-7 SUBSTR 
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
FROM EMP;

-- 6-8 SUBSTR 
SELECT JOB,
        SUBSTR(JOB, -LENGTH(JOB)),
        SUBSTR(JOB, -LENGTH(JOB), 2),
        SUBSTR(JOB, 3)
FROM EMP;

-- 6-9 INSTR 
SELECT 
INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
INSTR('HELLO, ORACLE!', 'L', 5)AS INSTR_2,
INSTR('HELLO, ORACLE!', 'L', 2, 2)AS INSTR_3
FROM DUAL;

-- 6-10 INSTR 
SELECT *
FROM EMP
WHERE INSTR(ENAME, 'S') > 0;

-- 6-11 LIKE
SELECT *
FROM EMP
WHERE ENAME LIKE '%S%' ;

-- 6-12 REPLACE 
SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
    REPLACE('010-1234-5678', '-') AS REPLACE_2 --???? ???
FROM DUAL;

-- 6-13 LPAD, RPAD 
SELECT 'Oracle',
    LPAD('Oracle', 10, '#') AS LPAD_1,
    RPAD('Oracle', 10, '*') AS RPAD_1,
    LPAD('Oracle',10) AS LPAD_2,
    RPAD('Oracle',10) AS RPAD_2
    FROM DUAL;
    
-- 6-14
SELECT
    RPAD('971225-', 14, '*') AS RPAD_JMNO,
    RPAD('010-1234-', 13, '*') AS RPAD_PHONE
FROM DUAL;

-- 6-15 CONCAT
SELECT CONCAT(EMPNO, ENAME),
        CONCAT(EMPNO, CONCAT(' : ', ENAME))
    FROM EMP
    WHERE ENAME = 'SCOTT';
    
SELECT EMPNO || ENAME,
        EMPNO || ' : ' || ENAME
        FROM EMP;
        
-- 6-16 TRIM , LEADING(??), TRAILING(???),  BOTH(??) +FROM
SELECT '[' || TRIM(' _ _ Oracle_ _ ') || ' ]' AS TRIM,
            '[' || TRIM(LEADING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_LADING,
            '[' || TRIM(TRAILING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_TRAILING,
            '[' || TRIM(BOTH FROM ' _ _Oracle_ _ ') || ']' AS TRIM_BOTH
        FROM DUAL;
        
-- 6-17 TRIM
SELECT '[' || TRIM('_' FROM '_ _ Oracle_ _') || ' ]' AS TRIM,
            '[' || TRIM(LEADING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_LADING,
            '[' || TRIM(TRAILING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_TRAILING,
            '[' || TRIM(BOTH '_' FROM '_ _Oracle_ _') || ']' AS TRIM_BOTH
        FROM DUAL;
        
-- 6-18 
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
        '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
        '[' || LTRIM('<_Oracle_>', '_<') || ']' AS LTRIM_2,
        '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
        '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
        '[' || RTRIM('<_Oracle_>', '>_') || ']' AS RTRIM
    FROM DUAL;
        
-- 6-19 ROUND 반올림
SELECT ROUND(1234.5678) AS ROUND,
            ROUND(1234.5678, 0) AS ROUND_0,
            ROUND(1234.5678, 1) AS ROUND_1,
            ROUND(1234.5678, 2) AS ROUND_2,
            ROUND(1234.5678, -1) AS ROUND_MINUS1,
            ROUND(1234.5678, -2) AS ROUND_MINUS2
        FROM DUAL;
        
-- 6-20 TRUNC 버림
SELECT TRUNC(1234.5678) AS TRUNC,
            TRUNC(1234.5678, 0) AS TRUNC_0,
            TRUNC(1234.5678, 1) AS TRUNC_1,
            TRUNC(1234.5678, 2) AS TRUNC_2,
            TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
            TRUNC(1234.5678, -2) AS TRUNC_MINUS2
        FROM DUAL;
        
-- 6-21 가까운 정수 반환 CEIL(큰 정수, FLOOR 작은 정수)
SELECT CEIL(3.14),
        FLOOR(3.14),
        CEIL(-3.14),
        FLOOR(-3.14)
    FROM DUAL;
    
-- 6-22 나머지 구하기 MOD
SELECT MOD(15, 6),
            MOD(10, 2),
            MOD(11, 2)
        FROM DUAL;
        
-- 6-23 SYSDATE 날짜 출력(연산으로 일수 계산 가능)
SELECT SYSDATE AS NOW,
        SYSDATE-1 AS YESTERDAY,
        SYSDATE+1 AS TOMORROW
    FROM DUAL;
    
-- 6-24 ADD_MONTHS 날짜 구하기(개월 후)
SELECT SYSDATE,
        ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;
    
-- 6-25 10주년 출력
SELECT EMPNO, ENAME, HIREDATE,
        ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
    FROM EMP;
    
-- 6-26 입사 40년 미만인 사원 데이터 출력
SELECT EMPNO, ENAME, HIREDATE, SYSDATE
    FROM EMP
    WHERE ADD_MONTHS(HIREDATE, 480) > SYSDATE;
    
-- EX, 현재날짜, 6개월후 날짜 출력
SELECT
SYSDATE, ADD_MONTHS(SYSDATE, 6)
FROM DUAL;
  
-- 6-27 MONTHS_BETWEEN 두 날짜 사이의 개월수 차이
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
        MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1,
        MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2,
        TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3 -- TRUNC -> 자릿수 버림 함수
    FROM EMP;
    
-- 6-28 NEXT_DAT, LAST_DAT // 돌아오는 요일, 해당 달의 마지막 날짜
SELECT SYSDATE,
        NEXT_DAY(SYSDATE, '토요일'),
        LAST_DAY(SYSDATE)
      FROM DUAL;
      
-- 6-29 ROUND 함수 날짜 적용(반올림), 포맷은 인터넷 참조가능, 반올림 가능 기억
SELECT SYSDATE,
        ROUND(SYSDATE, 'CC') AS FORMAT_CC,
        ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY,
        ROUND(SYSDATE, 'Q') AS FORMAT_Q,
        ROUND(SYSDATE, 'DDD') AS FORMAT_DDD,
        ROUND(SYSDATE, 'HH') AS FORMAT_HH
    FROM DUAL;

-- 6-30 TRUNC 함수 날짜 적용(버림)
SELECT SYSDATE,
        TRUNC(SYSDATE, 'CC') AS FORMAT_CC,
        TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY,
        TRUNC(SYSDATE, 'Q') AS FORMAT_Q,
        TRUNC(SYSDATE, 'DDD') AS FORMAT_DDD,
        TRUNC(SYSDATE, 'HH') AS FORMAT_HH
    FROM DUAL;
    
-- 6-31 숫자 문자 더하기 -> 암시적 형 변환(자동)
SELECT EMPNO, ENAME, EMPNO+'500'
    FROM EMP
    WHERE ENAME='SCOTT';
    
-- 6-32 숫자 문자 더하기 -> 안되는 형식일 경우 오류
SELECT 'ABCD' + EMPNO, EMPNO
    FROM EMP
    WHERE ENAME = 'SCOTT';
    
-- 6-33 명시적 형 변환(형 변환 지정) 날짜 형식 지정 출력 (날짜-> 문자)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
    FROM DUAL;

-- 6-34 월과 요일 다양한 형식 출력
SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'MM') AS MM,
        TO_CHAR(SYSDATE, 'MON') AS MON,
        TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
        TO_CHAR(SYSDATE, 'DD') AS DD,
        TO_CHAR(SYSDATE, 'DY') AS DY,
        TO_CHAR(SYSDATE, 'DAY') AS DAY
    FROM DUAL;
    
-- 6-35 날짜 출력 언어 지정(월)
SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'MM') AS MM,
        TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
        TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JAP,
        TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG,
        TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR,
        TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JAP,
        TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
    FROM DUAL;
    
-- 6-36 날짜 출력 언어 지정(요일)
SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'MM') AS MM,
        TO_CHAR(SYSDATE, 'DD') AS DD,
        TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN') AS DY_KOR,
        TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN,
        TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DY_ENG,
        TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN') AS DAY_KOR,
        TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DAY_JPN,
        TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DAY_ENG
    FROM DUAL;
    
-- 6-37 SYSDATE 형식 지정
SELECT SYSDATE,
        TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
        TO_CHAR(SYSDATE, 'HH24:MI:SS AM') AS HH24MISS_AM,
        TO_CHAR(SYSDATE, 'HH24:MI:SS P.M.') AS HH24MISS_PM
    FROM DUAL;
    
-- 6-38 숫자 -> 문자, 형식지정
SELECT SAL,
        TO_CHAR(SAL, '$999,999') AS SAL_$,
        TO_CHAR(SAL, 'L999,999') AS SAL_L,
        TO_CHAR(SAL, '999,999.00') AS SAL_1,
        TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
        TO_CHAR(SAL, '000999999.99') AS SAL_3,
        TO_CHAR(SAL, '999,999,00') AS SAL_4
    FROM EMP;
    
-- 6-39 암시적 형변환
SELECT 1300 - '1500',
        '1300' + 1500
    FROM DUAL;
    
-- 6-40 암시적 형변환 실패
SELECCT '1,300' - '1,500'
    FROM DUAL;
    
-- 6-41 TO_NUMBER 문자열을 지정한 숫자 형식으로 인식
SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
    FROM DUAL;
    
-- 6-42 TO_DATE 문자 데이터-> 날짜 데이터
SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
        TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2
    FROM DUAL;
    
-- 6-43 날자 데이터 조건 출력
SELECT *
    FROM EMP
    WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');
    
-- 6-44 날짜 출력 형식 YY-> 2000년 이후, RR->1950~2049
SELECT TO_DATE('49/12/10', 'YY/MM/DD') AS YY_YEAR_49,
        TO_DATE('49/12/10', 'RR/MM/DD') AS RR_YEAR_49,
        TO_DATE('50/12/10', 'YY/MM/DD') AS YY_YEAR_50,
        TO_DATE('50/12/10', 'RR/MM/DD') AS RR_YEAR_50,
        TO_DATE('51/12/10', 'YY/MM/DD') AS YY_YEAR_51,
        TO_DATE('51/12/10', 'RR/MM/DD') AS RR_YEAR_51
    FROM DUAL;
    
-- 6-45 NVL (NULL 일 경우  대체)
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
        NVL(COMM,0),
        SAL+NVL(COMM,0)
    FROM EMP;    
    
-- 6-46 NVL2 (NUL일 경우, NULL이 아닐 경우 각각 출력)
SELECT EMPNO, ENAME, COMM,
        NVL2(COMM, 'O', 'X'),
        NVL2(COMM, SAL*12*COMM, SAL*12) AS ANNSAL
    FROM EMP;
    
-- 6-47 조건문 DECODE 
SELECT EMPNO, ENAME, JOB, SAL,
        DECODE(JOB,                                     -- 검사대상
                        'MANAGER', SAL*1.1,            -- 조건이 검사대상 일 경우
                        'SALESMAN', SAL*1.05,              --       
                        'ANALYST', SAL,                       --
                        SAL*1.03) AS UPSAL             -- 조건과 일치하지 않을 경우
        FROM EMP;

-- 6-48 조건문 CASE
SELECT EMPNO, ENAME, JOB, SAL,
        CASE JOB                                            --CASE 검사대상 열, 데이터, 연산, 함수의 결과
            WHEN 'MANAGER' THEN SAL*1.1         -- WHEN 조건1 THEN 조건1이 TRUE일때
            WHEN 'SALESMAN' THEN SAL*1.05
            WHEN 'ANALYST' THEN SAL
            ELSE SAL*1.03                                   -- ELSE 맞는 조건이 없을떄
        END                                                    -- END CASE문 종료
        AS UPSAL
        FROM EMP;