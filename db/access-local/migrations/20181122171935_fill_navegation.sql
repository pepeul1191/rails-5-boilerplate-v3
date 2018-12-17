-- migrate:up

INSERT INTO modulos (id, nombre, url, icono) VALUES (
  1,
  'Accesos',
  'accesos/',
  ''
);
INSERT INTO subtitulos (id, nombre, modulo_id) VALUES (
  1,
  'Navegación',
  1
);
INSERT INTO subtitulos (id, nombre, modulo_id) VALUES (
  2,
  'Permisos y Roles',
  1
);
INSERT INTO subtitulos (id, nombre, modulo_id) VALUES (
  3,
  'Usuarios',
  1
);
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  1,
  'Gestión de Menú',
  'accesos/#/modulo',
  1
);
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  2,
  'Gestión de Permisos',
  'accesos/#/permiso',
  2
);
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  3,
  'Gestión de Roles',
  'accesos/#/rol',
  2
);
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  4,
  'Gestión de Usuarios',
  'accesos/#/usuario',
  3
);

INSERT INTO modulos (id, nombre, url, icono) VALUES (
  2,
  'Administración',
  'managment/',
  ''
); --id generado -> 2

-- SUBTITULOS

INSERT INTO subtitulos (id, nombre, modulo_id) VALUES (
  4,
  'Maestros',
  2
); --id generado -> 4
INSERT INTO subtitulos (id, nombre, modulo_id) VALUES (
  5,
  'Clientes',
  2
); --id generado -> 5

-- ITEMS

INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  5,
  'Gestión de Ubicaciones',
  'managment/#/location',
  4
); --id generado -> 5
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  6,
  'Gestión de Servicios',
  'managment/#/service',
  4
); --id generado -> 6
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  7,
  'Gestión de Tipos de Canchas',
  'managment/#/field_type',
  4
); --id generado -> 7
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  8,
  'Gestión de Bancos',
  'managment/#/bank',
  4
); --id generado -> 8
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  9,
  'Gestión de Clientes',
  'managment/#/client',
  5
); --id generado -> 9
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  10,
  'Agregar Cliente',
  'managment/#/client/add',
  5
); --id generado -> 10
INSERT INTO subtitulos (id, nombre, modulo_id) VALUES (
  6,
  'Usuarios',
  2
); --id generado -> 6
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  11,
  'Gestión de Usuarios',
  'managment/user/#/',
  6
); --id generado -> 11
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  12,
  'Gestión de Banners',
  'managment/#/banner',
  4
); --id generado -> 12
INSERT INTO items (id, nombre, url, subtitulo_id) VALUES (
  13,
  'Agregar Usuario',
  'managment/user/#/add',
  6
);

-- migrate:down

DELETE FROM modulos;
DELETE FROM subtitulos;
DELETE FROM items;
UPDATE sqlite_sequence SET seq = 0 WHERE name = 'modulos';
UPDATE sqlite_sequence SET seq = 0 WHERE name = 'subtitulos';
UPDATE sqlite_sequence SET seq = 0 WHERE name = 'items';
