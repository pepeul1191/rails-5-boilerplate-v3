-- migrate:up

CREATE TABLE roles(
	id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	nombre	VARCHAR(30) NOT NULL
)

-- migrate:down

DROP TABLE IF EXISTS roles;