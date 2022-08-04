-- 서브쿼리란
--부속 질의는 하나의 SQL문안에 다른 SQL문이 중첩된 질의를 말한다.
--다른 테이블에서 가져온 데이터로 현재 테이블에 있는 정보를 찾거나 가공할 때 사용한다.
--최종 결과를 출력하는 쿼리를 메인 쿼리라고 한다면, 이를 위한 중간단계 혹은 보조역할을
--하는 SELECT문을 서브 쿼리라 한다.

--가장 비싼 도서의 이름을 검색하시오
SELECT bookname, price FROM book WHERE price = (SELECT MAX(price) FROM book);

--도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT name FROM customer WHERE cusid IN(SELECT cusid FROM orders);

-- '박지성' 고객의 주문 내역을 검색하시오
SELECT * FROM orders WHERE cusid = (SELECT cusid FROM customer WHERE name = '박지성');

--이상 미디어에서 출판한 도서를 구매한 고객의 이름을 검색하시오
SELECT name FROM customer WHERE cusid IN (SELECT cusid FROM orders WHERE bookid IN
(SELECT bookid FROM book WHERE publisher = '이상미디어'));

--출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 검색하시오
--튜플 변수 : 테이블 이름의 별칭

SELECT b1.bookname FROM book b1
WHERE b1.price > (SELECT AVG(b2.price) FROM book b2 WHERE b2.publisher = b1.publisher);

-- 고객 번호가 2 이하인 고객의 판매액을 검색하시오 (고객이름과 고객별 판매액 출력)
SELECT cs.name, SUM(od.saleprice) AS total
FROM (SELECT cusid, name FROM customer WHERE cusid <= 2) cs, orders od
WHERE cs.cusid = od.cusid
GROUP BY cs.name;