SET SERVEROUTPUT ON;
-- 18-1 SELECT INTO
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO=40;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;
/

-- 18-2 단일행 커서 CURSOR, OPEN FEETCH CLOSE
DECLARE
    --커서 데이터 변수 선언
    V_DEPT_ROW DEPT%ROWTYPE;
    
    -- 명시적 커서 선언(Declaration)
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO=40;

BEGIN
    OPEN C1;
        FETCH C1 INTO V_DEPT_ROW;
        
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
            
    CLOSE C1;
END;
/

-- 18-3 여러행 커서
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    
    CURSOR C1 IS
    SELECT DEPTNO, DNAME, LOC
    FROM DEPT;

BEGIN
    OPEN C1;
        LOOP
            FETCH C1 INTO V_DEPT_ROW;
            EXIT WHEN C1%NOTFOUND;
    
            DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO || ', DNAME : ' || V_DEPT_ROW.DNAME || ', LOC : ' || V_DEPT_ROW.LOC);            
        END LOOP;
    CLOSE C1;
END;
/

-- 18-4 FOR LOOP -> OPEN, FETCH, CLOSE 사용X
DECLARE
    CURSOR C1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT;

BEGIN
    
    FOR C1_REC IN C1 LOOP
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_REC.DEPTNO
                                                    || ', DNAME : ' || C1_REC.DNAME
                                                    || ', LOC : ' || C1_REC.LOC);
    END LOOP;
    
END;
/

-- 18-5 커서에 파라미터 사용
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    
    CURSOR C1(P_DEPTNO DEPT.DEPTNO%TYPE) IS -- ( ) 안에 파라미터 선언
        SELECT DEPTNO, dname, loc
        FROM DEPT
        WHERE DEPTNO=P_DEPTNO;
        
BEGIN
    OPEN C1(10);
        LOOP
            FETCH C1 INTO V_DEPT_ROW;
            EXIT WHEN C1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('10번 부서-DEPNO : ' || V_DEPT_ROW.DEPTNO 
                                                                    || ', DNAME : ' || V_DEPT_ROW.DNAME
                                                                    || ', LOC : ' || V_DEPT_ROW.LOC);
        END LOOP;
    CLOSE C1;
    
    OPEN C1(20);
            LOOP
            FETCH C1 INTO V_DEPT_ROW;
            EXIT WHEN C1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('20번 부서-DEPNO : ' || V_DEPT_ROW.DEPTNO 
                                                                    || ', DNAME : ' || V_DEPT_ROW.DNAME
                                                                    || ', LOC : ' || V_DEPT_ROW.LOC);
        END LOOP;
    CLOSE C1;
END;
/

-- 18-6 커서에 사용할 파라미터 입력받기
DECLARE
    -- 파라미터를 저장할 변수선언
    V_DEPTNO DEPT.DEPTNO%TYPE;
    -- 명시적 커서 선언
    CURSOR C1 (P_DEPTNO DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = P_DEPTNO;
        
BEGIN
    -- 부서 입력받고 저장
    V_DEPTNO := &INPUT_DEPTNO;
    -- 커서 LOOP FOR
    FOR C1_REC IN C1(V_DEPTNO) LOOP
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || C1_REC.DEPTNO
                                                    || ', DNAME : ' || C1_REC.DNAME
                                                    || ', LOC : ' || C1_REC.LOC);
    END LOOP;
END;
/

-- 18-7 묵시적 커서의 속성 사용하기
BEGIN
    UPDATE DEPT SET DNAME='DATABASE'
    WHERE DEPTNO=50;
    
    DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 : ' || SQL%ROWCOUNT);
    
    IF(SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : FALSE');
    END IF;
    
    IF(SQL%ISOPEN) THEN
        DBMS_OUTPUT.PUT_LINE('커서의 오픈 여부 : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('커서의 오픈 여부 : FALSE');
    END IF;
END;
/

-- 18-8 예외가 발생하는 PL/SQL
DECLARE
    V_WRONG NUMBER;
BEGIN 
    SELECT DNAME INTO V_WRONG
    FROM DEPT
    WHERE DEPTNO=10;
END;
/
--DNAME 은 VARCHAR2 데이터 이므로 예외 발생, 비정상 종료

-- 18-9 예외 처리 PL/SQL
DECLARE
    V_WRONG NUMBER;
BEGIN 
    SELECT DNAME INTO V_WRONG
    FROM DEPT
    WHERE DEPTNO=10;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
END;
/

-- 18-10 예외 발생 후 코드 실행 여부
DECLARE
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG
    FROM DEPT
    WHERE DEPTNO=10;
    
    DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.');

EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
END;
/

-- 18-11 사전 정의된 예외
DECLARE
    V_WRONG NUMBER;

BEGIN
    SELECT DNAME INTO V_WRONG
    FROM DEPT
    WHERE DEPTNO=10;
    
    DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.');

EXCEPTION 
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 요구보다 많은 행 추출 오류 발생');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류 발생');

END;
/

-- 18-12 오류코드와 메시지  사용 SQLCODE, SQLERRM
DECLARE
    V_WRONG NUMBER;

BEGIN
    SELECT DNAME INTO V_WRONG
    FROM DEPT
    WHERE DEPTNO =10;
    
    DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류 발생');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
        DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE('SQLERRM: ' || SQLERRM);
END;
/