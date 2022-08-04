-- 회원 테이블

CREATE TABLE t_member(
    memberid VARCHAR2(20) PRIMARY KEY,
    passwd    VARCHAR2(20) NOT NULL,
    name       VARCHAR2(30) NOT NULL,
    gender     VARCHAR2(10) NOT NULL,
    joindate   DATE DEFAULT SYSDATE
);

INSERT INTO t_member VALUES ('cloud', 'c12345', '김구름', '남', SYSDATE);

CREATE TABLE t_board(
    bnum        NUMBER(4) PRIMARY KEY,
    title            VARCHAR2(100) NOT NULL,
    content     VARCHAR2(2000) NOT NULL,
    regdate     DATE DEFAULT SYSDATE,
    memberid VARCHAR2(20),
    CONSTRAINT FK_MemberBoard FOREIGN KEY (memberid)
    REFERENCES t_member(memberid)
);

CREATE SEQUENCE b_seq;

COMMIT;