CREATE VIEW worshipleader_list AS
SELECT DISTINCT
  CONCAT(person.First_Name, ' ', person.Last_Name) AS name,
  person.Person_ID AS Person_ID
FROM fills_role
LEFT JOIN person ON person.Person_ID = fills_role.Person_ID
WHERE fills_role.Role_Type = 'S'
ORDER BY person.Last_Name