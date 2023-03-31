CREATE DATABASE NONPROFIT_ORG
USE NONPROFIT_ORG;

--CREATE VOLUNTEER ENTITY
CREATE TABLE VOLUNTEER(
VOLUNTEER_ID CHAR(6) CONSTRAINT VOLUNTEER_VOLUNTEER_ID_PK PRIMARY KEY ,
VOLUNTEER_FNAME VARCHAR(20),
VOLUNTEER_LNAME VARCHAR(20),
PHONE_NUMBER CHAR(10),
STREET VARCHAR(20),
CITY VARCHAR(20),
COUNTRY CHAR(2),
POSTAL_CODE VARCHAR(6)
);

--CREATE TASK ENTITY
CREATE TABLE TASK(
TASK_NUM CHAR(6) CONSTRAINT TASK_TASK_NUM_PK PRIMARY KEY,
TASK_DESCRIPTION VARCHAR(20) NOT NULL,
TASK_STATUS VARCHAR(15) NOT NULL
);

--CREATE ASSIGNMENT ENTITY
CREATE TABLE ASSIGNMENT(
VOLUNTEER_ID CHAR(6) CONSTRAINT ASSIGNMENT_VOLUNTEER_ID_FK FOREIGN KEY (VOLUNTEER_ID) REFERENCES VOLUNTEER ON DELETE CASCADE,
TASK_NUM CHAR(6) CONSTRAINT ASSIGNMENT_TASK_NUM_FK FOREIGN KEY (TASK_NUM) REFERENCES TASK ON DELETE CASCADE,
TASK_START_TIME DATE,
TASK_END_TIME DATE,
CONSTRAINT ASSIGNMENT_VOLUNTEERID_TASKNUM_PK PRIMARY KEY (VOLUNTEER_ID,TASK_NUM)
);

--CREATE PACKAGE ENTITY
CREATE TABLE PACKAGE(
PACKAGE_NUM CHAR(6) CONSTRAINT PACKAGE_PACKAGE_NUM_PK PRIMARY KEY,
DATE_CREATED DATE NOT NULL,
TOTAL_WEIGHT NUMERIC (6,2) NOT NULL,
TASK_NUM CHAR(6) CONSTRAINT PACKAGE_TASK_NUM_FK FOREIGN KEY (TASK_NUM) REFERENCES TASK ON DELETE SET NULL
);

-- CREATE ITEM ENTITY
CREATE TABLE ITEM(
ITEM_ID CHAR(6) CONSTRAINT ITEM_ITEM_ID_PK PRIMARY KEY,
ITEM_DESCRIPTION VARCHAR(50) NOT NULL,
ITEM_VALUE NUMERIC(5,2) NOT NULL,
ITEM_QUANTITY NUMERIC 
);

--CREATE CONTENTS ENTITY
CREATE TABLE CONTENTS(
PACKAGE_NUM CHAR(6) CONSTRAINT CONTENTS_PACKAGE_NUM_FK FOREIGN KEY (PACKAGE_NUM) REFERENCES PACKAGE ON DELETE CASCADE,
ITEM_ID CHAR(6),
CONSTRAINT CONTENTS_PACKAGENUM_ITEMID_PK PRIMARY KEY (PACKAGE_NUM, ITEM_ID)
);

--INSERT VALUES
INSERT INTO VOLUNTEER VALUES (NEXT VALUE FOR VOLUNTEER_SQ,'Josh','Owen','7053242559','3755 40th Street','Calgary','Canada', 'T2K 0P7');
INSERT INTO VOLUNTEER VALUES (NEXT VALUE FOR VOLUNTEER_SQ,'Tamara','Wallace','2635722221','1342 Rene-Levesques','Montreal','Canada', 'H3B 4W8');
INSERT INTO VOLUNTEER VALUES (NEXT VALUE FOR VOLUNTEER_SQ,'Kye','Shaw','4748981353','4331 Galts Avenue','Alberta','Canada', 'T4N 5Z9');
INSERT INTO VOLUNTEER VALUES (NEXT VALUE FOR VOLUNTEER_SQ,'Alexa','Neal','2269922923','187 rue Garneau','Quebec','Canada', 'G1V 3V5');
INSERT INTO VOLUNTEER VALUES (NEXT VALUE FOR VOLUNTEER_SQ,'Christian','Carrillo','2046964326','2878 Carlson Road','Prince George','Canada', 'V2L 5E5');

INSERT INTO TASK VALUES ('01','Creating','In progress');
INSERT INTO TASK VALUES ('02','Packing','Incomplete');
INSERT INTO TASK VALUES ('03','Storing','In progress');
INSERT INTO TASK VALUES ('04','Checking ','In progress');
INSERT INTO TASK VALUES ('05','Shipping','Incomplete');

INSERT INTO ASSIGNMENT VALUES ('','','','');

INSERT INTO PACKAGE VALUES ('001','2020-03-06','6','01');
INSERT INTO PACKAGE VALUES ('002','2020-03-08','6','03');
INSERT INTO PACKAGE VALUES ('003','2020-03-09','6','04');
INSERT INTO PACKAGE VALUES ('004','2020-03-11','6','02');
INSERT INTO PACKAGE VALUES ('005','2020-03-15','6','05');






INSERT INTO CONTENTS VALUES ('','');

INSERT INTO ITEM VALUES ('I00001','Canned Goods','0.99','10');
INSERT INTO ITEM VALUES ('I00002','Instant Noodles','0.99','20');
INSERT INTO ITEM VALUES ('I00003','Blankets','10.50','10');
INSERT INTO ITEM VALUES ('I00004','Shirts','3.50','25');
INSERT INTO ITEM VALUES ('I00005','Hygiene Kit','1.00','30');


--ALTER
ALTER TABLE CONTENTS
ADD CONSTRAINT CONTENTS_ITEM_ID_FK FOREIGN KEY (ITEM_ID) REFERENCES ITEM ON DELETE CASCADE;

--SEQUENCE FOR VOLUNTEER 
CREATE SEQUENCE VOLUNTEER_SQ
START WITH 10010
INCREMENT BY 1;

--CREATING INDEXES
CREATE INDEX VOLUNTEER_FNAME_INDX ON VOLUNTEER (VOLUNTEER_FNAME);

CREATE INDEX TASK_NUM_INDX ON TASK (TASK_NUM);

-- ALTER TABLE 

--sequence for volunteer id(?)
--teacher said can use index in either task/volunteer table

--explain why on delete is like that
