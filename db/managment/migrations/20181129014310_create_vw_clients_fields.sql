-- migrate:up

CREATE VIEW vw_clients_fields AS SELECT
  C.id AS client_id, C.user_id AS user_id, F.id as field_id 
  FROM clients C
  INNER JOIN fields F ON F.client_id = C.id;

-- migrate:down

DROP VIEW IF EXISTS vw_clients_fields;