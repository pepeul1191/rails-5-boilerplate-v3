-- migrate:up

ALTER TABLE clients
ADD bank_id INT;

ALTER TABLE clients
FOREIGN KEY (bank_id) REFERENCES banks(id) ON DELETE CASCADE;

-- migrate:down

ALTER TABLE clients
DROP COLUMN bank_id;
