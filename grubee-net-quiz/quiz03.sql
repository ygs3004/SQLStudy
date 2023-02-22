-- [리스트 1] 원본리스트
CREATE TABLE t3 AS
 SELECT '마농' nm, '사과' c1, '배' c2, '자두' c3, '딸기' c4 FROM dual
 UNION ALL
 SELECT '재석', '배'  , '수박'  , '바나나', ''     FROM dual
 UNION ALL
 SELECT '정식', '메론', '바나나', '자두'  , '딸기' FROM dual
 UNION ALL
 SELECT '마소', '메론', ''    , ''      , ''     FROM dual
 UNION ALL
 SELECT '민용', '배'  , '자두'  , '사과'  , '딸기' FROM dual
 UNION ALL
 SELECT '혜연', '자두', '딸기'  , '사과'  , '배'   FROM dual
 UNION ALL
 SELECT '수지', '오디', '코코넛', '두리안', '머루' FROM dual;
/*
[표 1] 원본테이블
NM           C1           C2                 C3                 C4
------------ ------------ ----------------- ----------------- ---------
마농         사과         배                 자두               딸기
재석         배           수박               바나나
정식         메론         바나나             자두               딸기
마소         메론
민용         배           자두               사과               딸기
혜연         자두         딸기               사과               배
수지         오디         코코넛             두리안             머루
[표 2] 결과테이블

NM         C1         C2         C3         C4         NM2                         CNT
---------- ---------- ---------- ---------- ---------- -------------------- ----------
마농       사과         배         자두          딸기       민용,혜연                     4
마소       메론                                          정식                         1
민용       배          자두        사과          딸기       마농,혜연                     4
수지       오디         코코넛      두리안         머루                                   0
재석       배          수박        바나나                  마농,민용,정식,혜연              1
정식       메론         바나나      자두          딸기       마농,민용,혜연                  2
혜연       자두         딸기       사과          배         마농,민용                     4
문제설명
마농군은 친구들이 좋아하는 과일이 무엇인지를 조사했습니다. 친구들은 최소 한 개 이상 네 개 이하의 좋아하는 과일 이름을 마농군에게 적어줬습니다.
마농군은 이 정보를 <표 1> 형태의 원본테이블에 저장했습니다. 이 정보를 이용해 <표 2> 의 결과테이블 얻고자 합니다.
서로 좋아하는 과일이 일치하는 수가 가장 많은 건수(CNT)와 친구(NM2)를 표시하는 문제입니다.
일치하는 과일수가 가장 많은 친구가 여러 명일 경우에는 친구이름을 쉼표(,)로 구분하여 모두 표시해야 합니다. 
<표 2>의 결과를 보면 마농군이 좋아하는 과일 4가지가 모두 일치하는 친구가 2명(민용,혜연)이 있음을 보여주는 것입니다. 
수지가 좋아하는 과일을 좋아하는 친구는 아무도 없음을 나타냅니다.
*/
SELECT NM, C1, C2, C3, C4, NM2, CNT
   FROM (
         SELECT NM, C1, C2, C3, C4, group_concat(CNM ORDER BY CNM) NM2, CNT, CNTRANK
           FROM (
                 SELECT *, RANK() OVER(PARTITION BY NM ORDER BY CNT DESC) CNTRANK
                  FROM (SELECT NM, C1, C2, C3, C4, CNM, C1E + C2E + C3E + C4E CNT
                           FROM (
                                  SELECT A.NM, A.C1, A.C2, A.C3, A.C4
                                       , CASE WHEN A.C1 != '' AND INSTR(CONCAT(B.C1, B.C2, B.C3, B.C4), A.C1) != 0 THEN 1 ELSE 0 END C1E
                                       , CASE WHEN A.C2 != '' AND INSTR(CONCAT(B.C1, B.C2, B.C3, B.C4), A.C2) != 0 THEN 1 ELSE 0 END C2E
                                       , CASE WHEN A.C3 != '' AND INSTR(CONCAT(B.C1, B.C2, B.C3, B.C4), A.C3) != 0 THEN 1 ELSE 0 END C3E
                                       , CASE WHEN A.C4 != '' AND INSTR(CONCAT(B.C1, B.C2, B.C3, B.C4), A.C4) != 0 THEN 1 ELSE 0 END C4E
                                       , CASE WHEN (A.C1 != '' AND INSTR(CONCAT(B.C1, B.C2, B.C3, B.C4), A.C1) != 0) OR
                                                   (A.C2 != '' AND INSTR(CONCAT(B.C1, B.C2, B.C3, B.C4), A.C2) != 0) OR
                                                   (A.C3 != '' AND INSTR(CONCAT(B.C1, B.C2, B.C3, B.C4), A.C3) != 0) OR
                                                   (A.C4 != '' AND INSTR(CONCAT(B.C1, B.C2, B.C3, B.C4), A.C4) != 0) THEN B.NM END CNM
                                    FROM t3 A, t3 B
                                   WHERE A.NM <> B.NM 
                                 ) T
                        ) A
                ) B
         GROUP BY NM, C1, C2, C3, C4, CNT
         HAVING B.CNTRANK = 1
 ) ANSWER;
 
 
 SELECT * FROM t3 A, t3 b;