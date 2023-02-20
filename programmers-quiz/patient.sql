다음은 종합병원에 등록된 환자정보를 담은 PATIENT 테이블입니다. PATIENT 테이블은 다음과 같으며 
PT_NO, PT_NAME, GEND_CD, AGE, TLNO는 각각 환자번호, 환자이름, 성별코드, 나이, 전화번호를 의미합니다.

Column name Type  Nullable
PT_NO VARCHAR(10) FALSE
PT_NAME VARCHAR(20) FALSE
GEND_CD VARCHAR(1)  FALSE
AGE INTEGER FALSE
TLNO  VARCHAR(50) TRUE

CREATE TABLE IF NOT EXISTS PATIENT (
  PT_NO VARCHAR(10) NOT NULL PRIMARY KEY,
  PT_NAME VARCHAR(20) NOT NULL,
  GEND_CD VARCHAR(1)  NOT NULL,
  AGE INTEGER NOT NULL,
  TLNO  VARCHAR(50)
);

-- 테이블 확인
SELECT * FROM PATIENT;

-- 데이터 비우기
TRUNCATE PATIENT;
INSERT INTO PATIENT (PT_NO, PT_NAME, GEND_CD, AGE, TLNO) VALUES ('PT22000003', '브라운', 'M', 18, '01031246641');
INSERT INTO PATIENT (PT_NO, PT_NAME, GEND_CD, AGE, TLNO) VALUES ('PT22000004', '크롱', 'M', 7, NULL);
INSERT INTO PATIENT (PT_NO, PT_NAME, GEND_CD, AGE, TLNO) VALUES ('PT22000006', '뽀뽀', 'W', 8, NULL);
INSERT INTO PATIENT (PT_NO, PT_NAME, GEND_CD, AGE, TLNO) VALUES ('PT22000009', '한나', 'W', 12, '01032323117');
INSERT INTO PATIENT (PT_NO, PT_NAME, GEND_CD, AGE, TLNO) VALUES ('PT22000012', '뿡뿡이', 'M', 5, NULL);
INSERT INTO PATIENT (PT_NO, PT_NAME, GEND_CD, AGE, TLNO) VALUES ('PT22000013', '크리스', 'M', 30, '01059341192');
INSERT INTO PATIENT (PT_NO, PT_NAME, GEND_CD, AGE, TLNO) VALUES ('PT22000014', '토프', 'W', 22, '01039458213');
INSERT INTO PATIENT (PT_NO, PT_NAME, GEND_CD, AGE, TLNO) VALUES ('PT22000018', '안나', 'W', 11, NULL);
INSERT INTO PATIENT (PT_NO, PT_NAME, GEND_CD, AGE, TLNO) VALUES ('PT22000019', '바라', 'W', 10, '01079068799');
INSERT INTO PATIENT (PT_NO, PT_NAME, GEND_CD, AGE, TLNO) VALUES ('PT22000021', '릴로', 'W', 33, '01023290767');

-- PATIENT 테이블에서 12세 이하인 여자환자의 환자이름, 환자번호, 성별코드, 나이, 전화번호를 조회하는 SQL문을 작성해주세요.
-- 이때 전화번호가 없는 경우, 'NONE'으로 출력시켜 주시고 결과는 나이를 기준으로 내림차순 정렬하고, 나이 같다면 환자이름을 기준으로 오름차순 정렬해주세요.

SELECT PT_NAME
     , PT_NO
     , GEND_CD
     , AGE
     , IFNULL(TLNO, 'NONE') AS TLNO
  FROM PATIENT
 WHERE AGE <= 12
   AND GEND_CD = 'W'
 ORDER BY AGE DESC, PT_NAME;
  