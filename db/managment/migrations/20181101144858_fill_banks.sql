-- migrate:up

INSERT INTO banks (id, name) VALUES
  (1, 'Banco de Crédito del Perú'),
  (2, 'Interbank'),
  (3, 'BBVA'),
  (4, 'Scotiabank');

-- migrate:down

TRUNCATE banks;
