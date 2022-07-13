CREATE TABLE book (
    bookId      NUMBER PRIMARY KEY,
    bookName    VARCHAR2(40),
    publisher   VARCHAR2(40),
    price       NUMBER
);

-- customer 테이블 생성

CREATE TABLE customer(
    cusid               NUMBER PRIMARY KEY,
    name               VARCHAR2(40),
    adress             VARCHAR2(50),
    phone              VARCHAR2(20)
);

--order 테이블 생성
CREATE TABLE orders(
orderid     NUMBER PRIMARY KEY,
cusid          NUMBER,
bookid          NUMBER,
saleprice         NUMBER,
orderdate          DATE,
FOREIGN KEY(cusid) REFERENCES customer (cusid),
FOREIGN KEY(bookid) REFERENCES book (bookid)
);

--book 자료 삽입
INSERT INTO book VALUES ( 1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO book VALUES ( 2, '축구아는 여자', '나우수', 12000);
INSERT INTO book VALUES ( 3, '축구의 이해', '대한미디어', 22000);
INSERT INTO book VALUES ( 4, '골프 바이블', '대한미디어', 35000);
INSERT INTO book VALUES ( 5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO book VALUES ( 6, '축구의 실제', '굿스포츠', 22000);
INSERT INTO book VALUES ( 7, '야구의 추억', '이상미디어', 12000);
INSERT INTO book VALUES ( 8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO book VALUES ( 9, '올림픽 이야기', '삼성당', 7000);
INSERT INTO book VALUES ( 10, 'Olympic Champion', 'Person', 7000);

--customer 자료 삽입

INSERT INTO customer VALUES (1, '박지성', '영국 맨체스터', '010-0000-0000');
INSERT INTO customer VALUES (2, '김연아', '대한민국 서울', '010-1000-0000');
INSERT INTO customer VALUES (3, '안산', '대한민국 광주광역시', '010-2000-0000');
INSERT INTO customer VALUES (4, '류현진', '미국 토론토', NULL);
INSERT INTO customer VALUES (5, '손흥민', '영국 토트넘', '010-3000-0000');

--order 자료 삽입

INSERT INTO orders VALUES (1, 1, 1, 7000, TO_DATE('2018-07-01', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (2, 1, 3, 21000, TO_DATE('2018-07-03', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (3, 2, 5, 8000, TO_DATE('2018-07-01', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (4, 3, 6, 6000, TO_DATE('2018-07-04', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (5, 4, 7, 20000, TO_DATE('2018-07-05', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (6, 1, 2, 12000, TO_DATE('2018-07-07', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (7, 4, 8, 13000, TO_DATE('2018-07-07', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (8, 3, 10, 12000, TO_DATE('2018-07-08', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (9, 2, 10, 6000, TO_DATE('2018-07-09', 'YYYY-MM-DD'));
INSERT INTO orders VALUES (10, 3, 8, 13000, TO_DATE('2018-07-10', 'YYYY-MM-DD'));

--주문 테이블(주문번호1번의)책 가격 7000원으로 변경하기
UPDATE orders SET saleprice = 7000 WHERE orderid = 1;


--book 자료검색
SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

SELECT DISTINCT publisher FROM book;

SELECT * FROM book WHERE price < 20000;
SELECT * FROM book WHERE price BETWEEN 10000 AND 20000;
SELECT * FROM book WHERE price >= 10000 AND price <= 20000;

-- IN();
--출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색
SELECT * FROM book WHERE publisher IN('굿스포츠', '대한미디어');
SELECT * FROM book WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

--LIKE 연산자
--'축구의 역사'를 출간한 출판사 검색

SELECT * FROM book WHERE bookName LIKE '축구의 역사';

-- 도서 이름에 '축구' 포함된 출판사 검색
--시작하는 문장 : %단어, 끝나는 문장 : 단어%

SELECT publisher, bookName FROM book WHERE bookName LIKE '%축구%';

--축구에 관한 도서중 가격이 20000원 이상인 도서

SELECT * FROM book WHERE bookName LIKE '%축구%'  AND price > 20000;

--집계 함수와 GROUP BY
--고객이 주문한 도서의 총 판매액을 구하시오


