desc member;
select * from member;

CREATE TABLE EMPLOYEE(
    name VARCHAR2(10),
    address VARCHAR2(10),
    ssn VARCHAR2(15)
);

INSERT INTO EMPLOYEE VALUES('duke','seoul','970224-10392434');
INSERT INTO EMPLOYEE VALUES('pororo','pusan','001222-1038782');
INSERT INTO EMPLOYEE VALUES('candy','daegu','981221-1829192');

desc member;

update employee set ssn='970224-1039234' where name='duke';
select * from employee;
desc employee;
commit;

CREATE TABLE item(
    name VARCHAR2(20),
    price NUMBER(8),
    description VARCHAR2(100)
);

delete from item;
select * from item;
INSERT INTO item VALUES('상품',282,'테스트');
COMMIT;