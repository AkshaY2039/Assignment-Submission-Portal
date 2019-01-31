
--
-- TABLE: Course
-- 
--  

CREATE TABLE Course (
  Course_ID char(7) NOT NULL ,
  Course_Name varchar(30) NOT NULL ,
  Department varchar(30) NOT NULL ,
  Total_Credits integer NOT NULL  DEFAULT 0
);

-- 
ALTER TABLE Course ADD CONSTRAINT Course_Primary_Key PRIMARY KEY (Course_ID);

CREATE INDEX Department_Department_index  ON Course(Department);

-- 
ALTER TABLE Course ADD CONSTRAINT Course_under_Department_FK FOREIGN KEY (Department) REFERENCES Department(Department) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- CHECK Constraints are not supported in Mysql (as of version 5.x)
-- But it'll parse the statements without error 
