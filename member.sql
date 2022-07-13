-- ex4 테이블 생성

CREATE TABLE ex4 (
    userId      VARCHAR2(10)    PRIMARY KEY,
    passwd    VARCHAR2(10)    NOT NULL
);

ALTER TABLE ex4 RENAME COLUMN password TO passwd;

ALTER TABLE ex4 RENAME TO member;

--가입일 칼럼 추가
ALTER TABLE member ADD regDate DATE;

-- 급여 칼럼 추가
ALTER TABLE member ADD salary NUMBER;

-- 입사일 칼럼 추가
ALTER TABLE member ADD hireDate VARCHAR2(10);

-- 입사일 칼럼 수정
ALTER TABLE member MODIFY hireDate VARCHAR2(40);

--입사일 추가(데이터 수정)
UPDATE member SET hireDate = '2022/10/22' WHERE userId = 'smile2022';


--데이터 삽입
INSERT INTO member (userId, passwd) VALUES ('sky2022', 'abcd123');
INSERT INTO member (userId, passwd) VALUES ('sky2022', 'abcd123');
INSERT INTO member (userId, passwd, regDate, salary) 
VALUES ('smile2022', 'abcd123', SYSDATE, 3000000);

-- 데이터 수정 UPDATE 테이블명 SET 칼럼명 = 값 WHERE 조건;
UPDATE member SET salary = 4500000 WHERE userId = 'smile2022';
UPDATE member SET salary = 1000000 WHERE userId = 'river2022';

--userId가 sky2022에 등록일과 급여 데이터 수정하기
UPDATE member SET salary = 3000000, regDate = SYSDATE WHERE userId = 'sky2022';

--데이터 삭제(전체 데이터 삭제)
DELETE FROM member;
-- 데이터 1개 삭제
DELETE FROM member WHERE userId ='river2022';

--테이블 복사
CREATE TABLE member2 AS SELECT * FROM member;

-- 테이블 삭제
DROP TABLE member2;

COMMIT;
ROLLBACK;

--데이터 조회
SELECT * FROM member;
SELECT * FROM member2;


--데이터 조회 (정렬) DESC -내림차순
SELECT * FROM member ORDER BY salary DESC;

--특정 조건을 조회(SELECT 칼럼명 FROM 테이블명 WHERE 조건;
SELECT regDate FROM member WHERE userId = 'river2022';

--테이블의 구조
DESC member;