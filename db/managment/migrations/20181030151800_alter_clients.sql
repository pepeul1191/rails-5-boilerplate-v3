-- migrate:up

ALTER TABLE clients
ADD client_state_id INT;

ALTER TABLE clients
FOREIGN KEY (client_state_id) REFERENCES client_states(id) ON DELETE CASCADE

-- migrate:down

ALTER TABLE clients
DROP COLUMN client_state_id;
