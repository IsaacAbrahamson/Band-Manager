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
        Seq_Num,
        Event_Type_ID,
        Title,
        Notes,
        Confirmed,
        Person_ID,
        band_ID,
        Song_ID
      )
    SELECT
      serviceID,
      Seq_Num,
      service_item.Event_Type_ID,
      NULL AS Title,
      NULL AS Notes,
      'N' AS Confirmed,
      NULL AS Person_ID,
      NULL AS band_ID,
      NULL AS Song_ID
    FROM service_item WHERE Service_ID = templateID;

    SET status = 'SUCCESS';
    SELECT status;
  ELSE
    SET status = 'There is already a service at this time';
    SELECT status;
  END IF;
END