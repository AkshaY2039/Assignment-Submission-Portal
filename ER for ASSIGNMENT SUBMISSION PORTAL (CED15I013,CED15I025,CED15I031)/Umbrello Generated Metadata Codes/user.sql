
--
-- TABLE: User
-- 
--  

CREATE TABLE User (
  ID char(9) NOT NULL ,
  Passphrase text NOT NULL ,
  Date_of_Change datetime NOT NULL 
);

-- 
ALTER TABLE User ADD CONSTRAINT User_Primary_Key PRIMARY KEY (ID);

CREATE INDEX Teacher_Teacher_ID_index  ON User(Teacher_ID);

CREATE INDEX Student_Student_ID_index  ON User(Student_ID);

-- 
ALTER TABLE User ADD CONSTRAINT User_is_a_Teacher FOREIGN KEY (ID) REFERENCES Teacher(Teacher_ID) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- 
ALTER TABLE User ADD CONSTRAINT User_is_a_Student FOREIGN KEY (ID) REFERENCES Student(Student_ID) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- CHECK Constraints are not supported in Mysql (as of version 5.x)
-- But it'll parse the statements without error 
