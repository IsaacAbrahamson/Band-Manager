-- Services
CREATE TABLE service (
  Service_ID int NOT NULL AUTO_INCREMENT,
  Svc_DateTime datetime(6) NOT NULL,
  Theme_Event varchar(40) DEFAULT NULL,
  PRIMARY KEY (Service_ID)
);

CREATE TABLE service_item (
  Service_Item_ID int NOT NULL AUTO_INCREMENT,
  Service_ID int NOT NULL,
  Seq_Num int NOT NULL,
  Event_Type_ID int NOT NULL,
  Title varchar(45) DEFAULT NULL,
  Notes varchar(40) DEFAULT NULL,
  Confirmed char(1) NOT NULL,
  Person_ID int DEFAULT NULL,
  Band_ID int DEFAULT NULL,
  Song_ID int DEFAULT NULL,
  PRIMARY KEY (Service_Item_ID),
  KEY FK_service_event_band (Band_ID),
  KEY FK_service_event_EventType (Event_Type_ID),
  KEY FK_service_event_Person (Person_ID),
  KEY FK_service_event_Service (Service_ID),
  KEY FK_service_event_Song (Song_ID),
  CONSTRAINT FK_service_event_band FOREIGN KEY (Band_ID) REFERENCES band (Band_ID),
  CONSTRAINT FK_service_event_Person FOREIGN KEY (Person_ID) REFERENCES person (Person_ID),
  CONSTRAINT FK_service_event_Service FOREIGN KEY (Service_ID) REFERENCES service (Service_ID),
  CONSTRAINT FK_service_event_Song FOREIGN KEY (Song_ID) REFERENCES song (song_id),
  CONSTRAINT FK_service_item_event_type FOREIGN KEY (Event_Type_ID) REFERENCES event_type (Event_Type_ID)
);

CREATE TABLE event_type (
  Event_Type_ID int NOT NULL AUTO_INCREMENT,
  Description varchar(50) NOT NULL,
  PRIMARY KEY (Event_Type_ID)
);

CREATE TABLE song (
  Song_ID int NOT NULL AUTO_INCREMENT,
  Song_Type char(1) NOT NULL,
  Title varchar(50) NOT NULL,
  Hymnbook_Num varchar(5) DEFAULT NULL,
  Arranger varchar(20) DEFAULT NULL,
  PRIMARY KEY (Song_ID)
);

-- Persons
CREATE TABLE person (
  Person_ID int NOT NULL AUTO_INCREMENT,
  First_Name varchar(15) NOT NULL,
  Last_Name varchar(20) NOT NULL,
  Email varchar(50) DEFAULT NULL,
  PRIMARY KEY (Person_ID)
);

CREATE TABLE fills_role (
  Person_ID int NOT NULL,
  Service_ID int NOT NULL,
  Role_Type char(1) NOT NULL,
  Confirmed char(1) NOT NULL,
  PRIMARY KEY (Person_ID,Service_ID),
  KEY Service_ID (Service_ID),
  CONSTRAINT fills_role_ibfk_1 FOREIGN KEY (Person_ID) REFERENCES person (Person_ID),
  CONSTRAINT fills_role_ibfk_2 FOREIGN KEY (Service_ID) REFERENCES service (Service_ID)
);

CREATE TABLE member_of (
  Band_ID int NOT NULL,
  Person_ID int NOT NULL,
  PRIMARY KEY (Band_ID,Person_ID),
  KEY FK_member_of_Person (Person_ID),
  CONSTRAINT FK_member_of_band FOREIGN KEY (Band_ID) REFERENCES band (Band_ID),
  CONSTRAINT FK_member_of_Person FOREIGN KEY (Person_ID) REFERENCES person (person_id)
);

CREATE TABLE unavailable_for (
  Person_ID int NOT NULL,
  Service_ID int NOT NULL,
  PRIMARY KEY (Person_ID,Service_ID),
  KEY FK_unavailable_for_Service (Service_ID),
  CONSTRAINT FK_unavailable_for_Person FOREIGN KEY (Person_ID) REFERENCES person (Person_ID),
  CONSTRAINT FK_unavailable_for_Service FOREIGN KEY (Service_ID) REFERENCES service (Service_ID)
);

-- Bands
CREATE TABLE band (
  Band_ID int NOT NULL AUTO_INCREMENT,
  Name varchar(30) NOT NULL,
  PRIMARY KEY (Band_ID)
);