-- migrate:up

CREATE TABLE roles (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name	VARCHAR(40) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS roles;
