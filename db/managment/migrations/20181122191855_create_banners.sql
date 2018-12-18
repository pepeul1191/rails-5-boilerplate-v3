-- migrate:up

CREATE TABLE banners (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	description	VARCHAR(100) NOT NULL,
  url	VARCHAR(100) NOT NULL
);

-- migrate:down

DROP TABLE IF EXISTS banners;
