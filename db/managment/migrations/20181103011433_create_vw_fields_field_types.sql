-- migrate:up

CREATE VIEW vw_fields_field_types AS SELECT
  FT.id, T.name, 1 AS existe  
  FROM fields_field_types FT 
  INNER JOIN fields F ON FT.field_id = F.id 
  INNER JOIN field_types T ON FT.field_type_id = T.id;

-- migrate:down

DROP VIEW IF EXISTS vw_fields_field_types;