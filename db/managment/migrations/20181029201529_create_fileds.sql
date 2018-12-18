-- migrate:up

CREATE TABLE fields (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name	VARCHAR(30),
  hour_cost	DOUBLE NOT NULL,
  client_id INT,
  FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS fields;
