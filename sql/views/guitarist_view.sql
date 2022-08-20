CREATE VIEW guitarist_view AS
SELECT
  service.Service_ID AS service_ID,
  CONCAT(person.First_Name, ' ', person.Last_Name) AS Name
FROM service
LEFT JOIN fills_role ON service.Service_ID = fills_role.Service_ID
LEFT JOIN person ON fills_role.Person_ID = person.Person_ID
WHERE fills_role.Role_Type = 'O'