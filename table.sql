-- ���̺� ����� 

CREATE TABLE ex1(
    colum1  CHAR(10),       --���� ����
    colum2  VARCHAR2(10),   --���� ����
    colum3  NUMBER
)

-- ������ �Է�

INSERT INTO ex1 (colum1, colum2, colum3) VALUES ('abc', 'abc', 10);
INSERT INTO ex1 (colum1, colum2) VALUES ('�츮', '�츮');

COMMIT;

-- ������ �˻�

SELECT * FROM ex1;

--Ư�� Į��(��) �˻�

SELECT colum1, colum2 FROM ex1;

-- CHAR�� VARCHAR2�� ũ���
-- Į���� ��Ī ����� ��� : Į���� As ����

SELECT colum1, LENGTH(colum1) AS len1,
       colum2, LENGTH(colum2) AS len2
       FROM ex1;
       
       
