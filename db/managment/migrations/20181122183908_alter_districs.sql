-- migrate:up

ALTER TABLE districts
ADD latitude DOUBLE;

ALTER TABLE districts 
ADD longitude DOUBLE;

-- migrate:down

ALTER TABLE districts
DROP COLUMN latitude;

ALTER TABLE districts
DROP COLUMN longitude;
