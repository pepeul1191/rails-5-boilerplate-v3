-- migrate:up

CREATE VIEW vw_clients_services AS SELECT
CS.id AS id, CS.client_id AS client_id, CS.service_id AS service_id, S.name AS name, 0 AS existe  
FROM clients_services CS 
INNER JOIN services S ON CS.service_id = S.id 
LIMIT 2000;

-- migrate:down

DROP VIEW IF EXISTS vw_clients_services;