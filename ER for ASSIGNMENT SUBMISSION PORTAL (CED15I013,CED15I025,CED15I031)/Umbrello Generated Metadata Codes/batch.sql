
--
-- TABLE: Batch
-- 
--  

CREATE TABLE Batch (
  Batch char(7) NOT NULL ,
  Years integer NOT NULL ,
  Strength integer NOT NULL 
);

-- 
ALTER TABLE Batch ADD CONSTRAINT Batch_Primary_Key PRIMARY KEY (Batch);

-- CHECK Constraints are not supported in Mysql (as of version 5.x)
-- But it'll parse the statements without error 
