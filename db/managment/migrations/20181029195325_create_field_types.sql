-- migrate:up

CREATE TABLE field_types (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name	VARCHAR(30) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS field_types;
