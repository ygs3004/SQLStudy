PLACES 테이블은 공간 임대 서비스에 등록된 공간의 정보를 담은 테이블입니다. PLACES 테이블의 구조는 다음과 같으며 
ID, NAME, HOST_ID는 각각 공간의 아이디, 이름, 공간을 소유한 유저의 아이디를 나타냅니다. ID는 기본키입니다.

NAME  TYPE
ID  INT
NAME  VARCHAR
HOST_ID INT


CREATE TABLE IF NOT EXISTS PLACES (
  ID INT PRIMARY KEY,
  NAME VARCHAR(50),
  HOST_ID INT
);

INSERT INTO PLACES (ID, NAME, HOST_ID) VALUES (4431977, 'BOUTIQUE STAYS - Somerset Terrace, Pet Friendly', 760849);
INSERT INTO PLACES (ID, NAME, HOST_ID) VALUES (5194998, 'BOUTIQUE STAYS - Elwood Beaches 3, Pet Friendly', 760849);
INSERT INTO PLACES (ID, NAME, HOST_ID) VALUES (16045624, 'Urban Jungle in the Heart of Melbourne', 30900122);
INSERT INTO PLACES (ID, NAME, HOST_ID) VALUES (17810814, 'Stylish Bayside Retreat with a Luscious Garden', 760849);
INSERT INTO PLACES (ID, NAME, HOST_ID) VALUES (22740286, 'FREE PARKING - The Velvet Lux in Melbourne CBD', 30900122);
INSERT INTO PLACES (ID, NAME, HOST_ID) VALUES (22868779, '★ Fresh Fitzroy Pad with City Views! ★', 21058208);

-- 테이블 확인
SELECT * FROM PLACES;

-- 데이터 비우기
TRUNCATE PLACES;

-- 이 서비스에서는 공간을 둘 이상 등록한 사람을 "헤비 유저"라고 부릅니다. 헤비 유저가 등록한 공간의 정보를 아이디 순으로 조회하는 SQL문을 작성해주세요.
SELECT *
  FROM PLACES
 WHERE HOST_ID IN (SELECT HOST_ID
                     FROM PLACES
                    GROUP BY HOST_ID
                   HAVING COUNT(*) > 1)
 ORDER BY ID;
 
