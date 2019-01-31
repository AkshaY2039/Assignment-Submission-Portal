
--
-- TABLE: Teacher
-- 
--  

CREATE TABLE Teacher (
  Teacher_ID char(9) NOT NULL ,
  Name varchar(30) NOT NULL ,
  Department varchar(30) NOT NULL ,
  Email varchar(50) NOT NULL ,
  Date_of_Joining date NOT NULL ,
  Date_of_Transfer date DEFAULT NULL
);

-- 
ALTER TABLE Teacher ADD CONSTRAINT Teacher_Primary_Key PRIMARY KEY (Teacher_ID);

CREATE INDEX Department_Department_index  ON Teacher(Department);

-- 
ALTER TABLE Teacher ADD CONSTRAINT Department_for_Teacher_FK FOREIGN KEY (Department) REFERENCES Department(Department) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- CHECK Constraints are not supported in Mysql (as of version 5.x)
-- But it'll parse the statements without error 
