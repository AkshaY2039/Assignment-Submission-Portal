
--
-- TABLE: Department
-- 
--  

CREATE TABLE Department (
  Department varchar(30) NOT NULL ,
  Head_Of_Department char(9) NOT NULL 
);

-- 
ALTER TABLE Department ADD CONSTRAINT Department_Primary_Key PRIMARY KEY (Department);

CREATE INDEX Teacher_Teacher_ID_index  ON Department(Teacher_ID);

-- 
ALTER TABLE Department ADD CONSTRAINT Head_Of_Department_FK FOREIGN KEY (Head_Of_Department) REFERENCES Teacher(Teacher_ID) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- CHECK Constraints are not supported in Mysql (as of version 5.x)
-- But it'll parse the statements without error 
