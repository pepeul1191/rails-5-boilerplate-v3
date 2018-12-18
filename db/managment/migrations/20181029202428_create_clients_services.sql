-- migrate:up

CREATE TABLE clients_services (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  client_id INT NOT NULL,
  service_id INT NOT NULL,
  FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE,
  FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS clients_services;
