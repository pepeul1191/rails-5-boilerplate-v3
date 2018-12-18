-- migrate:up

CREATE VIEW vw_clients AS
  SELECT CL.id, CL.name, CL.address, CL.logo_url, CL.latitude, CL.longitude, CL.phone, CL.id AS district_id, DI.name AS district, CL.id AS client_state_id, CS.name AS client_state 
  FROM clients CL 
  JOIN vw_districts DI ON DI.id = CL.district_id 
  JOIN client_states CS ON CS.id = CL.client_state_id
  LIMIT 2000

-- migrate:down

DROP VIEW IF EXISTS vw_clients