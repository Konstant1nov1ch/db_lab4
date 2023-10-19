SET search_path TO s333714;

CREATE TABLE Inventory (
  inventoryId serial PRIMARY KEY,
  size INTEGER CHECK (size >= 50 AND size <= 100)
);

CREATE TABLE Player (
  playerId serial PRIMARY KEY,
  nickname text,
  hitpoints INTEGER CHECK (hitpoints >= 0 AND hitpoints <= 1000),
  experience INTEGER CHECK (experience >= 0 AND experience <= 100000),
  gender text,
  age INTEGER CHECK (age >= 0 AND age <= 150),
  money INTEGER CHECK (money >= 0 AND money <= 1000000),
  status text,
  inventoryId serial REFERENCES Inventory(inventoryId)
);

CREATE TABLE Item (
  itemId serial PRIMARY KEY,
  name text,
  description text,
  drop_method text,
  lvl int CHECK (lvl >= 1 AND lvl <= 100)
);

CREATE TABLE Armor (
  armorId serial PRIMARY KEY,
  itemId serial REFERENCES Item(itemId),
  defence_value INTEGER CHECK (defence_value >= 0 AND defence_value <= 500)
);

CREATE TABLE Equipment (
  equipmentId serial PRIMARY KEY,
  itemId serial REFERENCES Item(itemId),
  defence_value INTEGER CHECK (defence_value >= 0 AND defence_value <= 500)
);

CREATE TABLE Weapons (
  weaponsId serial PRIMARY KEY,
  itemId serial REFERENCES Item(itemId),
  damage_value INTEGER CHECK (damage_value >= 1 AND damage_value <= 100)
);

CREATE TABLE Inventory_Item (
  inventoryId serial REFERENCES Inventory(inventoryId),
  itemId serial REFERENCES Item(itemId)
);

CREATE TABLE Skill (
  skillId serial PRIMARY KEY,
  name text,
  type text,
  drop_method text,
  description text
);

CREATE TABLE Skill_Player (
  playerId serial REFERENCES Player(playerId),
  skillId serial REFERENCES Skill(skillId)
);

CREATE TABLE Floor (
  floorId serial PRIMARY KEY,
  name text,
  climate text,
  main_town text,
  status text,
  description text
);

CREATE TABLE Boss (
  bossId serial PRIMARY KEY,
  name text,
  hitpoints int CHECK (hitpoints >= 0 AND hitpoints <= 10000),
  floor int REFERENCES Floor(floorId),
  spawn_point text,
  features text,
  drop_item serial REFERENCES Item(itemId),
  teleport_ability bool
);

CREATE TABLE Mob (
  mobId serial PRIMARY KEY,
  name text,
  hitpoints int CHECK (hitpoints >= 0 AND hitpoints <= 10000),
  floor int REFERENCES Floor(floorId),
  spawn_point text,
  features text,
  drop_item serial REFERENCES Item(itemId)
);
