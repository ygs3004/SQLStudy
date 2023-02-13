--  원본 테이블
CREATE TABLE t
AS
SELECT 1 no, '1:10|2:11|3:12|4:15' v FROM dual
UNION ALL SELECT 2, '1:17|3:15|4:25' FROM dual
UNION ALL SELECT 3, '2:11|4:15'      FROM dual
UNION ALL SELECT 4, '1:10|2:21|4:19' FROM dual;
 
SELECT * FROM t;

/*
원본테이블
     NO V
------ ---------------------------
     1 1:10|2:11|3:12|4:15
     2 1:17|3:15|4:25
     3 2:11|4:15
     4 1:10|2:21|4:19
 
결과테이블
GB 1    2    3    4
-- ---- ---- ---- ----
1  10   17        10
3  12   15
2  11        11   21
4  15   25   15   19
 * */

-- Q. 원본테이블에서 결과테이블을 출력하시오

SELECT NO AS GB
	 , REPLACE(SUBSTR((SELECT V FROM t WHERE NO=1), LOCATE(CONCAT(@ROWNUM:=@ROWNUM+1, ":"), (SELECT V FROM t WHERE NO=1))+2, 2), ':1', '') AS '1'
 	 , REPLACE(SUBSTR((SELECT V FROM t WHERE NO=2), LOCATE(CONCAT(@ROWNUM:=@ROWNUM, ":"), (SELECT V FROM t WHERE NO=2))+2, 2), ':1', '') AS '2'
	 , REPLACE(SUBSTR((SELECT V FROM t WHERE NO=3), LOCATE(CONCAT(@ROWNUM:=@ROWNUM, ":"), (SELECT V FROM t WHERE NO=3))+2, 2), ':1', '') AS '3'
	 , REPLACE(SUBSTR((SELECT V FROM t WHERE NO=4), LOCATE(CONCAT(@ROWNUM:=@ROWNUM, ":"), (SELECT V FROM t WHERE NO=4))+2, 2), ':1', '') AS '4'
  FROM t, (SELECT @ROWNUM:=0) B
 ORDER BY `3`;
-- 알리아스를 기준으로 참조할때는 백틱을 이용해야 한다. 

	 
	
	
	
	