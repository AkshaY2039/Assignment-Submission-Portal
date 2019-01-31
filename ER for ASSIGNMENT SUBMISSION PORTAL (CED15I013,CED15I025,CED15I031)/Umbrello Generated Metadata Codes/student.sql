
--
-- TABLE: Student
-- 
--  

CREATE TABLE Student (
  Student_ID char(9) NOT NULL ,
  Name varchar(30) NOT NULL ,
  Date_of_Birth date NOT NULL ,
  Date_of_Joining date NOT NULL ,
  Date_of_Pass_Out date DEFAULT NULL,
  Email varchar(50) NOT NULL ,
  Batch char(7) NOT NULL 
);

-- 
ALTER TABLE Student ADD CONSTRAINT Student_Primary_Key PRIMARY KEY (Student_ID);

CREATE INDEX Batch_Batch_index  ON Student(Batch);

-- 
ALTER TABLE Student ADD CONSTRAINT Batch_of_Student_FK FOREIGN KEY (Batch) REFERENCES Batch(Batch) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- CHECK Constraints are not supported in Mysql (as of version 5.x)
-- But it'll parse the statements without error 
