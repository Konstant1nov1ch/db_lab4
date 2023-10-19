SET search_path TO s333714;


CREATE TABLE Inventory (
    inventoryId serial PRIMARY KEY,
    size integer CHECK (size >= 10 AND size <= 50)
);

CREATE TABLE Subjects (
    idSubj serial PRIMARY KEY,
    name VARCHAR(10),
    describe VARCHAR(30),
    howToGet VARCHAR(30),
    floorId integer NOT NULL,
    level integer NOT NULL
);

CREATE TABLE Skills (
    idSkill serial PRIMARY KEY,
    name VARCHAR(10),
    type integer NOT NULL,
    howToGet VARCHAR(30),
    describe VARCHAR(30)
);

CREATE TABLE Player (
    idPlayer serial PRIMARY KEY,
    name VARCHAR(10),
    hit_point integer NOT NULL,
    exp integer,
    gender VARCHAR(10),
    age integer,
    money integer,
    status VARCHAR(25),
    InventoryId integer,
    FOREIGN KEY (InventoryId) REFERENCES Inventory(inventoryId)
);


CREATE TABLE InventorySubject (
    inventoryId integer,
    FOREIGN KEY (inventoryId) REFERENCES Inventory(inventoryId),
    idSubj integer,
    FOREIGN KEY (idSubj) REFERENCES Subjects(idSubj)
);

CREATE TABLE PlayerSkill (
    idPlayer integer,
    FOREIGN KEY (idPlayer) REFERENCES Player(idPlayer),
    idSkill integer,
    FOREIGN KEY (idSkill) REFERENCES Skills(idSkill)
);
