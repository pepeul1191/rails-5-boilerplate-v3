-- migrate:up

INSERT INTO permisos (id, nombre, llave) VALUES (
  1,
  'Listar Sistemas',
  'sistema_listar'
);
INSERT INTO permisos (id, nombre, llave) VALUES (
  2,
  'Listar Módulos de Sistema',
  'sistema_modulo_listar'
);

INSERT INTO roles (id, nombre) VALUES (
  1,
  'Administrador'
);

INSERT INTO roles_permisos (id, rol_id, permiso_id) VALUES (
  1,1,1
);
INSERT INTO roles_permisos (id, rol_id, permiso_id) VALUES (
  2, 1,2
);

-- migrate:down

DELETE FROM permisos WHERE id = 1;
DELETE FROM permisos WHERE id = 2;
UPDATE sqlite_sequence SET seq = 0 WHERE name = 'permisos';
DELETE FROM roles WHERE id = 1;
UPDATE sqlite_sequence SET seq = 0 WHERE name = 'roles';
DELETE FROM roles_permisos WHERE id = 1;
DELETE FROM roles_permisos WHERE id = 2;
UPDATE sqlite_sequence SET seq = 0 WHERE name = 'roles_permisos';
