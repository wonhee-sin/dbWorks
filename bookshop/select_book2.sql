-- 주문 테이블 검색

--집계 함수 : sum, count, avg
--고객이 주문한 도서의 총 판매액을 구하시오
SELECT SUM(saleprice) AS 총매출 FROM orders;

--'김연아' 고객이 주문한 도서의 총 판매액을 구하시오
SELECT SUM(saleprice) AS 총매출 FROM orders WHERE cusid = 2;

--고객이 주만한 도서의 총 판매액, 평균값을 구하시오
SELECT SUM(saleprice) AS total,
                AVG(saleprice) AS average FROM orders;
            
--마당 서점의 도서 판매 건수를 구하시오
SELECT COUNT(*) AS 총판매건수 FROM orders;

--고객별로 주문한 도서의 총 수량과 판매액을 구하시오
SELECT cusid, COUNT(*) 도서수량, SUM(saleprice) 총액 FROM orders GROUP BY cusid;

--고객의 총 인원수를 구하시오

SELECT COUNT(cusid) 총인원수 FROM customer;