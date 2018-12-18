-- migrate:up

CREATE TABLE services (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name	VARCHAR(30) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS services;
