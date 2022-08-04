use jspdb;

select * from user;
select * from user where name='김구름';

-- 김구름을 김배구로 변경
update user set name='김배구' where uid=129;

desc user;

-- 필드 추가

alter table user add phone varchar(20);

-- 남한강의 전화번호 입력

update user set phone='010-1234-5678' where uid=158;