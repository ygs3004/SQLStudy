다음은 어느 의류 쇼핑몰의 온라인 상품 판매 정보를 담은 ONLINE_SALE 테이블 입니다. ONLINE_SALE 테이블은 아래와 같은 구조로 되어있으며
ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE는 각각 온라인 상품 판매 ID, 회원 ID, 상품 ID, 판매량, 판매일을 나타냅니다.

Column name Type  Nullable
ONLINE_SALE_ID  INTEGER FALSE
USER_ID INTEGER FALSE
PRODUCT_ID  INTEGER FALSE
SALES_AMOUNT  INTEGER FALSE
SALES_DATE  DATE  FALSE
동일한 날짜, 회원 ID, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.

CREATE TABLE IF NOT EXISTS ONLINE_SALE (
  ONLINE_SALE_ID INTEGER NOT NULL,
  USER_ID INTEGER NOT NULL,
  PRODUCT_ID INTEGER NOT NULL,
  SALES_AMOUNT INTEGER NOT NULL,
  SALES_DATE DATE NOT NULL
);

INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (1, 1, 3, 2, '2022-02-25');
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (2, 1, 4, 1, '2022-03-01');
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (4, 2, 4, 2, '2022-03-12');
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (3, 1, 3, 3, '2022-03-31');
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (5, 3, 5, 1, '2022-04-03');
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (6, 2, 4, 1, '2022-04-06');
INSERT INTO ONLINE_SALE (ONLINE_SALE_ID, USER_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (2, 1, 4, 2, '2022-05-11');

-- 테이블 확인
SELECT * FROM ONLINE_SALE;

-- 데이터 비우기
TRUNCATE ONLINE_SALE;

OFFLINE_SALE 테이블은 아래와 같은 구조로 되어있으며 OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE는 각각 오프라인 상품 판매 ID, 상품 ID, 판매량, 판매일을 나타냅니다.

Column name Type  Nullable
OFFLINE_SALE_ID INTEGER FALSE
PRODUCT_ID  INTEGER FALSE
SALES_AMOUNT  INTEGER FALSE
SALES_DATE  DATE  FALSE

CREATE TABLE IF NOT EXISTS OFFLINE_SALE (
  OFFLINE_SALE_ID INTEGER NOT NULL,
  PRODUCT_ID INTEGER NOT NULL,
  SALES_AMOUNT INTEGER NOT NULL,
  SALES_DATE DATE NOT NULL
);

INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (1, 1, 2, '2022-02-21');
INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (4,	1, 2, '2022-03-01');
INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (3,	3, 3, '2022-03-01');
INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (2,	4, 1, '2022-03-01');
INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (5,	2, 1, '2022-03-03');
INSERT INTO OFFLINE_SALE (OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, SALES_DATE) VALUES (6,	2, 1, '2022-04-01');

-- 테이블 확인
SELECT * FROM OFFLINE_SALE;

-- 데이터 비우기
TRUNCATE OFFLINE_SALE;

-- ONLINE_SALE 테이블에서 동일한 회원이 동일한 상품을 재구매한 데이터를 구하여, 재구매한 회원 ID와 재구매한 상품 ID를 출력하는 SQL문을 작성해주세요. 
-- 결과는 회원 ID를 기준으로 오름차순 정렬해주시고 회원 ID가 같다면 상품 ID를 기준으로 내림차순 정렬해주세요.
SELECT USER_ID
     , PRODUCT_ID
  FROM ONLINE_SALE
 GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(USER_ID)>1
 ORDER BY USER_ID, PRODUCT_ID DESC;

-- USER_INFO 테이블과 ONLINE_SALE 테이블에서 년, 월, 성별 별로 상품을 구매한 회원수를 집계하는 SQL문을 작성해주세요. 
-- 결과는 년, 월, 성별을 기준으로 오름차순 정렬해주세요. 이때, 성별 정보가 없는 경우 결과에서 제외해주세요.
SELECT DATE_FORMAT(OS.SALES_DATE, '%Y') YEAR
     , CONVERT(DATE_FORMAT(OS.SALES_DATE, '%c'), SIGNED INTEGER) MONTH
     , UI.GENDER
     , COUNT(DISTINCT OS.USER_ID) USERS
  FROM ONLINE_SALE OS
  JOIN USER_INFO UI ON OS.USER_ID = UI.USER_ID
 WHERE UI.GENDER IS NOT NULL
 GROUP BY YEAR, MONTH, UI.GENDER
 ORDER BY YEAR, MONTH, UI.GENDER;
 
-- DATE_FORMAT(OS.SALES_DATE, '%c') 을 사용할 경우 1,2,3 ---- 11, 12 로 표현된 월이 문자열로 비교되어 1, 11, 12, 2, 3 형태로 
-- 정렬되기때문에 CONVERT 함수를 이용하거나, MONTH() 등의 함수로 값을 정렬 시켜야한다.

-- ONLINE_SALE 테이블과 OFFLINE_SALE 테이블에서 2022년 3월의 오프라인/온라인 상품 판매 데이터의 
-- 판매 날짜, 상품ID, 유저ID, 판매량을 출력하는 SQL문을 작성해주세요. OFFLINE_SALE 테이블의 판매 데이터의 USER_ID 값은 NULL 로 표시해주세요.
-- 결과는 판매일을 기준으로 오름차순 정렬해주시고 판매일이 같다면 상품 ID를 기준으로 오름차순, 상품ID까지 같다면 유저 ID를 기준으로 오름차순 정렬해주세요.
SELECT DATE_FORMAT(OL.SALES_DATE, '%Y-%m-%d') SALES_DATE
     , OL.PRODUCT_ID
     , OL.USER_ID
     , OL.SALES_AMOUNT 
  FROM ONLINE_SALE OL
 WHERE SALES_DATE LIKE '2022-03%'
UNION ALL
SELECT DATE_FORMAT(OS.SALES_DATE, '%Y-%m-%d')
     , OS.PRODUCT_ID
     , NULL
     , OS.SALES_AMOUNT 
  FROM OFFLINE_SALE OS
 WHERE SALES_DATE LIKE '2022-03%'
 ORDER BY SALES_DATE, PRODUCT_ID, USER_ID;
 
-- USER_INFO 테이블과 ONLINE_SALE 테이블에서 2021년에 가입한 전체 회원들 중 상품을 구매한 회원수와 상품을 구매한 회원의 비율(=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수)을 
-- 년, 월 별로 출력하는 SQL문을 작성해주세요. 상품을 구매한 회원의 비율은 소수점 두번째자리에서 반올림하고, 전체 결과는 년을 기준으로 오름차순 정렬해주시고 년이 같다면 월을 기준으로 오름차순 정렬해주세요. 
WITH U2021 AS (
SELECT USER_ID
  FROM USER_INFO
 WHERE JOINED LIKE '2021%'  
)
SELECT YEAR(SALES_DATE) YEAR
     , MONTH(SALES_DATE) MONTH 
     , COUNT(DISTINCT USER_ID) PURCHASE_USERS
     , ROUND(COUNT(DISTINCT USER_ID)/(SELECT COUNT(*) FROM U2021), 1) PURCHASED_RATIO
  FROM ONLINE_SALE
 WHERE USER_ID IN (SELECT USER_ID FROM U2021)
 GROUP BY YEAR, MONTH
 ORDER BY YEAR, MONTH;
