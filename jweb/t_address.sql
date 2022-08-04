CREATE TABLE t_address(
        num             NUMBER(4),
        username     VARCHAR2(20),
        tel                VARCHAR2(20) NOT NULL,
        email            VARCHAR2(30) NOT NULL,
        gender          VARCHAR2(6),
        joinDate        DATE DEFAULT SYSDATE,
        PRIMARY KEY(num)
);

-- 일련번호(시퀀스) 생성

CREATE SEQUENCE ab_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;

INSERT INTO t_address
VALUES (ab_seq.nextval , '신원희', '010-1234-5678', 'test@test.com', '남', SYSDATE);

SELECT * FROM t_address ORDER BY num;

UPDATE t_address SET username = '홍길동', tel = '010-1234-5678', email = 'gildong2@daum.com',
            gender = '남' WHERE num = 3;

COMMIT;