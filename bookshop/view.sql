--뷰
--하나 이상의 테이블을 합하여 만든 가상의 테이블로서 실제 테이블처럼 사용할수 있도록 만든 데이터베이스 개체
--뷰를 사용하는 이유는원본 테이블의 데이터를 안전하게 유지하면서 필요한 사용자에게
--적절한 데이터를 제공(보고서 형태)할 수 있다.

CREATE VIEW vw_Customer AS SELECT * FROM customer WHERE adress LIKE '%대한민국%';

--뷰 이름으로 검색
SELECT * FROM vw_customer;

--뷰 삭제
DROP VIEW vw_customer;

--고객의 이름과 주문 도서의 이름과 가격을 검색하시오

CREATE VIEW vw_customer AS SELECT customer.name, book.bookname, book.price
FROM customer, orders, book
WHERE customer.cusid = orders.cusid
AND book.bookid = orders.bookid;

SELECT * FROM vw_customer;

COMMIT;