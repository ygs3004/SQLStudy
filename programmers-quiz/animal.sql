ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. ANIMAL_INS 테이블 구조는 다음과 같으며, 
ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 
각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.

NAME  TYPE  NULLABLE
ANIMAL_ID VARCHAR(N)  FALSE
ANIMAL_TYPE VARCHAR(N)  FALSE
DATETIME  DATETIME  FALSE
INTAKE_CONDITION  VARCHAR(N)  FALSE
NAME  VARCHAR(N)  TRUE
SEX_UPON_INTAKE VARCHAR(N)  FALSE

CREATE TABLE IF NOT EXISTS ANIMAL_INS (
  ANIMAL_ID VARCHAR(7) NOT NULL PRIMARY KEY,
  ANIMAL_TYPE VARCHAR(20) NOT NULL,  
  DATETIME DATETIME NOT NULL,
  INTAKE_CONDITION  VARCHAR(20) NOT NULL,
  NAME VARCHAR(20),
  SEX_UPON_INTAKE VARCHAR(20) NOT NULL
);

ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블입니다. ANIMAL_OUTS 테이블 구조는 다음과 같으며, 
ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME는 각각 동물의 아이디, 생물 종, 입양일, 이름, 성별 및 중성화 여부를 나타냅니다. 
ANIMAL_OUTS 테이블의 ANIMAL_ID는 ANIMAL_INS의 ANIMAL_ID의 외래 키입니다.


CREATE TABLE IF NOT EXISTS ANIMAL_OUTS (
  ANIMAL_ID VARCHAR(7) NOT NULL, 
  ANIMAL_TYPE VARCHAR(20) NOT NULL,
  DATETIME DATETIME NOT NULL,
  NAME VARCHAR(20),
  SEX_UPON_OUTCOME VARCHAR(20) NOT NULL,
  FOREIGN KEY(ANIMAL_ID) REFERENCES ANIMAL_INS(ANIMAL_ID)
);

-- 테이블 확인
SELECT * FROM ANIMAL_INS;
SELECT * FROM ANIMAL_OUTS;

-- 데이터 비우기
TRUNCATE ANIMAL_INS;
TRUNCATE ANIMAL_OUTS;

-- ANIMAL_INS
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A399552', 'Dog', '2013-10-14 15:38:00', 'Normal', 'Jack', 'Neutered Male');

INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A379998', 'Dog', '2013-10-23 11:42:00', 'Normal', 'Disciple', 'Intact Male');
     
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A370852 ', 'Dog', '2013-11-03 15:04:00', 'Normal', 'Katie', 'Spayed Female');
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A403564 ', 'Dog', '2013-11-18 17:03:00', 'Normal', 'Anna', 'Spayed Female');
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A365172', 'Dog', '2014-08-26 12:53:00', 'Normal',  'Diablo',  'Neutered Male');
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A367012', 'Dog', '2015-09-16 09:06:00', 'Sick',  'Miller',  'Neutered Male');
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A365302', 'Dog', '2017-01-08 16:34:00', 'Aged',  'Minnie',  'Spayed Female');
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A381217', 'Dog', '2017-07-08 09:41:00', 'Sick',  'Cherokee',  'Neutered Male');     
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A434523', 'Cat', '2015-11-20 14:18:00', 'Normal', NULL, 'Spayed Female');
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A562649', 'Dog', '2014-03-20 18:06:00', 'Sick', NULL, 'Spayed Female');   
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A524634', 'Dog', '2015-01-02 18:54:00', 'Normal',  '*Belle',  'Intact Female');   

INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A465637', 'Dog', '2017-06-04 08:17:00', 'Injured', '*Commander', 'Neutered Male');  

INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A350276', 'Cat', '2017-08-13 13:50:00', 'Normal', 'Jewel Spayed', 'Female');  
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A350375', 'Cat', '2017-03-06 15:01:00', 'Normal', 'Meo', 'Neutered Male');  
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A368930', 'Dog', '2014-06-08 13:20:00', 'Normal', NULL, 'Spayed Female');  
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A349996', 'Cat', '2018-01-22 14:32:00', 'Normal', 'Sugar', 'Neutered Male');     
    
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A396810', 'Dog', '2016-08-22 16:13:00', 'Injured', 'Raven', 'Spayed Female');        
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A410668', 'Cat', '2015-11-19 13:41:00', 'Normal', 'Raven', 'Spayed Female');    

INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A355753', 'Dog', '2015-09-10 13:14:00', 'Normal', 'Elijah', 'Neutered Male');

INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A352872', 'Dog', '2015-07-09 17:51:00', 'Aged', 'Peanutbutter', 'Neutered Male');

INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A353259', 'Dog', '2016-05-08 12:57:00', 'Injured', 'Bj', 'Neutered Male');
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A373219', 'Cat', '2014-07-29 11:43:00', 'Normal', 'Ella', 'Spayed Female');
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A382192', 'Dog', '2015-03-13 13:14:00', 'Normal', 'Maxwell 2', 'Intact Male');

INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A354597', 'Cat', '2014-05-02 12:16:00', 'Normal', 'Ariel', 'Spayed Female');

INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A373687', 'Dog', '2014-03-20 12:31:00', 'Normal', 'Rosie', 'Spayed Female');   
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A367438', 'Dog', '2015-09-10 16:01:00', 'Normal', 'Cookie', 'Spayed Female');   
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A405494', 'Dog', '2014-05-16 14:17:00', 'Normal', 'Kaila', 'Spayed Female');   
   
INSERT INTO ANIMAL_INS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE)
     VALUES ('A410330', 'Dog',' 2016-09-11 14:09:00', 'Sick', 'Chewy', 'Intact Female');   
   
-- ANIMAL_OUTS
INSERT INTO ANIMAL_OUTS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, NAME, SEX_UPON_OUTCOME) VALUES ('A354597', 'Cat', '2014-05-02 12:16:00', 'Ariel', 'Spayed Female');
INSERT INTO ANIMAL_OUTS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, NAME, SEX_UPON_OUTCOME) VALUES ('A373687', 'Dog', '2014-03-20 12:31:00', 'Rosie', 'Spayed Female');
INSERT INTO ANIMAL_OUTS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, NAME, SEX_UPON_OUTCOME) VALUES ('A368930', 'Dog', '2014-06-13 15:52:00', NULL, 'Spayed Female');
INSERT INTO ANIMAL_OUTS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, NAME, SEX_UPON_OUTCOME) VALUES ('A367438', 'Dog', '2015-09-12 13:30:00', 'Cookie', 'Spayed Female');
INSERT INTO ANIMAL_OUTS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, NAME, SEX_UPON_OUTCOME) VALUES ('A382192', 'Dog', '2015-03-16 13:46:00', 'Maxwell 2', 'Neutered Male');
INSERT INTO ANIMAL_OUTS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, NAME, SEX_UPON_OUTCOME) VALUES ('A405494', 'Dog', '2014-05-20 11:44:00', 'Kaila', 'Spayed Female');
INSERT INTO ANIMAL_OUTS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, NAME, SEX_UPON_OUTCOME) VALUES ('A410330', 'Dog', '2016-09-13 13:46:00', 'Chewy', 'Spayed Female');
INSERT INTO ANIMAL_OUTS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, NAME, SEX_UPON_OUTCOME) VALUES ('A350276', 'Cat', '2018-01-28 17:51:00', 'Jewel', 'Spayed Female');
INSERT INTO ANIMAL_OUTS (ANIMAL_ID, ANIMAL_TYPE, `DATETIME`, NAME, SEX_UPON_OUTCOME) VALUES ('A381217', 'Dog', '2017-06-09 18:51:00', 'Cherokee', 'Neutered Male');

-- 동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL 문을 작성해주세요.
SELECT NAME FROM ANIMAL_INS ORDER BY `DATETIME` LIMIT 1;
   
