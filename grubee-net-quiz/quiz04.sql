-- [리스트 1] 원본리스트
CREATE TABLE t4 AS
SELECT '01' id, 1 s_x, 3 s_y, 4 s_z, 1 e_x, 2 e_y, 4 e_z FROM dual
UNION ALL SELECT '02', 2, 8, 7, 8, 8, 7 FROM dual
UNION ALL SELECT '03', 1, 4, 6, 1, 4, 5 FROM dual
UNION ALL SELECT '04', 1, 6, 7, 1, 5, 7 FROM dual
UNION ALL SELECT '05', 9, 1, 4, 3, 1, 4 FROM dual
UNION ALL SELECT '06', 6, 1, 1, 7, 1, 0 FROM dual
UNION ALL SELECT '07', 4, 1, 3, 5, 1, 2 FROM dual
UNION ALL SELECT '08', 2, 8, 7, 1, 6, 7 FROM dual
UNION ALL SELECT '09', 1, 5, 7, 1, 4, 6 FROM dual
UNION ALL SELECT '10', 8, 8, 7, 8, 7, 7 FROM dual
UNION ALL SELECT '11', 1, 2, 4, 2, 1, 4 FROM dual
UNION ALL SELECT '12', 3, 1, 4, 4, 1, 3 FROM dual
UNION ALL SELECT '13', 5, 1, 2, 6, 1, 1 FROM dual
UNION ALL SELECT '14', 1, 4, 5, 1, 3, 4 FROM dual;
 
SELECT * FROM t4;
/*
[표 1] 원본테이블
ID          S_X        S_Y        S_Z        E_X        E_Y        E_Z
---- ---------- ---------- ---------- ---------- ---------- ----------
01            1          3          4          1          2          4
02            2          8          7          8          8          7
03            1          4          6          1          4          5
04            1          6          7          1          5          7
05            9          1          4          3          1          4
06            6          1          1          7          1          0
07            4          1          3          5          1          2
08            2          8          7          1          6          7
09            1          5          7          1          4          6
10            8          8          7          8          7          7
11            1          2          4          2          1          4
12            3          1          4          4          1          3
13            5          1          2          6          1          1
14            1          4          5          1          3          4
[표 2] 결과테이블
GR_I        SEQ PATH
---- ---------- --------------------
02            1 02
02            2 02-10
05            1 05
05            2 05-12
05            3 05-12-07
05            4 05-12-07-13
05            5 05-12-07-13-06
08            1 08
08            2 08-04
08            3 08-04-09
08            4 08-04-09-03
08            5 08-04-09-03-14
08            6 08-04-09-03-14-01
08            7 08-04-09-03-14-01-11
문제설명
<표 1>은 파이프의 정보를 가진 원본테이블입니다. 파이프의 고유 식별번호인 ID와 시작점과 끝점의 좌표를 가지고 있습니다.
3차원 좌표이므로, 컬럼은 아래와 같습니다. 파이프번호(ID), 시작점 좌표(S_X, S_Y, S_Z), 끝점 좌표(E_X, E_Y, E_Z) 각각의 파이프는 서로 연결되어 있으며 연결된 두 파이프를 생각해보면, 
하나의 파이프의 끝점은 연결된 다른 파이프의 시작점과 일치할 것입니다.
각각의 파이프들의 연결 관계를 파악하고 <표 2>의 결과를 도출하는 SQL을 작성하는 문제입니다.
<표 2>의 결과는 서로 연결되어 있는 파이프끼리 동일한 그룹ID(GR_ID)를 부여하고, 연결된 순서(SEQ)를 표시하고, 마지막으로 연결경로(PATH)를 순차적으로 보여주는 것입니다.
*/

WITH RECURSIVE PIPE AS (
  SELECT 1 AS LEVEL, A.ID S_ID, B.ID E_ID
    FROM t4 A
    JOIN t4 B ON B.S_X = A.E_X
             AND B.S_Y = A.E_Y
             AND B.S_Z = A.E_Z
  UNION ALL
  SELECT B.LEVEL+1, B.E_ID, A.E_ID
    FROM (SELECT A.ID S_ID, B.ID E_ID FROM t4 A
            JOIN t4 B ON B.S_X = A.E_X
                     AND B.S_Y = A.E_Y
                     AND B.S_Z = A.E_Z) A
  JOIN PIPE AS B ON A.S_ID = B.E_ID
)
SELECT MAX(S_ID), MAX(E_ID)
  FROM PIPE
 GROUP BY S_ID;
 ORDER BY LEVEL;

CREATE TABLE LINE AS 
WITH PIPE AS (SELECT A.ID S, B.ID E
                FROM t4 A
                JOIN t4 B ON B.S_X = A.E_X
                         AND B.S_Y = A.E_Y
                         AND B.S_Z = A.E_Z)
 , CONNECT AS (SELECT A.S AS `A`, A.E AS `B`, B.E AS `C`, C.E AS `D`, D.E `E`, E.E `F`, F.E `G`
                FROM PIPE A
                LEFT JOIN PIPE B ON A.E = B.S
                LEFT JOIN PIPE C ON B.E = C.S
                LEFT JOIN PIPE D ON C.E = D.S
                LEFT JOIN PIPE E ON D.E = E.S
                LEFT JOIN PIPE F ON E.E = F.S)
  , LINE AS (SELECT *
                  FROM CONNECT C
                 WHERE NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.F = C2.G)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.E = C2.G)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.D = C2.G)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.C = C2.G)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.B = C2.G)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.A = C2.G)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.E = C2.F)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.D = C2.F)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.C = C2.F)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.B = C2.F)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.A = C2.F)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.D = C2.E)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.C = C2.E)
                   AND NOT EXISTS (SELECT 1 FROM CONNECT C2 WHERE C.B = C2.E)
                 ORDER BY A) SELECT * FROM LINE;

SELECT A GR_I
     , 1 AS SEQ
     , A PATH
  FROM LINE
 UNION ALL
SELECT A GR_I
     , 2
     , CONCAT(A, '-', B)
  FROM LINE
 WHERE B IS NOT NULL
 UNION ALL
SELECT A GR_I
     , 3
     , CONCAT(A, '-', B, '-', C)
  FROM LINE
 WHERE C IS NOT NULL
 UNION ALL
SELECT A GR_I
     , 4
     , CONCAT(A, '-', B, '-', C, '-', D)
  FROM LINE
 WHERE D IS NOT NULL
 UNION ALL
SELECT A GR_I
     , 5
     , CONCAT(A, '-', B, '-', C, '-', D, '-', E)
  FROM LINE
 WHERE E IS NOT NULL
 UNION ALL
SELECT A GR_I
     , 6
     , CONCAT(A, '-', B, '-', C, '-', D, '-', E, '-', F)
  FROM LINE
 WHERE F IS NOT NULL
 UNION ALL
SELECT A GR_I
     , 7
     , CONCAT(A, '-', B, '-', C, '-', D, '-', E, '-', F, '-', G)
  FROM LINE
 WHERE G IS NOT NULL
 ORDER BY GR_I, PATH;
 
 
 
 

   
  
