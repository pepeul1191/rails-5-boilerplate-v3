-- migrate:up

INSERT INTO usuarios (id, usuario, contrasenia, correo, estado_usuario_id) VALUES (
  1, 'pepe', 'kiki123', 'jvaldivia@softweb.pe', 1
);
INSERT INTO usuarios (id, usuario, contrasenia, correo, estado_usuario_id) VALUES (
  2, 'yacky', 'koki123', 'yramirez@softweb.pe', 1
);

-- migrate:down

DELETE FROM usuarios WHERE id = 1;
DELETE FROM usuarios WHERE id = 2;
UPDATE sqlite_sequence SET seq = 0 WHERE name = 'usuarios';

DELETE FROM estado_usuarios WHERE id = 1;
DELETE FROM estado_usuarios WHERE id = 2;
DELETE FROM estado_usuarios WHERE id = 3;
UPDATE sqlite_sequence SET seq = 0 WHERE name = 'estado_usuarios';
