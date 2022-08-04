-- account 테이블 생성
CREATE TABLE account (
    ano VARCHAR2 (20) PRIMARY KEY,
    owner VARCHAR2 (20) NOT NULL,
    balance NUMBER
);
-- 삭제된 account 테이블 생성
CREATE TABLE deletedaccount (
    ano VARCHAR2 (20) PRIMARY KEY,
    owner VARCHAR2 (20) NOT NULL,
    balance NUMBER
);

INSERT INTO account VALUES ('111-222-3333',  '신원희', 1000000000);

COMMIT;

SELECT * FROM account;
SELECT * FROM deletedaccount;