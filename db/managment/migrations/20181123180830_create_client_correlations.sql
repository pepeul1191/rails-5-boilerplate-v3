-- migrate:up

CREATE TABLE client_correlations (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);
ALTER TABLE client_correlations AUTO_INCREMENT = 20180000;

-- migrate:down

ALTER TABLE client_correlations AUTO_INCREMENT = 1;
DROP TABLE IF EXISTS client_correlations;
