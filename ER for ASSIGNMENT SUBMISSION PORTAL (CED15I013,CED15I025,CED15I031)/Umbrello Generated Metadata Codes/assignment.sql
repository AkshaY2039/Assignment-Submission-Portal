
--
-- TABLE: Assignment
-- 
--  

CREATE TABLE Assignment (
  Assignment_ID char(10) NOT NULL ,
  Assignment_Name varchar(30) NOT NULL ,
  Teacher_ID char(9) NOT NULL ,
  Batch char(7) NOT NULL ,
  Credits_Alloted integer NOT NULL ,
  Creation_DateTime datetime NOT NULL ,
  Deadline_DateTime datetime DEFAULT NULL,
  Course_ID char(7) NOT NULL 
);

-- 
ALTER TABLE Assignment ADD CONSTRAINT Assignment_Primary_Key PRIMARY KEY (Assignment_ID);

CREATE INDEX Teacher_Teacher_ID_index  ON Assignment(Teacher_ID);

CREATE INDEX Course_Course_ID_index  ON Assignment(Course_ID);

CREATE INDEX Batch_Batch_index  ON Assignment(Batch);

-- 
ALTER TABLE Assignment ADD CONSTRAINT Assigned_By_FK FOREIGN KEY (Teacher_ID) REFERENCES Teacher(Teacher_ID) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- 
ALTER TABLE Assignment ADD CONSTRAINT Assigned_For_FK FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- 
ALTER TABLE Assignment ADD CONSTRAINT Assigned_To FOREIGN KEY (Batch) REFERENCES Batch(Batch) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- CHECK Constraints are not supported in Mysql (as of version 5.x)
-- But it'll parse the statements without error 
