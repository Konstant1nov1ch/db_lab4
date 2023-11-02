SET search_path TO s333714;

DROP TYPE IF EXISTS status CASCADE;
DROP TYPE IF EXISTS floor_status CASCADE;
DROP TYPE IF EXISTS gender CASCADE;
DROP TYPE IF EXISTS method_to_get_item CASCADE;
DROP TYPE IF EXISTS method_to_get_skill CASCADE;
DROP TYPE IF EXISTS fight_result CASCADE;

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
