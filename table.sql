-- 테이블 만들기 

CREATE TABLE ex1(
    colum1  CHAR(10),       --고정 길이
    colum2  VARCHAR2(10),   --가변 길이
    colum3  NUMBER
)

-- 데이터 입력

INSERT INTO ex1 (colum1, colum2, colum3) VALUES ('abc', 'abc', 10);
INSERT INTO ex1 (colum1, colum2) VALUES ('우리', '우리');

COMMIT;

-- 데이터 검색

SELECT * FROM ex1;

--특정 칼럼(열) 검색

SELECT colum1, colum2 FROM ex1;

-- CHAR와 VARCHAR2의 크기비교
-- 칼럼에 별칭 만드는 방법 : 칼럼명 As 별명

SELECT colum1, LENGTH(colum1) AS len1,
       colum2, LENGTH(colum2) AS len2
       FROM ex1;
       
       
