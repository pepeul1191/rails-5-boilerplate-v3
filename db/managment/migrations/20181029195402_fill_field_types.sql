-- migrate:up

INSERT INTO field_types (id, name) VALUES
  (1, 'Futbol 5'),
  (2, 'Futbol 7'),
  (3, 'Futbol 11'),
  (4, 'Césped Natural'),
  (5, 'Césped Sintético'),
  (6, 'Techado');

-- migrate:down

TRUNCATE field_types;