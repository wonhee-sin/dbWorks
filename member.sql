-- ex4 ���̺� ����

CREATE TABLE ex4 (
    userId      VARCHAR2(10)    PRIMARY KEY,
    passwd    VARCHAR2(10)    NOT NULL
);

ALTER TABLE ex4 RENAME COLUMN password TO passwd;

ALTER TABLE ex4 RENAME TO member;

--������ Į�� �߰�
ALTER TABLE member ADD regDate DATE;

-- �޿� Į�� �߰�
ALTER TABLE member ADD salary NUMBER;

-- �Ի��� Į�� �߰�
ALTER TABLE member ADD hireDate VARCHAR2(10);

-- �Ի��� Į�� ����
ALTER TABLE member MODIFY hireDate VARCHAR2(40);

--�Ի��� �߰�(������ ����)
UPDATE member SET hireDate = '2022/10/22' WHERE userId = 'smile2022';


--������ ����
INSERT INTO member (userId, passwd) VALUES ('sky2022', 'abcd123');
INSERT INTO member (userId, passwd) VALUES ('sky2022', 'abcd123');
INSERT INTO member (userId, passwd, regDate, salary) 
VALUES ('smile2022', 'abcd123', SYSDATE, 3000000);

-- ������ ���� UPDATE ���̺�� SET Į���� = �� WHERE ����;
UPDATE member SET salary = 4500000 WHERE userId = 'smile2022';
UPDATE member SET salary = 1000000 WHERE userId = 'river2022';

--userId�� sky2022�� ����ϰ� �޿� ������ �����ϱ�
UPDATE member SET salary = 3000000, regDate = SYSDATE WHERE userId = 'sky2022';

--������ ����(��ü ������ ����)
DELETE FROM member;
-- ������ 1�� ����
DELETE FROM member WHERE userId ='river2022';

--���̺� ����
CREATE TABLE member2 AS SELECT * FROM member;

-- ���̺� ����
DROP TABLE member2;

COMMIT;
ROLLBACK;

--������ ��ȸ
SELECT * FROM member;
SELECT * FROM member2;


--������ ��ȸ (����) DESC -��������
SELECT * FROM member ORDER BY salary DESC;

--Ư�� ������ ��ȸ(SELECT Į���� FROM ���̺�� WHERE ����;
SELECT regDate FROM member WHERE userId = 'river2022';

--���̺��� ����
DESC member;