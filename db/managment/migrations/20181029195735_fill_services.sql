-- migrate:up

INSERT INTO services (id, name) VALUES
  (1, 'Kiosko'),
  (2, 'Cafetería'),
  (3, 'Estacionamiento Gratiuito'),
  (4, 'Estacionamiento Pagado'),
  (5, 'Tópico');

-- migrate:down

TRUNCATE services;