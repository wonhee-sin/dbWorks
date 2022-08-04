-- 동등조인
-- 양쪽 테이블에서 조인 조건이 일치하는 행만 가져오는 조인으로 기본키와 외래키의 관계를
--이용하여 조인하기도 하고 키가 아더라도 다양한 조건으로 저인할 수 있다.

-- 고객과 고객의 주문에 관한 데이터를 모두 검색하시오

SELECT * FROM customer, orders WHERE customer.cusid = orders.cusid;

--고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.

SELECT customer.name, orders.saleprice FROM customer, orders WHERE customer.cusid = orders.cusid;

SELECT * FROM customer, orders WHERE customer.cusid = orders.cusid AND customer.name = '류현진';

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오

SELECT customer.name, SUM(saleprice) FROM customer, orders
WHERE customer.cusid = orders.cusid
GROUP BY customer.name
ORDER BY customer.name;

--고객의 이름과 주문한 도서의 이름을 검색하시오

SELECT customer.name, book.bookname FROM customer, orders, book
WHERE customer.cusid = orders.cusid AND book.bookid = orders.bookid;

-- 가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름을 검색하시오

SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE customer.cusid = orders.cusid
    AND book.bookid = orders.bookid
    AND book.price = 12000;
    
-- 외부 조인
--양쪽 테이블에서 데이터 앖이 일치하지 않는 경우에도 모든 데이터를 연결하기

--도서를 구매하지 않은 고객을 포함하여
--고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오
SELECT customer.name, orders.saleprice
FROM customer LEFT OUTER JOIN orders ON customer.cusid = orders.cusid;
