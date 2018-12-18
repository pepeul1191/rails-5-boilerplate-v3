-- migrate:up

CREATE VIEW vw_client_district_state AS SELECT
C.id, C.name, C.description, C.address, C.phone, C.account, C.bank_id, B.name AS bank, C.logo_url, C.latitude, C.longitude, C.client_state_id, CS.name AS state ,C.district_id, D.name AS district, C.user_id 
FROM clients C
JOIN vw_districts D ON D.id = C.district_id
JOIN client_states CS ON CS.id = C.client_state_id
JOIN banks B ON B.id = C.bank_id
LIMIT 2000;

-- migrate:down

DROP VIEW IF EXISTS vw_client_district_state;
