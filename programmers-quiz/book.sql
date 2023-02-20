-- 다음은 어느 한 서점에서 판매중인 도서들의 도서 정보(BOOK) 테이블입니다.
-- BOOK 테이블은 각 도서의 정보를 담은 테이블로 아래와 같은 구조로 되어있습니다.

Column name Type  Nullable  Description
BOOK_ID INTEGER FALSE 도서 ID
CATEGORY  VARCHAR(N)  FALSE 카테고리 (경제, 인문, 소설, 생활, 기술)
AUTHOR_ID INTEGER FALSE 저자 ID
PRICE INTEGER FALSE 판매가 (원)
PUBLISHED_DATE  DATE  FALSE 출판일

CREATE TABLE IF NOT EXISTS BOOK (
  BOOK_ID INTEGER NOT NULL PRIMARY KEY COMMENT '도서 ID',
  CATEGORY VARCHAR(5) NOT NULL COMMENT '카테고리 (경제, 인문, 소설, 생활, 기술)',
  AUTHOR_ID INTEGER NOT NULL COMMENT '저자 ID',
  PRICE INTEGER NOT NULL COMMENT '판매가(원)',
  PUBLISHED_DATE DATE NOT NULL COMMENT '출판일'
);

INSERT INTO BOOK (BOOK_ID, CATEGORY, AUTHOR_ID, PRICE, PUBLISHED_DATE) VALUES (1, '인문', 1, 10000, '2020-01-01');
INSERT INTO BOOK (BOOK_ID, CATEGORY, AUTHOR_ID, PRICE, PUBLISHED_DATE) VALUES (2, '경제', 2, 9000,  '2021-02-05');
INSERT INTO BOOK (BOOK_ID, CATEGORY, AUTHOR_ID, PRICE, PUBLISHED_DATE) VALUES (3, '인문', 2, 11000, '2021-04-11');
INSERT INTO BOOK (BOOK_ID, CATEGORY, AUTHOR_ID, PRICE, PUBLISHED_DATE) VALUES (4, '인문', 3, 10000, '2021-03-15');
INSERT INTO BOOK (BOOK_ID, CATEGORY, AUTHOR_ID, PRICE, PUBLISHED_DATE) VALUES (5, '생활', 1, 12000, '2021-01-10');

-- 테이블 확인
SELECT * FROM BOOK;

-- 데이터 비우기
TRUNCATE BOOK;

BOOK_SALES 테이블은 각 도서의 날짜 별 판매량 정보를 담은 테이블로 아래와 같은 구조로 되어있습니다.

Column name Type  Nullable  Description
BOOK_ID INTEGER FALSE 도서 ID
SALES_DATE  DATE  FALSE 판매일
SALES INTEGER FALSE 판매량

CREATE TABLE IF NOT EXISTS BOOK_SALES (
  BOOK_ID INTEGER NOT NULL,
  SALES_DATE DATE NOT NULL,
  SALES INTEGER NOT NULL
);

INSERT INTO BOOK_SALES (BOOK_ID, SALES_DATE, SALES) VALUES (1, '2022-01-01', 2);
INSERT INTO BOOK_SALES (BOOK_ID, SALES_DATE, SALES) VALUES (2, '2022-01-02', 3);
INSERT INTO BOOK_SALES (BOOK_ID, SALES_DATE, SALES) VALUES (1, '2022-01-05', 1);
INSERT INTO BOOK_SALES (BOOK_ID, SALES_DATE, SALES) VALUES (2, '2022-01-20', 5);
INSERT INTO BOOK_SALES (BOOK_ID, SALES_DATE, SALES) VALUES (2, '2022-01-21', 6);
INSERT INTO BOOK_SALES (BOOK_ID, SALES_DATE, SALES) VALUES (3, '2022-01-22', 2);
INSERT INTO BOOK_SALES (BOOK_ID, SALES_DATE, SALES) VALUES (2, '2022-02-11', 3);

-- 테이블 확인
SELECT * FROM BOOK_SALES;

