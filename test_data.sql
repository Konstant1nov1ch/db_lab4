SET search_path TO s333714;

-- Заполнение таблицы Inventory
INSERT INTO Inventory (size) VALUES
  (75),
  (90),
  (55);

-- Заполнение таблицы Player
INSERT INTO Player (nickname, hitpoints, experience, gender, age, money, status, inventoryId) VALUES
  ('Player1', 100, 5000, 'Male', 25, 1000, 'Active', 1),
  ('Player2', 150, 7500, 'Female', 30, 2000, 'Inactive', 2),
  ('Player3', 80, 3000, 'Male', 22, 500, 'Active', 3);

-- Заполнение таблицы Item
INSERT INTO Item (name, description, drop_method, lvl) VALUES
  ('Sword', 'A sharp sword', 'Drop', 2),
  ('Shield', 'A sturdy shield', 'Loot', 1),
  ('Potion', 'Healing potion', 'Craft', 1); 

-- Заполнение таблицы Armor
INSERT INTO Armor (itemId, defence_value) VALUES
  (1, 30),
  (2, 20),
  (3, 10);

-- Заполнение таблицы Equipment
INSERT INTO Equipment (itemId, defence_value) VALUES
  (1, 25),
  (2, 15),
  (3, 5);

-- Заполнение таблицы Weapons
INSERT INTO Weapons (itemId, damage_value) VALUES
  (1, 40),
  (2, 25),
  (3, 10);

-- Заполнение таблицы Inventory_Item
INSERT INTO Inventory_Item (inventoryId, itemId) VALUES
  (1, 1),
  (2, 2),
  (3, 3);

-- Заполнение таблицы Skill
INSERT INTO Skill (name, type, drop_method, description) VALUES
  ('Fireball', 'Attack', 'Learn', 'A powerful fireball skill'),
  ('Healing', 'Support', 'Teach', 'A healing skill to restore hitpoints'),
  ('Stealth', 'Stealth', 'Discover', 'A skill for stealthy actions');

-- Заполнение таблицы Skill_Player
INSERT INTO Skill_Player (playerId, skillId) VALUES
  (1, 1),
  (1, 2),
  (2, 1);

-- Заполнение таблицы Floor
INSERT INTO Floor (name, climate, main_town, status, description) VALUES
  ('Dungeon', 'Underground', 'Darkville', 'Active', 'A dark and eerie dungeon'),
  ('Forest', 'Outdoor', 'Greenville', 'Inactive', 'A peaceful forest'),
  ('Cave', 'Underground', 'Rockville', 'Active', 'A hidden cave');

-- Заполнение таблицы Boss
INSERT INTO Boss (name, hitpoints, floor, spawn_point, features, drop_item, teleport_ability) VALUES
  ('Dragon', 10000, 1, 'Dragon Lair', 'Breathes fire', 1, true),
  ('Goblin King', 500, 2, 'Goblin Camp', 'Small but cunning', 2, false),
  ('Dark Lord', 15000, 3, 'Cave Depths', 'Master of dark magic', 3, true);

-- Заполнение таблицы Mob
INSERT INTO Mob (name, hitpoints, floor, spawn_point, features, drop_item) VALUES
  ('Zombie', 200, 1, 'Crypt', 'Slow and undead', 3),
  ('Wolf', 100, 2, 'Forest', 'Hunts in packs', 5),
  ('Spider', 50, 3, 'Cave', 'Poisonous bites', 6);
