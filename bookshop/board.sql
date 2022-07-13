-- 시퀀스 생성
CREATE SEQUENCE mySeq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;

-- 이 시퀀스는 1부터 시작해 1씩 증가하며 최소값 1부터 최댓값 1000까지
-- 순번을 자동 생성한다.
-- 이 시퀀스로 board 테이블에 사용

-- board 테이블 생성

CREATE TABLE board (
    bno NUMBER(4) PRIMARY KEY,
    title VARCHAR2 (50) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    regDate DATE DEFAULT SYSDATE
)


--게시물 추가

INSERT INTO board (bno, title, content, regDate)
VALUES (mySeq.NEXTVAL, '제목1', '제목1 내용입니다.', SYSDATE);

INSERT INTO board (bno, title, content, regDate)
VALUES (mySeq.NEXTVAL, '제목2', '제목2 내용입니다.', SYSDATE);

INSERT INTO board (bno, title, content, regDate)
VALUES (mySeq.NEXTVAL, '제목3', '제목3 내용입니다.', SYSDATE);

SELECT * FROM board;

-- 제목 2를 검색하시오

SELECT * FROM board WHERE title = '제목2';

--게시글 3번의 글내용물 '감사합니다'를 수정하시오.

UPDATE board SET content = '감사합니다' WHERE bno = 4;

--게시글 2번 삭제

DELETE FROM board WHERE bno = 2;

COMMIT;