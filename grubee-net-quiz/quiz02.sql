/*
[표 1] 원본테이블
DT                       ID
---------------- ----------
20150801                  1
20150801                  2
20150801                  1
20150802                  1
20150802                  2
20150802                  2
20150803                  3
20150804                  4
20150804                  1
20150805                  1

DT                 접속건수   접속자수 누적접속건수 누적접속자수
---------------- ---------- ---------- ------------ ------------
20150801                  3          2            3            2
20150802                  3          2            6            2
20150803                  1          1            7            3
20150804                  2          2            9            4
20150805                  1          1           10            4

문제설명
<리스트 1>은 사용자 접속기록을 관리하는 테이블입니다. 사용자가 접속할 때 마다 기록이 되기 때문에 동일 사용자가 하루에 여러번 기록될 수 있습니다. 
이 기록을 토대로 일별 접속 현황 통계자료를 작성해야 합니다. 접속일자 기준으로 다음 네 가지 통계를 한 화면에 보여줘야 합니다.

1. 접속건수 : 접속 기록을 일별로 카운트합니다.
2. 접속자수 : 동일 유저는 한번만 카운트 합니다.
3. 누적접속건수 : 현재일자까지의 누적 건수입니다.
4. 누적접속자수 : 현재일자까지의 누적 접속자수입니다.
*/


CREATE TABLE t2
AS
SELECT '20150801' dt, 1 id FROM dual
UNION ALL SELECT '20150801', 2 FROM dual
UNION ALL SELECT '20150801', 1 FROM dual
UNION ALL SELECT '20150802', 1 FROM dual
UNION ALL SELECT '20150802', 2 FROM dual
UNION ALL SELECT '20150802', 2 FROM dual
UNION ALL SELECT '20150803', 3 FROM dual
UNION ALL SELECT '20150804', 4 FROM dual
UNION ALL SELECT '20150804', 1 FROM dual
UNION ALL SELECT '20150805', 1 FROM dual;

SELECT * FROM t2;

SELECT COUNT(DISTINCT id) FROM t2 GROUP BY dt;

WITH TBL_CONNECT AS (
					SELECT dt AS DT
						  ,COUNT(dt) AS NUMBER_OF_CONNECT
						  ,COUNT(DISTINCT id) AS NUMBER_OF_CONNECT_PEOPLE
						  ,SUM(COUNT(*)) OVER (ORDER BY dt) AS NUMBER_OF_CONNECT_TOTAL
						FROM t2
					 GROUP BY dt
					),
    TBL_CONNECT_TOTAL AS (
                          SELECT dt AS DT
                               , id AS ID
                               , IF(ROW_NUMBER() OVER (PARTITION BY id  ORDER BY dt)=1, 1, 0) AS NEW_CONNECT
                            FROM t2 
                         )
SELECT DISTINCT TC.DT AS DT
  	  ,TC.NUMBER_OF_CONNECT AS 접속건수
	    ,TC.NUMBER_OF_CONNECT_PEOPLE AS 접속자수
	    ,NUMBER_OF_CONNECT_TOTAL AS 누적접속건수
  	  ,SUM(TCT.NEW_CONNECT) OVER (ORDER BY TC.DT) AS 누적접속자수
  FROM TBL_CONNECT TC
  LEFT JOIN TBL_CONNECT_TOTAL TCT ON TC.dt = TCT.dt;