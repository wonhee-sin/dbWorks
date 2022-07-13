--person 테이블 생성

CREATE TABLE  person(
    userid VARCHAR2 (10) PRIMARY KEY,
    userpw VARCHAR2(10) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    age NUMBER(3)
  
);

--자료 삽입
INSERT INTO person VALUES ('cloud', 'cloud123', '구름', 123);

SELECT * FROM person;

COMMIT;

ALTER USER system ACCOUNT UNLOCK;