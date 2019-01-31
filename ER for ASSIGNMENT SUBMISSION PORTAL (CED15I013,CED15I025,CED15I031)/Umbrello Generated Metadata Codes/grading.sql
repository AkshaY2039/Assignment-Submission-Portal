
--
-- TABLE: Grading
-- 
--  

CREATE TABLE Grading (
  Student_ID char(9) NOT NULL ,
  Assignment_ID char(10) NOT NULL ,
  Credits_Obtained integer NOT NULL ,
  Plagiarism_Measure numeric(5,2) DEFAULT NULL
);

-- 
ALTER TABLE Grading ADD CONSTRAINT Grading_Primary_Key PRIMARY KEY (Student_ID,Assignment_ID);

CREATE INDEX Student_Student_ID_index  ON Grading(Student_ID);

CREATE INDEX Assignment_Assignment_ID_index  ON Grading(Assignment_ID);

-- 
ALTER TABLE Grading ADD CONSTRAINT Grade_to_FK FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- 
ALTER TABLE Grading ADD CONSTRAINT Graded_on_FK FOREIGN KEY (Assignment_ID) REFERENCES Assignment(Assignment_ID) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- CHECK Constraints are not supported in Mysql (as of version 5.x)
-- But it'll parse the statements without error 
