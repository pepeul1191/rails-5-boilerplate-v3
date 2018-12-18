-- migrate:up

CREATE TABLE clients (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name	VARCHAR(40) NOT NULL,
  address	VARCHAR(80) NOT NULL,
  logo_url	VARCHAR(100) NOT NULL,
  description	VARCHAR(100) NOT NULL,
  latitude	DOUBLE NOT NULL,
  longitude	DOUBLE NOT NULL,
  account VARCHAR(25),
  phone VARCHAR(20),
  user_id INT,
  district_id INT,
  FOREIGN KEY (district_id) REFERENCES districts(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS clients;
