-- 내장 함수
-- 함수이름(매개변수)
-- 숫자관련 함수
--FROM 절이 없는 SELECT문 : 오라클은 가상 테이블인 dual을 사용함

--절대값 구하기
SELECT ABS(-10) FROM dual;

--3.875를 소수 첫째자리까지 반올림한 값을 구하시오
SELECT ROUND(3.875, 1) 결과1,
             ROUND(3.875, 2) 결과2,
             ROUND(13.875, -1) 결과3,
             ROUND(573.875, -2) 결과4
             FROM dual;
             
-- salary를 30일로 나눈 후 소수 자리수에 따라 절삭한 값 출력
SELECT salary,
             salary / 30 일급,
             TRUNC(salary / 30, 1) 결과1,
             TRUNC(salary / 30, 0) 결과2,
             TRUNC(salary / 30, -1) 결과3,
             TRUNC(salary / 30, -2) 결과4
FROM employee;
             
-- 고객평균 주문 금액을 백원 단위로 반올림한 값을 구하시오.
SELECT cusid, 
ROUND(AVG(saleprice),-2) 평균금액 
FROM orders 
GROUP BY cusid;

--문자 관련 함수

SELECT LPAD('cloud', 10, '*') FROM dual;
SELECT RPAD('cloud', 10, '*') FROM dual;

--부서 이름에서 처음부터 시작해서 두개의 문자 출력
SELECT SUBSTR(depname, 1, 2) 팀명
FROM department;

-- 도서 제목에 야구가 포함된 도서를 농구로 변경하여 검색하시오
SELECT bookid,
            REPLACE(bookname, '야구', '농구') AS bookname, publisher
FROM book;

-- 굿스포츠에서 출판한 도서의 제목과 글자 수를 검색하시오
SELECT bookname 제목,
        LENGTH(bookname) 문자수
FROM book
WHERE publisher = '굿스포츠';

--고객 이름에서 같은 성을 가진 사람의 인원수를 구하시오
--GROUP BY절에는 함수도 포함할 수 있음
SELECT SUBSTR(name, 1, 1) 성,
    COUNT(*) 인원
FROM customer
GROUP BY SUBSTR(name, 1, 1);

COMMIT;

--날짜, 시간함수
--서점은 주문일로부터 10일후 매출을 확정한다. 각 주문의 확정일자를 구하시오.

SELECT orderid 주문번호,
             orderdate 주문일,
             orderdate + 10 확정
FROM orders
WHERE orderid <= 5;

--주문번호가 6에서 10사이인 도서의 주문일에 3개월을 더한 값을 구하시오
--개월 더하기 : ADD_MONTHS()
SELECT orderid 주문번호, orderdate 주문일,
             ADD_MONTHS(orderdate, 3) 더하기_결과,
             ADD_MONTHS(orderdate,-3) 빼기_결과
FROM orders
WHERE orderid BETWEEN 6 AND 10;

-- 주문번호가 10인 도서의 주문일로부터 오늘까지의 총 개월수를 구하시오
-- 총 개월수 MONTHS_BETWEEN(시작일, 종료일)

SELECT orderid 주문번호, orderdate 주문일, SYSDATE 오늘,
             TRUNC(MONTHS_BETWEEN(SYSDATE, orderdate),0) 총개월수
FROM orders WHERE orderid = 10;

--자동 타입 변환
SELECT 1 + '2'
FROM dual;

--숫자 형식 변환
SELECT TO_NUMBER('123')
FROM dual;

--날짜 형식 : 날짜 문자열을 지정 형식 날짜 타입으로 변환
SELECT TO_DATE(20220603,'YYYYMMDD')
FROM dual;

--날짜 형식 변환
SELECT TO_CHAR (SYSDATE, 'YY') 년도,
             TO_CHAR (SYSDATE, 'YYYY') 년도_4,
             TO_CHAR (SYSDATE, 'MM') 월,
             TO_CHAR (SYSDATE, 'DD') 일,
             TO_CHAR (SYSDATE, 'YY/MM/DD') 날짜
FROM dual;

--시간 형식 변환
SELECT TO_CHAR (SYSDATE, 'HH24:MI:SS') 시간형식,
             TO_CHAR (SYSDATE, 'YYYY/MM/DD HH:MI:SS PM') 날짜와시간
FROM  dual;

-- NVL
SELECT cusid, name, adress, NVL(phone, '010-9000-1111') phone
FROM customer
WHERE phone IS NULL;

