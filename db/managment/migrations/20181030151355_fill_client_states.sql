-- migrate:up

INSERT INTO client_states (id, name) VALUES
  (1, 'Activo'),
  (2, 'Suspendido'),
  (3, 'En Remodelaciones'),
  (4, 'Eliminado');

-- migrate:down

TRUNCATE client_states;