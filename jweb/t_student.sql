--학생 테이블 생성

CREATE TABLE t_student (
    stdid NUMBER(3) PRIMARY KEY,
    name VARCHAR2(20) NOT NULL
);

DESCRIBE t_student;

INSERT INTO t_student VALUES (101, '이강');

SELECT * FROM t_student;