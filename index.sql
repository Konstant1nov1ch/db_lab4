SET search_path TO s333714;

CREATE INDEX idx_player_playerId ON Player(playerId);
CREATE INDEX idx_inventory_playerId ON Inventory(playerId);
CREATE INDEX idx_inventory_item_itemId ON Inventory_Item(itemId);
CREATE INDEX idx_skill_player_playerId ON Skill_Player(playerId);
CREATE INDEX idx_skill_skillId ON Skill(skillId);

CREATE INDEX idx_boss_bossid ON Boss(bossid);
CREATE INDEX idx_mob_mobid ON Mob(mobid);
CREATE INDEX idx_item_itemid ON Item(itemid);
