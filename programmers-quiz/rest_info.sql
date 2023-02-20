다음은 식당의 정보를 담은 REST_INFO 테이블입니다. REST_INFO 테이블은 다음과 같으며
REST_ID, REST_NAME, FOOD_TYPE, VIEWS, FAVORITES, PARKING_LOT, ADDRESS, TEL은 
식당 ID, 식당 이름, 음식 종류, 조회수, 즐겨찾기수, 주차장 유무, 주소, 전화번호를 의미합니다.

Column name Type  Nullable
REST_ID VARCHAR(5)  FALSE
REST_NAME VARCHAR(50) FALSE
FOOD_TYPE VARCHAR(20) TRUE
VIEWS NUMBER  TRUE
FAVORITES NUMBER  TRUE
PARKING_LOT VARCHAR(1)  TRUE
ADDRESS VARCHAR(100)  TRUE
TEL VARCHAR(100)  TRUE

CREATE TABLE IF NOT EXISTS REST_INFO (
  REST_ID VARCHAR(5)  NOT NULL PRIMARY KEY,
  REST_NAME VARCHAR(50) NOT NULL,
  FOOD_TYPE VARCHAR(20),
  VIEWS INT,
  FAVORITES INT,
  PARKING_LOT VARCHAR(1),
  ADDRESS VARCHAR(100),
  TEL VARCHAR(100)
);

INSERT INTO REST_INFO (REST_ID, REST_NAME, FOOD_TYPE, VIEWS, FAVORITES, PARKING_LOT, ADDRESS, TEL) VALUES ('00001', '은돼지식당', '한식', 1150345, 734, 'N', '서울특별시 중구 다산로 149', 010-4484-8751);
INSERT INTO REST_INFO (REST_ID, REST_NAME, FOOD_TYPE, VIEWS, FAVORITES, PARKING_LOT, ADDRESS, TEL) VALUES ('00002', '하이가쯔네', '일식', 120034,  112, 'N', '서울시 중구 신당동 375-21', NULL);
INSERT INTO REST_INFO (REST_ID, REST_NAME, FOOD_TYPE, VIEWS, FAVORITES, PARKING_LOT, ADDRESS, TEL) VALUES ('00003', '따띠따띠뜨', '양식', 1234023, 102, 'N', '서울시 강남구 신사동 627-3 1F', 02-6397-1023);
INSERT INTO REST_INFO (REST_ID, REST_NAME, FOOD_TYPE, VIEWS, FAVORITES, PARKING_LOT, ADDRESS, TEL) VALUES ('00004', '스시사카우스', '일식', 1522074, 230, 'N', '서울시 서울시 강남구 신사동 627-27', 010-9394-2554);
INSERT INTO REST_INFO (REST_ID, REST_NAME, FOOD_TYPE, VIEWS, FAVORITES, PARKING_LOT, ADDRESS, TEL) VALUES ('00005', '코슌스', '일식', 15301, 123, 'N', '서울특별시 강남구 언주로153길', 010-1315-8729);

-- 테이블 확인
SELECT * FROM REST_INFO;

-- 데이터 비우기
TRUNCATE REST_INFO;

-- REST_INFO 테이블에서 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 식당 이름, 즐겨찾기수를 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 음식 종류를 기준으로 내림차순 정렬해주세요.

SELECT RI.FOOD_TYPE
     , RI.REST_ID
     , RI.REST_NAME
     , RI.FAVORITES
  FROM REST_INFO RI
  JOIN (SELECT FOOD_TYPE, MAX(FAVORITES) FAVORITES 
          FROM REST_INFO 
         GROUP BY FOOD_TYPE) RIM
    ON RI.FAVORITES = RIM.FAVORITES 
   AND RI.FOOD_TYPE = RIM.FOOD_TYPE
 ORDER BY RI.FOOD_TYPE DESC;
 
 
