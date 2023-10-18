CREATE SCHEMA IF NOT EXISTS s333714;
SET search_path TO s333714;

CREATE TABLE Inventory (
    InventoryId serial PRIMARY KEY,
    size integer CHECK (size >= 10 AND size <= 50)
);

CREATE TABLE Player (
    name serial PRIMARY KEY,
    hit_point integer NOT NULL,
    exp integer,
    gender VARCHAR(10),
    age integer,
    money integer,
    status VARCHAR(25),
    InventoryId integer,
    FOREIGN KEY (InventoryId) REFERENCES Inventory(InventoryId)
);