-- 동물 보호소에 들어온 동물 중 젊은 동물1(INTAKE_CONDITION이 Aged가 아닌 경우를 뜻함↩)의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 이때 결과는 아이디 순으로 조회해주세요.
SELECT ANIMAL_ID
      ,NAME
  FROM ANIMAL_INS
 WHERE INTAKE_CONDITION != 'Aged'
 ORDER BY ANIMAL_ID;

-- 동물 보호소에 들어온 모든 동물의 아이디와 이름을 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요. SQL을 실행하면 다음과 같이 출력되어야 합니다.
SELECT ANIMAL_ID, NAME 
  FROM ANIMAL_INS 
 ORDER BY ANIMAL_ID; 
 
-- 동물 보호소에 들어온 동물 중, 이름이 있는 동물의 ID를 조회하는 SQL 문을 작성해주세요. 단, ID는 오름차순 정렬되어야 합니다.
SELECT ANIMAL_ID
  FROM ANIMAL_INS
 WHERE NAME IS NOT NULL
 ORDER BY ANIMAL_ID;
 
-- 입양 게시판에 동물 정보를 게시하려 합니다. 동물의 생물 종, 이름, 성별 및 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요.
-- 이때 프로그래밍을 모르는 사람들은 NULL이라는 기호를 모르기 때문에, 이름이 없는 동물의 이름은 "No name"으로 표시해 주세요.
SELECT ANIMAL_TYPE, IFNULL(NAME, 'No name'), SEX_UPON_INTAKE
  FROM ANIMAL_INS
 ORDER BY ANIMAL_ID;
   
-- 동물 보호소에 동물이 몇 마리 들어왔는지 조회하는 SQL 문을 작성해주세요.
SELECT COUNT(*) 
  FROM ANIMAL_INS;

-- 동물 보호소에 들어온 모든 동물의 아이디와 이름, 보호 시작일을 이름 순으로 조회하는 SQL문을 작성해주세요. 
-- 단, 이름이 같은 동물 중에서는 보호를 나중에 시작한 동물을 먼저 보여줘야 합니다.
SELECT ANIMAL_ID, NAME, DATETIME
  FROM ANIMAL_INS
 ORDER BY NAME, DATETIME DESC;
 
-- 동물 보호소에 가장 먼저 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.
SELECT MIN(DATETIME)
  FROM ANIMAL_INS;
  
-- 동물 보호소에 들어온 동물의 이름은 몇 개인지 조회하는 SQL 문을 작성해주세요. 이때 이름이 NULL인 경우는 집계하지 않으며 중복되는 이름은 하나로 칩니다.
SELECT COUNT(DISTINCT NAME)
  FROM ANIMAL_INS
 WHERE NAME IS NOT NULL;
 
-- 동물 보호소에 들어온 동물 중 아픈 동물(INTAKE_CONDITION이 Sick 인 경우를 뜻함)의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 이때 결과는 아이디 순으로 조회해주세요.
SELECT ANIMAL_ID, NAME
  FROM ANIMAL_INS
 WHERE INTAKE_CONDITION = 'Sick'
 ORDER BY ANIMAL_ID;
 
-- 보호소에 돌아가신 할머니가 기르던 개를 찾는 사람이 찾아왔습니다. 이 사람이 말하길 할머니가 기르던 개는 이름에 'el'이 들어간다고 합니다. 
-- 동물 보호소에 들어온 동물 이름 중, 이름에 "EL"이 들어가는 개의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 이름 순으로 조회해주세요. 단, 이름의 대소문자는 구분하지 않습니다.
SELECT ANIMAL_ID, NAME
  FROM ANIMAL_INS
 WHERE UPPER(NAME) LIKE '%EL%'
   AND ANIMAL_TYPE = 'Dog' 
 ORDER BY NAME;
 
-- 동물 보호소에 들어온 모든 동물의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 이때 결과는 ANIMAL_ID 역순으로 보여주세요. 
SELECT NAME, DATETIME
  FROM ANIMAL_INS
 ORDER BY ANIMAL_ID DESC;
 
