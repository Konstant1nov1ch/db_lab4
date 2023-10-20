SET search_path TO s333714;

CREATE TABLE Inventory (
  inventoryId serial PRIMARY KEY,
  size INTEGER CHECK (size >= 50 AND size <= 100) NOT NULL
);

CREATE TABLE Player (
  playerId serial PRIMARY KEY,
  nickname text NOT NULL,
  hitpoints int CHECK (hitpoints >= 0 AND hitpoints <= 1000000) NOT NULL,
  experience int CHECK (experience >= 0 AND experience <= 100000) NOT NULL,
  gender text NOT NULL,
  age int CHECK (age >= 0 AND age <= 150) NOT NULL,
  money int CHECK (money >= 0 AND money <= 1000000) NOT NULL,
  status text NOT NULL,
  inventoryId serial REFERENCES Inventory(inventoryId) NOT NULL
);

CREATE TABLE Item (
  itemId serial PRIMARY KEY,
  name text NOT NULL,
  description text NOT NULL,
  drop_method text NOT NULL,
  lvl int CHECK (lvl >= 1 AND lvl <= 100) NOT NULL
);

CREATE TABLE Armor (
  armorId serial PRIMARY KEY,
  itemId serial REFERENCES Item(itemId),
  defence_value int CHECK (defence_value >= 0 AND defence_value <= 10000) NOT NULL
);

CREATE TABLE Equipment (
  equipmentId serial PRIMARY KEY,
  itemId serial REFERENCES Item(itemId),
  defence_value int CHECK (defence_value >= 0 AND defence_value <= 500) NOT NULL
);

CREATE TABLE Weapons (
  weaponsId serial PRIMARY KEY,
  itemId serial REFERENCES Item(itemId),
  damage_value int CHECK (damage_value >= 1 AND damage_value <= 10000)NOT NULL
);

CREATE TABLE Inventory_Item (
  inventoryId serial REFERENCES Inventory(inventoryId),
  itemId serial REFERENCES Item(itemId)
);

CREATE TABLE Skill (
  skillId serial PRIMARY KEY,
  name text NOT NULL,
  type text NOT NULL,
  drop_method text NOT NULL,
  description text NOT NULL
);

CREATE TABLE Skill_Player (
  playerId serial REFERENCES Player(playerId),
  skillId serial REFERENCES Skill(skillId)
);

CREATE TABLE Floor (
  floorId serial PRIMARY KEY,
  name text NOT NULL,
  climate text NOT NULL,
  main_town text NOT NULL,
  status text NOT NULL,
  description text NOT NULL
);

CREATE TABLE Boss (
  bossId serial PRIMARY KEY,
  name text NOT NULL,
  hitpoints int CHECK (hitpoints >= 0 AND hitpoints <= 1000000),
  floor int REFERENCES Floor(floorId),
  spawn_point text NOT NULL,
  features text NOT NULL,
  drop_item serial REFERENCES Item(itemId),
  teleport_ability bool NOT NULL
);

CREATE TABLE Mob (
  mobId serial PRIMARY KEY,
  name text NOT NULL,
  hitpoints int CHECK (hitpoints >= 0 AND hitpoints <= 100000),
  floor int REFERENCES Floor(floorId),
  spawn_point text NOT NULL,
  features text NOT NULL,
  drop_item serial REFERENCES Item(itemId) NOT NULL
);