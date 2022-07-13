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
    depid NUMBER,
    CONSTRAINT EMP_FK FOREIGN KEY (depid) REFERENCES department(depid)
    );
    
    --부서 자료 추가
    
    INSERT INTO department VALUES (10, '전산팀', '서울');
    INSERT INTO department VALUES (20, '총무팀', '인천');
    
    --사원 자료 추가
    
    INSERT INTO employee VALUES (101, '이강', 27, 10);
    INSERT INTO employee VALUES (102, '김산', 28, 20);
    INSERT INTO employee VALUES (103, '정들', 35, 20);
    
    
    --
    SELECT * FROM department;
    SELECT * FROM employee;
    
    COMMIT;
    ROLLBACK;
    
    ALTER TABLE employee DROP CONSTRAINT EMP_FK;
    DROP TABLE department CASCADE CONSTRAINTS ;