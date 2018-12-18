-- migrate:up

CREATE TABLE banks (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name	VARCHAR(30) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS banks;
