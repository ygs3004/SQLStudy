CREATE TABLE student
(
    student_no NUMBER(4) NOT NULL,
    name VARCHAR2(20),
    age NUMBER(4),
    phone VARCHAR2(20),
    address VARCHAR2(100),
    memo VARCHAR2(200)
);

CREATE SEQUENCE student_seq;

INSERT INTO student
    (student_no, name, age, phone, address, memo)
VALUES
    (student_seq.nextval, '홍길동', 30, '010-1111-2222', '한양', '홍길동입니다.');
    
INSERT INTO student
    (student_no, name, age, phone, address, memo)
VALUES
    (student_seq.nextval, '사임당', 40, '010-3333-4444', '천안', '사임당입니다.');
    
INSERT INTO student
    (student_no, name, age, phone, address, memo)
VALUES
    (student_seq.nextval, '임꺽정', 35, '010-5555-6666', '대전', '꺽정입니다.');
    
INSERT INTO student
    (student_no, name, age, phone, address, memo)
VALUES
    (student_seq.nextval, '아이언맨', 45, '010-2222-3333', '뉴욕', '철 사람입니다.');
    
INSERT INTO student
    (student_no, name, age, phone, address, memo)
VALUES
    (student_seq.nextval, '잡스', 20, '010-8888-9999', '시카고', '잡스입니다.');
    
SELECT * FROM STUDENT;



CREATE TABLE MEMBER(
ID VARCHAR2(20) PRIMARY KEY,
NAME VARCHAR2(30) NOT NULL,
AGE NUMBER(3) NOT NULL,
ADDRESS VARCHAR2(60)
);


INSERT INTO MEMBER(ID, NAME, AGE, ADDRESS) 
    VALUES('dragon', '박문수', 40, '서울시');
    
INSERT INTO MEMBER(ID, NAME, AGE, ADDRESS) 
    VALUES('sky', '김윤신', 30, '부산시');
    
INSERT INTO MEMBER(ID, NAME, AGE, ADDRESS) 
    VALUES('blue', '이순신', 40, '인천시');    
    
INSERT INTO MEMBER(ID, NAME, AGE, ADDRESS) 
    VALUES('star', '신스타', 25, '안양시');    

--SELECT id,name,age,address FROM member WHERE name = '신' ;

SELECT ID, NAME, AGE, ADDRESS FROM MEMBER WHERE NAME LIKE '%신%';
    
SELECT * FROM MEMBER;



-- 게시판 DB 만들기

DROP TABLE BOARD;

CREATE TABLE BOARD(
    BOARD_IDX NUMBER(4) PRIMARY KEY,
    BOARD_NAME VARCHAR2(20),
    BOARD_TITLE VARCHAR2(100),
    BOARD_CONTENT VARCHAR2(300),
    BOARD_DATE DATE DEFAULT SYSDATE,
    BOARD_HIT NUMBER(4) DEFAULT 0
);

DROP SEQUENCE BOARD_SEQ;
CREATE SEQUENCE BOARD_SEQ;

INSERT INTO BOARD(BOARD_IDX, BOARD_NAME, BOARD_TITLE, BOARD_CONTENT, BOARD_DATE)
    VALUES(BOARD_SEQ.NEXTVAL, '홍길동', '글 제목1', '글 내용1', SYSDATE);

INSERT INTO BOARD(BOARD_IDX, BOARD_NAME, BOARD_TITLE, BOARD_CONTENT, BOARD_DATE)
    VALUES(BOARD_SEQ.NEXTVAL, '변사또', '글 제목2', '글 내용2', SYSDATE);

INSERT INTO BOARD(BOARD_IDX, BOARD_NAME, BOARD_TITLE, BOARD_CONTENT, BOARD_DATE)
    VALUES(BOARD_SEQ.NEXTVAL, '사임당', '글 제목3', '글 내용3', SYSDATE);




SELECT * FROM BOARD;



















