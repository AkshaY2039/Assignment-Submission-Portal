
--
-- TABLE: Submissions
-- 
--  

CREATE TABLE Submissions (
  Student_ID char(9) NOT NULL ,
  Assignment_ID char(10) NOT NULL ,
  DateTime_of_Submission datetime NOT NULL 
);

-- 
ALTER TABLE Submissions ADD CONSTRAINT Submission_Primary_Key PRIMARY KEY (Student_ID,Assignment_ID);

CREATE INDEX Student_Student_ID_index  ON Submissions(Student_ID);

CREATE INDEX Assignment_Assignment_ID_index  ON Submissions(Assignment_ID);

-- 
ALTER TABLE Submissions ADD CONSTRAINT Student_to_submit_FK FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- 
ALTER TABLE Submissions ADD CONSTRAINT Assignment_for_submission_FK FOREIGN KEY (Assignment_ID) REFERENCES Assignment(Assignment_ID) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- CHECK Constraints are not supported in Mysql (as of version 5.x)
-- But it'll parse the statements without error 
