CREATE TABLE department (
    depid           NUMBER,
    depname          VARCHAR2(20) NOT NULL,
    location            VARCHAR2(20) NOT NULL,
    PRIMARY KEY (depid)
);

CREATE TABLE employee (
    empid NUMBER(3) PRIMARY KEY,
    empname VARCHAR2(20) NOT NULL,
    age NUMBER(3),
    salary NUMBER,
    depid NUMBER,
    CONSTRAINT EMP_FK FOREIGN KEY (depid) REFERENCES department(depid)
    );
    
    --부서 자료 추가
    
    INSERT INTO department VALUES (10, '전산팀', '서울');
    INSERT INTO department VALUES (20, '총무팀', '인천');
    INSERT INTO department VALUES (30, '기획조정실', '세종');
    INSERT INTO department VALUES (40, '영업', '광주');
    
    
    --사원 자료 추가
    
    INSERT INTO employee VALUES (101, '이강', 27, 2500000, 10);
    INSERT INTO employee VALUES (102, '김산', 28, 2900000, 20);
    INSERT INTO employee VALUES (103, '정들', 35, 1700000, 40);
    INSERT INTO employee VALUES (104, '정들', 35, 3000000, 50);
    
    
    --
    SELECT * FROM department;
    SELECT * FROM employee;
    
    COMMIT;
    ROLLBACK;
    
    ALTER TABLE employee DROP CONSTRAINT EMP_FK;
    DROP TABLE department CASCADE CONSTRAINTS ;
    
    -- 제약조건
    
    ALTER TABLE employee ADD CONSTRAINT EMP_fk
    FOREIGN KEY(depid) REFERENCES department(depid);
    
    DROP TABLE employee;
    
    COMMIT;