-- 동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요. 이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.
SELECT NAME, COUNT(NAME) AS COUNT
  FROM ANIMAL_INS
 GROUP BY NAME
HAVING COUNT(NAME) >=2
   AND NAME IS NOT NULL
 ORDER BY NAME 

-- ANIMAL_INS 테이블에 등록된 모든 레코드에 대해, 각 동물의 아이디와 이름, 들어온 날짜(시각(시-분-초)을 제외한 날짜(년-월-일)만 보여주세요)를 조회하는 SQL문을 작성해주세요. 이때 결과는 아이디 순으로 조회해야 합니다.
SELECT ANIMAL_ID
     , NAME
     , DATE_FORMAT(DATETIME, '%Y-%m-%d')
  FROM ANIMAL_INS
 ORDER BY ANIMAL_ID;
 
-- 보호소의 동물이 중성화되었는지 아닌지 파악하려 합니다. 중성화된 동물은 SEX_UPON_INTAKE 컬럼에 'Neutered' 또는 'Spayed'라는 단어가 들어있습니다. 
-- 동물의 아이디와 이름, 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 이때 중성화가 되어있다면 'O', 아니라면 'X'라고 표시해주세요.
SELECT ANIMAL_ID
     , NAME
     , (CASE WHEN SEX_UPON_INTAKE LIKE 'Neutered%'
               OR SEX_UPON_INTAKE LIKE 'Spayed%' THEN 'O'
             ELSE 'X' END) AS 중성화
  FROM ANIMAL_INS
 ORDER BY ANIMAL_ID;
 
-- 동물 보호소에 들어온 동물 중 고양이와 개가 각각 몇 마리인지 조회하는 SQL문을 작성해주세요. 이때 고양이를 개보다 먼저 조회해주세요.
SELECT ANIMAL_TYPE, COUNT(*) count
  FROM ANIMAL_INS
 GROUP BY ANIMAL_TYPE
HAVING ANIMAL_TYPE = 'Dog' OR ANIMAL_TYPE ='Cat'
 ORDER BY ANIMAL_TYPE;
 
-- 동물 보호소에 들어온 동물 중, 이름이 없는 채로 들어온 동물의 ID를 조회하는 SQL 문을 작성해주세요. 단, ID는 오름차순 정렬되어야 합니다.
SELECT ANIMAL_ID
  FROM ANIMAL_INS
 WHERE NAME IS NULL 
 ORDER BY ANIMAL_ID;
 
-- 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 09:00부터 19:59까지, 
SELECT TRIM(LEADING '0' FROM DATE_FORMAT(DATETIME, '%H')) AS HOUR
     , COUNT(*)
  FROM ANIMAL_OUTS
 WHERE DATE_FORMAT(DATETIME, '%H:%i') BETWEEN '09:00' AND '19:59'
 GROUP BY HOUR
 ORDER BY DATE_FORMAT(DATETIME, '%H');

-- 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호
-- 시작일을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 시작일 순으로 조회해야 합니다.

SELECT AI.NAME
     , AI.`DATETIME` 
  FROM ANIMAL_INS AI
 WHERE ANIMAL_ID NOT IN (SELECT AI.ANIMAL_ID 
                           FROM ANIMAL_INS AI
                           JOIN ANIMAL_OUTS AO ON AI.ANIMAL_ID = AO.ANIMAL_ID)
 ORDER BY `DATETIME`
 LIMIT 3;

-- 보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다. 보호소에 들어올 당시에는 중성화1되지 않았지만, 
-- 보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 이름을 조회하는 아이디 순으로 조회하는 SQL 문을 작성해주세요.
-- 1. 중성화를 거치지 않은 동물은 성별 및 중성화 여부에 Intact, 중성화를 거친 동물은 Spayed 또는 Neutered라고 표시되어있습니다.
SELECT AI.ANIMAL_ID 
     , AI.ANIMAL_TYPE 
     , AI.NAME
  FROM ANIMAL_INS AI
  JOIN ANIMAL_OUTS AO ON AI.ANIMAL_ID = AO.ANIMAL_ID
 WHERE AI.SEX_UPON_INTAKE LIKE ('Intact%')
   AND (
           AO.SEX_UPON_OUTCOME LIKE ('Spayed%') 
        OR AO.SEX_UPON_OUTCOME LIKE ('Neutered%')
        );
 