-- 데이터 비우기
TRUNCATE BOOK_SALES;

AUTHOR 테이블은 도서의 저자의 정보를 담은 테이블로 아래와 같은 구조로 되어있습니다.

Column name Type  Nullable  Description
AUTHOR_ID INTEGER FALSE 저자 ID
AUTHOR_NAME VARCHAR(N)  FALSE 저자명

CREATE TABLE IF NOT EXISTS AUTHOR (
  AUTHOR_ID INTEGER NOT NULL,
  AUTHOR_NAME VARCHAR(15) NOT NULL
);

INSERT INTO AUTHOR (AUTHOR_ID, AUTHOR_NAME) VALUES (1, '홍길동');
INSERT INTO AUTHOR (AUTHOR_ID, AUTHOR_NAME) VALUES (2, '김영호');

-- 테이블 확인
SELECT * FROM AUTHOR;

-- 데이터 비우기
TRUNCATE AUTHOR;

-- BOOK 테이블에서 2021년에 출판된 '인문' 카테고리에 속하는 도서 리스트를 찾아서 도서 ID(BOOK_ID), 출판일 (PUBLISHED_DATE)을 출력하는 SQL문을 작성해주세요.
-- 결과는 출판일을 기준으로 오름차순 정렬해주세요.
SELECT BOOK_ID
     , DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
  FROM BOOK
 WHERE PUBLISHED_DATE LIKE '2021%'
   AND CATEGORY = '인문'
 ORDER BY PUBLISHED_DATE;
 
-- 2022년 1월의 카테고리 별 도서 판매량을 합산하고, 카테고리(CATEGORY), 총 판매량(TOTAL_SALES) 리스트를 출력하는 SQL문을 작성해주세요.
-- 결과는 카테고리명을 기준으로 오름차순 정렬해주세요.
SELECT CATEGORY
     , SUM(BS.SALES) AS TOTAL_SALES
  FROM BOOK B
  JOIN BOOK_SALES BS ON B.BOOK_ID = BS.BOOK_ID
 WHERE DATE_FORMAT(BS.SALES_DATE, '%Y-%m') = '2022-01'
 GROUP BY CATEGORY
 ORDER BY CATEGORY;
 
-- '경제' 카테고리에 속하는 도서들의 도서 ID(BOOK_ID), 저자명(AUTHOR_NAME), 출판일(PUBLISHED_DATE) 
-- 리스트를 출력하는 SQL문을 작성해주세요. 결과는 출판일을 기준으로 오름차순 정렬해주세요.
SELECT BOOK_ID
     , AUTHOR_NAME
     , DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d')
  FROM BOOK B
  JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID
 WHERE B.CATEGORY = '경제'
 ORDER BY PUBLISHED_DATE;
 
-- 2022년 1월의 도서 판매 데이터를 기준으로 저자 별, 카테고리 별 매출액(TOTAL_SALES = 판매량 * 판매가) 을 구하여, 
-- 저자 ID(AUTHOR_ID), 저자명(AUTHOR_NAME), 카테고리(CATEGORY), 매출액(SALES) 리스트를 출력하는 SQL문을 작성해주세요.
-- 결과는 저자 ID를 오름차순으로, 저자 ID가 같다면 카테고리를 내림차순 정렬해주세요.
SELECT * FROM AUTHOR;
SELECT * FROM BOOK;
SELECT * FROM BOOK_SALES;

SELECT A.AUTHOR_ID
     , A.AUTHOR_NAME
     , B.CATEGORY 
     , SUM(BS.SALES * B.PRICE) TOTAL_SALES 
  FROM BOOK_SALES BS
  JOIN BOOK B ON B.BOOK_ID = BS.BOOK_ID 
  JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID
 WHERE MONTH(BS.SALES_DATE) = 1 
   AND YEAR(BS.SALES_DATE) = 2022
 GROUP BY B.CATEGORY, A.AUTHOR_ID, A.AUTHOR_NAME
 ORDER BY A.AUTHOR_ID, B.CATEGORY DESC;