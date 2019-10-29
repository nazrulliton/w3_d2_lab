DROP TABLE IF EXISTS property;

CREATE TABLE property(
  id SERIAL4 PRIMARY KEY,
  address VARCHAR(255),
  value INT4,
  num_bedrooms INT2,
  buy_let_status VARCHAR(255)
);
