-- migrate:up

CREATE TABLE fields_field_types (
	id	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  field_id INT NOT NULL,
  field_type_id INT NOT NULL,
  FOREIGN KEY (field_id) REFERENCES fields(id) ON DELETE CASCADE,
  FOREIGN KEY (field_type_id) REFERENCES field_types(id) ON DELETE CASCADE
);

-- migrate:down

DROP TABLE IF EXISTS fields_field_types;
