-- migrate:up

ALTER TABLE players
ADD notifications BOOLEAN;

-- migrate:down

ALTER TABLE players
DROP COLUMN client_state_id;
