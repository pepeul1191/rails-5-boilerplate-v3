-- migrate:up

ALTER TABLE banners
ADD url VARCHAR(60);

-- migrate:down

ALTER TABLE banners
DROP COLUMN url;
