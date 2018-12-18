-- migrate:up

CREATE TABLE players (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name	VARCHAR(40) NOT NULL,
  account VARCHAR(25),
  phone VARCHAR(20),
  user_id INT
);

-- migrate:down

DROP TABLE IF EXISTS players;
