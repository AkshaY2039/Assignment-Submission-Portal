
--
-- TABLE: Student_Timeline
-- 
--  

CREATE TABLE Student_Timeline (
  Student_ID char(9) NOT NULL ,
  Assignment_ID char(10) NOT NULL ,
  Submission_Status bool NOT NULL  DEFAULT false,
  Review_Status bool NOT NULL  DEFAULT false
);

-- 
ALTER TABLE Student_Timeline ADD CONSTRAINT Student_Timeline_Primary_Key PRIMARY KEY (Student_ID,Assignment_ID);

CREATE INDEX Student_Student_ID_index  ON Student_Timeline(Student_ID);

CREATE INDEX Assignment_Assignment_ID_index  ON Student_Timeline(Assignment_ID);

-- 
ALTER TABLE Student_Timeline ADD CONSTRAINT Which_Student_FK FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- 
ALTER TABLE Student_Timeline ADD CONSTRAINT What_Assignment_FK FOREIGN KEY (Assignment_ID) REFERENCES Assignment(Assignment_ID) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- CHECK Constraints are not supported in Mysql (as of version 5.x)
-- But it'll parse the statements without error 
