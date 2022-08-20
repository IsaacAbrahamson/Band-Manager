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