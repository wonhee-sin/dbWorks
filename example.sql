-- 테이블 ex2 생성

CREATE TABLE ex2 (
    col_date    DATE,           -- 년 원 일
    col_timestamp TIMESTAMP     --년 원 일 시 분 초
);

-- 테이블 ex3 생성
CREATE TABLE ex3 (
    col_null        VARCHAR2(10),
    col_not_null    VARCHAR2(10)    NOT NULL
);

-- ex3에 데이터 입력

INSERT INTO ex3 VALUES ('Hello', '');   --NOT NULL 제약조건 위배
INSERT INTO ex3 VALUES ('', 'Hello');

-- 데이터 입력
INSERT INTO ex2 VALUES (SYSDATE, SYSTIMESTAMP);

-- 자료의 삽입, 수정, 삭제 등의 병경이 있을 때 필수 실행
COMMIT;

-- 데이터 조회
SELECT * FROM ex3;

