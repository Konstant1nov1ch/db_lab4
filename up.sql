SET search_path TO s333714;

CREATE TABLE Inventory (
  inventoryId serial PRIMARY KEY,
  size INTEGER CHECK (size >= 50 AND size <= 100) NOT NULL
);

CREATE TABLE Player (
  playerId serial PRIMARY KEY,
  nickname VARCHAR(15) NOT NULL,
  hitpoints int CHECK (hitpoints >= 0 AND hitpoints <= 1000000) NOT NULL,
  experience int CHECK (experience >= 0 AND experience <= 100000) NOT NULL,
  gender VARCHAR(15) NOT NULL,
  age int CHECK (age >= 0 AND age <= 150) NOT NULL,
  money int CHECK (money >= 0 AND money <= 1000000) NOT NULL,
  status VARCHAR(5) NOT NULL,
  inventoryId serial REFERENCES Inventory(inventoryId) NOT NULL
);

CREATE TABLE Item (
  itemId serial PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(150) NOT NULL,
  drop_method VARCHAR(150) NOT NULL,
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
  name VARCHAR(50) NOT NULL,
  type VARCHAR(25) NOT NULL,
  drop_method VARCHAR(200) NOT NULL,
  description VARCHAR(300) NOT NULL
);

CREATE TABLE Skill_Player (
  playerId serial REFERENCES Player(playerId),
  skillId serial REFERENCES Skill(skillId)
);

CREATE TABLE Floor (
  floorId serial PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  climate VARCHAR(15) NOT NULL,
  main_town VARCHAR(30) NOT NULL,
  status VARCHAR(10) NOT NULL,
  description VARCHAR(300) NOT NULL
);

CREATE TABLE Boss (
  bossId serial PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  hitpoints int CHECK (hitpoints >= 0 AND hitpoints <= 1000000),
  floor int REFERENCES Floor(floorId),
  spawn_point VARCHAR(50) NOT NULL,
  features VARCHAR(300) NOT NULL,
  drop_item serial REFERENCES Item(itemId),
  teleport_ability bool NOT NULL
);

CREATE TABLE Mob (
  mobId serial PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  hitpoints int CHECK (hitpoints >= 0 AND hitpoints <= 100000),
  floor int REFERENCES Floor(floorId),
  spawn_point VARCHAR(50) NOT NULL,
  features VARCHAR(150) NOT NULL,
  drop_item serial REFERENCES Item(itemId) NOT NULL
);