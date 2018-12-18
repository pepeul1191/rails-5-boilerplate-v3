-- migrate:up

ALTER TABLE banners
ADD link VARCHAR(60);

-- migrate:down

ALTER TABLE banners
DROP COLUMN link;
