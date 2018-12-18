-- migrate:up

CREATE TABLE pictures (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	description	VARCHAR(40) NOT NULL,
  url	VARCHAR(100) NOT NULL,
  client_id INT,
  FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS pictures;