-- 입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 기간이 긴 순으로 조회해야 합니다.
SELECT AO.ANIMAL_ID
     , AO.NAME
  FROM ANIMAL_OUTS AO
  JOIN ANIMAL_INS AI ON AI.ANIMAL_ID = AO.ANIMAL_ID
 ORDER BY AO.DATETIME - AI.DATETIME DESC
 LIMIT 2;
 
-- 관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다.
-- 보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 시작일이 빠른 순으로 조회해야합니다.
SELECT AO.ANIMAL_ID AS ANIMAL_ID
     , AO.NAME AS ANIMAL_NAME
  FROM ANIMAL_OUTS AO
  JOIN ANIMAL_INS AI ON AI.ANIMAL_ID = AO.ANIMAL_ID
 WHERE AI.DATETIME > AO.DATETIME
 ORDER BY AI.DATETIME;
 
-- 동물 보호소에 들어온 동물 중 이름이 Lucy, Ella, Pickle, Rogan, Sabrina, Mitty인 
-- 동물의 아이디와 이름, 성별 및 중성화 여부를 조회하는 SQL 문을 작성해주세요.
SELECT ANIMAL_ID
     , NAME
     , SEX_UPON_INTAKE
  FROM ANIMAL_INS
 WHERE NAME IN('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty');
 
-- 동물 보호소에 들어온 모든 동물의 정보를 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요. 
SELECT *
  FROM ANIMAL_INS 
 ORDER BY ANIMAL_ID;
 
-- 천재지변으로 인해 일부 데이터가 유실되었습니다. 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.
SELECT AO.ANIMAL_ID  
     , AO.NAME
  FROM ANIMAL_OUTS AO
  LEFT JOIN ANIMAL_INS AI ON AO.ANIMAL_ID = AI.ANIMAL_ID
 WHERE AI.ANIMAL_ID IS NULL
 ORDER BY ANIMAL_ID;

-- 가장 최근에 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.
SELECT DATETIME
  FROM ANIMAL_INS
 ORDER BY DATETIME DESC
 LIMIT 1; 
 
-- 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 0시부터 23시까지, 
-- 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 이때 결과는 시간대 순으로 정렬해야 합니다.
SELECT T.HOUR
     , IFNULL(CT.COUNT, 0)
  FROM (SELECT @ROWNUM := @ROWNUM+1 AS HOUR
          FROM (SELECT @ROWNUM := -1) R, ANIMAL_OUTS
         LIMIT 24) T
  LEFT JOIN (SELECT HOUR(DATETIME) HOUR
             , COUNT(HOUR(`DATETIME`)) COUNT
          FROM ANIMAL_OUTS
         GROUP BY HOUR(`DATETIME`)) CT
    ON T.HOUR = CT.HOUR;
-- T 테이블의 ROW가 24개 이상일때만 시간이 모두 나오는 문제가 있지만 프로그래머스 기준 통과  
-- 프로그래머스 질문방 쿼리(재귀 테이블 이용) : RECURSIVE 이용하여 자신을 참조하는 테이블 생성
WITH RECURSIVE TIME AS (
    SELECT 0 AS HOUR
    UNION ALL
    SELECT HOUR+1 FROM TIME WHERE HOUR < 23
) 
SELECT T.HOUR
     , IFNULL(CT.COUNT, 0)
  FROM TIME T
  LEFT JOIN (SELECT HOUR(DATETIME) HOUR
                  , COUNT(HOUR(`DATETIME`)) COUNT
               FROM ANIMAL_OUTS
              GROUP BY HOUR(`DATETIME`)) CT
    ON T.HOUR = CT.HOUR;



 