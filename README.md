## Band Manager

This project is a complete database application that I designed and built for CpS 301: Intro to Database Management Systems in November, 2020.

The class project consisted of three parts:
- Part 1: Design an ERD based on project requirements
- Part 2: Build a SQL database from the ERD
- Part 3: Build a web application to interact with the SQL database

## Features

- Designed an ERD based on project requirements
- Built MySQL databsase from ERD
- Views and Stored Procedures to make operations easier
- Simple [CRUD application](https://bandmanager.iabrahamson.com/) using Express.js to interact with database
- Placeholder code prevents SQL injection attacks

## Project Requirements

The problem was that the leader of a local worship band was having problems keeping track of what happened in his services. The leader requested for a way to record and schedule services with the follwing requirements:
- View past services
- Create a new service using another service as the template
- Designate if the new service is a morning or evening service
- Record all people who participate in a service
- Record if someone will be unavailable for a service
- Record all the people in musical groups such as bands or choirs that perform
- Record all songs used

## Designing the Database

To get started on the project, I created an ERD showing how all the data sets related to each other in the syste. This let me plan ahead the best way to design a database for the project. I couldn't find the exact ERD that I made, but here is a remake using MySQL Workbench that is fairly close to the original.

![erd](https://user-images.githubusercontent.com/17521691/185760305-fe3de504-4d4a-47b7-9825-286e5f047207.png)

## Creating the Database

After designing the ERD, I converted it to SQL schema based on the entities and relationships like below.

```sql
-- Located at /sql/schema.sql

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
```

After creating the database and adding some test values in, I created some SQL views to make common and difficult queries so much easier.

```sql
-- Located at /sql/views/service_view.sql

CREATE VIEW service_view AS
SELECT
  service.Service_ID AS service_ID,
  service.Svc_DateTime AS Svc_DateTime,
  service.Theme_Event AS Theme_Event,
  worshipleader_view.Name AS WorshipLeader,
  guitarist_view.Name AS Guitarist,
  pianist_view.Name AS Pianist,
  service_item.Seq_Num AS Seq_Num,
  event_type.Description AS Event,
  CASE
    -- If song has a title or number add that to the name
    WHEN service_item.Event_Type_ID = 5 THEN CONCAT(song.Hymnbook_Num, ' ', song.Title)
    WHEN service_item.Event_Type_ID = 8 THEN song.Title
    ELSE service_item.Title
  END AS Title,
  CASE
    -- Add band name if song if by a band
    WHEN service_item.band_ID IS NOT NULL THEN band.Name
    ELSE CONCAT(person.First_Name, ' ', person.Last_Name) 
  END AS Name,
  service_item.Notes AS Notes
FROM service
LEFT JOIN service_item ON service.Service_ID = service_item.Service_ID
LEFT JOIN event_type ON service_item.Event_Type_ID = event_type.Event_Type_ID
LEFT JOIN person ON  service_item.Person_ID = person.Person_ID
LEFT JOIN band ON service_item.band_ID = band.band_ID
LEFT JOIN song ON service_item.Song_ID = song.Song_ID
LEFT JOIN worshipleader_view ON service.Service_ID = worshipleader_view.service_ID
LEFT JOIN pianist_view ON service.Service_ID = pianist_view.service_ID
LEFT JOIN guitarist_view ON service.Service_ID = guitarist_view.service_ID
```

I also created a stored procedure to add a service if it doesn't exist.

```sql
-- Located at /sql/procedures/create_service.sql

CREATE PROCEDURE create_service(IN date VARCHAR(50), IN theme VARCHAR(50), IN songleader INT, IN templateID INT, OUT status VARCHAR(50))
BEGIN
  DECLARE time DATETIME;
  DECLARE serviceID INT;

  -- Check if service already exists at that time
  SELECT Svc_DateTime INTO time FROM service WHERE Svc_DateTime LIKE CONCAT(date, '%') LIMIT 1;
  IF (time IS NULL) THEN
    -- Service doesn't exist at that time so add it
    INSERT INTO service (Svc_DateTime, Theme_Event) VALUES (date, theme);
    SELECT LAST_INSERT_ID() INTO serviceID FROM service LIMIT 1;
    IF (songleader IS NOT NULL) THEN
      INSERT INTO fills_role (Person_ID, Service_ID, Role_Type, Confirmed) VALUES (songleader, LAST_INSERT_ID(), 'S', 'N');
    END IF;

    -- Create additional Service Item entity
    INSERT INTO
      service_item (
        Service_ID,
        ...
      )
    SELECT
      serviceID,
      ...
    FROM service_item WHERE Service_ID = templateID;

    SET status = 'SUCCESS';
    SELECT status;
  ELSE
    SET status = 'There is already a service at this time';
    SELECT status;
  END IF;
END
```

## Using the Database

Here are some examples of CRUD queries.

CREATE a new service:
```sql
CALL create_service('2022.08.21 10:30', 'New Theme', 16, 2, @output);
SELECT @output;
```

READ all services:
```sql
SELECT * FROM service_view;
```

UPDATE theme for service:
```sql
UPDATE service
SET Theme_Event = 'Updated Theme'
WHERE Service_ID = 1; 
```

DELETE service:
```sql
DELETE FROM fills_role WHERE Service_ID = 1;
DELETE FROM service_item WHERE Service_ID = 1;
DELETE FROM service WHERE Service_ID = 1;
```

## Using the Web Application

Visit the application at: https://bandmanager.iabrahamson.com/

You will see all services on the main page.

![image](https://user-images.githubusercontent.com/17521691/185766646-d4384af6-50f5-49ce-8f63-c5fd74a6f62e.png)

Click on a service to view all of its service events, and musicians.

![image](https://user-images.githubusercontent.com/17521691/185766699-5f948e1e-058d-45eb-ad71-6255d6907804.png)

To add a new service, use the form at a bottom of a service item to use that service as a template. All of the service events in that service will be used in the new service.

![image](https://user-images.githubusercontent.com/17521691/185766719-2588a552-d1a3-4f80-864e-0174955f3ea4.png)

You will get a success or error message.

![image](https://user-images.githubusercontent.com/17521691/185767020-88edd2b2-3d7c-4edd-bda0-3cffd0e3f729.png)

![image](https://user-images.githubusercontent.com/17521691/185767032-56adfd60-6352-49b6-9a66-f6159220ce37.png)


## Installation

To run the project, you will need to have Node and MySQL installed on your computer.

Open in a terminal in the `/sql` folder.

Restore the MySQL database:
```
# Create services database
mysql
CREATE DATABASE services;
exit

# Restore from dump file
mysql -u <user> -p<password> services < dump.sql

# Restore using PowerShell
Get-Content dump.sql | mysql -u <user> -p<password> services
```

Install NPM modules:
```
npm install
```

Create a .env file:
```
DB_HOST="localhost"
DB_PORT="3306"
DB_USER="user"
DB_PASSWORD="userpass"
DB_DATABASE="services"
PORT="3000"
SOCKET="/var/run/mysqld/mysqld.sock"
```

Run the application
```
node server.js
```
