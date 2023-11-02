SET search_path TO s333714;

DROP TYPE IF EXISTS status CASCADE;
DROP TYPE IF EXISTS floor_status CASCADE;
DROP TYPE IF EXISTS gender CASCADE;
DROP TYPE IF EXISTS method_to_get_item CASCADE;
DROP TYPE IF EXISTS method_to_get_skill CASCADE;
DROP TYPE IF EXISTS fight_result CASCADE;

DROP INDEX IF EXISTS idx_player_playerId;
DROP INDEX IF EXISTS idx_inventory_playerId;
DROP INDEX IF EXISTS idx_inventory_item_itemId;
DROP INDEX IF EXISTS idx_skill_player_playerId;
DROP INDEX IF EXISTS idx_skill_skillId;
DROP INDEX IF EXISTS idx_boss_bossid;
DROP INDEX IF EXISTS idx_mob_mobid;
DROP INDEX IF EXISTS idx_item_itemid;

DO $$ 
DECLARE
    tab_name text;
BEGIN
    FOR tab_name IN (SELECT table_name
                     FROM information_schema.tables
                     WHERE table_schema = 's333714' AND table_type = 'BASE TABLE') 
    LOOP
        EXECUTE 'DROP TABLE IF EXISTS ' || tab_name || ' CASCADE';
    END LOOP;
END $$;
