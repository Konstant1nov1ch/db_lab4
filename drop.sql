SET search_path TO s333714;

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
