SET search_path TO s333714;

CREATE OR REPLACE FUNCTION giveBossDrop()
RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT status FROM Player WHERE playerId = NEW.playerId)='Жив' and (SELECT status FROM boss WHERE bossid=NEW.bossid)='Жив' THEN
    IF (New.fightResult) = 'Игрок победил' THEN
      INSERT INTO Inventory_Item (inventoryId, itemId)
      VALUES ((SELECT inventoryId FROM Player WHERE playerId = NEW.playerId), (SELECT drop_item FROM boss WHERE bossid=NEW.bossid));
      UPDATE boss SET status='Мёртв' WHERE bossid=NEW.bossid;
      UPDATE Skill_Player SET killcounter=killcounter+1 WHERE playerId=NEW.playerId;
    ELSE
      UPDATE player SET status='Мёртв' WHERE playerid=NEW.playerId;
    END IF;
  ---ELSE DELETE FROM bossfight WHERE fightid=NEW.fightid;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER bossfight_trigger
AFTER INSERT ON BossFight
FOR EACH ROW
EXECUTE FUNCTION giveBossDrop();


CREATE OR REPLACE FUNCTION giveMobDrop()
RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT status FROM Player WHERE playerId = NEW.playerId)='Жив' and (SELECT status FROM existmobs WHERE exmobId=NEW.exmobId)='Жив' THEN
    IF (New.fightResult) = 'Игрок победил' THEN
      INSERT INTO Inventory_Item (inventoryId, itemId)
      VALUES ((SELECT inventoryId FROM Player WHERE playerId = NEW.playerId), (SELECT drop_item FROM mob WHERE mobid=(SELECT mobid FROM existmobs WHERE exmobid=NEW.exmobid)));
      UPDATE existmobs SET status='Мёртв' WHERE exmobId=NEW.exmobId;
      UPDATE Skill_Player SET killcounter=killcounter+1 WHERE playerId=NEW.playerId;
    ELSE
      UPDATE player SET status='Мёртв' WHERE playerid=NEW.playerId;
    END IF;
  ---ELSE DELETE FROM bossfight WHERE fightid=NEW.fightid;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER mobDrop_trigger
AFTER INSERT ON Fight
FOR EACH ROW
EXECUTE FUNCTION giveMobDrop();

CREATE OR REPLACE FUNCTION showPlayerInventory(pId INTEGER) 
RETURNS TABLE(
  name VARCHAR(50),
  description VARCHAR(150),
  drop_method VARCHAR(150)
)
AS $$
BEGIN
RETURN QUERY
SELECT item.name, item.description, item.drop_method FROM player JOIN inventory ON player.inventoryid=inventory.inventoryid JOIN inventory_item on inventory.inventoryid=inventory_item.inventoryid JOIN item ON inventory_item.itemid=item.itemid WHERE player.playerid=pID;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION showPlayerSkills(pId INTEGER) 
RETURNS TABLE(
  name VARCHAR(50),
  type VARCHAR(25),
  description VARCHAR(150),
  drop_method VARCHAR(150)
)
AS $$
BEGIN
RETURN QUERY
SELECT skill.name, skill.type, skill.description, skill.drop_method FROM skill_player JOIN skill ON skill_player.skillid=skill.skillid WHERE skill_player.playerid=pId;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION howToGetItem(itemName TEXT) 
RETURNS TEXT
AS $$
DECLARE
    result_text TEXT;
BEGIN
  IF (SELECT count(boss.name) FROM boss JOIN item ON itemName=item.name WHERE item.itemid=boss.drop_item)>0 THEN
    SELECT 'Чтобы получить этот предмет, вам надо убить '||boss.name||', находящегося на '||boss.floor||' этаже, в локации ' ||location.name  INTO result_text FROM boss JOIN item ON itemName=item.name JOIN location ON boss.spawn_point=location.locationid WHERE item.itemid=boss.drop_item;
  ELSEIF (SELECT count(mob.name) FROM mob JOIN item ON itemName=item.name WHERE item.itemid=mob.drop_item)>0 THEN
    SELECT 'Чтобы получить этот предмет, вам надо убить '||mob.name||', находящегося на '||mob.floor||' этаже, в локации ' ||location.name  INTO result_text FROM mob JOIN item ON itemName=item.name JOIN location ON mob.spawn_point=location.locationid WHERE item.itemid=mob.drop_item;
  END IF;
  RETURN result_text;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION addNewSkillOnKillCounter5()
RETURNS TRIGGER AS $$
DECLARE
    newSkillId INTEGER;
BEGIN
    FOR newSkillId IN SELECT skillId FROM Skill WHERE method_to_get_skill = '5' LOOP
        IF NEW.killCounter >= 5 THEN
            INSERT INTO Skill_Player (playerId, skillId, killCounter)
            VALUES (NEW.playerId, newSkillId, NEW.killCounter);
        END IF;
    END LOOP;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER addNewSkillTrigger
AFTER UPDATE OF killCounter ON Skill_Player
FOR EACH ROW
EXECUTE FUNCTION addNewSkillOnKillCounter5();

