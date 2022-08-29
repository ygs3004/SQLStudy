-- 영업 사원들의 실적 점수의 평균을 검색
SELECT AVG(POINT) 
FROM SALESMAN;

-- 영업 사원별로 판매한 전체 차량의 대수를 검색
SELECT SNAME, COUNT(*)
FROM(
SELECT *
    FROM SALE S
    INNER JOIN SALESMAN SM
    ON S.SNO = SM.SNO
)
GROUP BY SNAME;

-- 세대 이상의 차량을 판매한 영업 사원의 사번을 검색
SELECT SNO, COUNT(*)
    FROM SALE
    GROUP BY SNO
    HAVING COUNT(*)>=3;

-- 차량명이 '소'로 시작하는 차량의 모든 정보를 검색
SELECT *  
FROM CAR
WHERE CNAME LIKE '소%';

-- 김씨가 아닌 영업사원의 사번과 이름을 검색
SELECT SNAME, SNO
FROM SALESMAN
WHERE SNAME NOT LIKE '김%';

-- 배기량이 널값인 차량의 차량 번호와 차량명을 검색
SELECT CNO,CNAME
FROM CAR
WHERE CC IS NULL;

-- 차량 번호 'c4'를 판매한 영업 사원의 이름을 검색

SELECT SNAME 
FROM(
    SELECT *
    FROM SALESMAN SM
        INNER JOIN SALE S
        ON S.SNO=SM.SNO
) WHERE CNO='c4';

-- 'SM5' 차량을 판매한 사원의 이름을 검색
SELECT SM.SNAME
FROM SALESMAN SM
    INNER JOIN SALE S
    ON S.SNO=SM.SNO
    INNER JOIN CAR C
    ON C.CNO=S.CNO
    WHERE C.CNAME = 'SM5';
    
-- 차량 번호 c6인 판매 대수를 null에서 30으로 수정

UPDATE SALE SET QTY=30 WHERE CNO = 'c6' AND QTY IS NULL;
SELECT * FROM SALE;

-- 사번이 's123'인 사원 실적을 100점 증가 시킨다
UPDATE SALESMAN SET POINT=POINT+100 WHERE SNO='s123';
-- 모든 사원의 실적을 100점 감소한다
UPDATE SALESMAN SET POINT=POINT-100;
-- 사번이 's134'인 사원의 레코드를 삭제한다
DELETE SALESMAN WHERE SNO='s134';
-- 부산에서 출고되는 모든 차량의 레코드를 삭제한다.
DELETE FROM CAR WHERE OUTLET = '부산';
--DELETE (
--SELECT * 
--FROM SALE S
--OUTTER JOIN SALESMAN SM
--ON S.SNO=SM.SNO
--OUTTER JOIN CAR C
--ON C.CNO=S.SNO)
--WHERE C.OUTLET='부산';

-- 사원 테이블의 모든 정보를 삭제한다
DROP TABLE SALESMAN;
