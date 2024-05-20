DO $$
    BEGIN
        -- Check if the role 'csca5028' exists
        IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'postgres') THEN
            EXECUTE 'CREATE ROLE csca5028 WITH LOGIN PASSWORD ''postgres''';
        END IF;

        --IF NOT EXISTS (SELECT FROM pg_database WHERE datname = '$DB_NAME') THEN
        --    PERFORM dblink_exec('dbname=csca5028', 'CREATE DATABASE $DB_NAME WITH OWNER = csca5028');
        --END IF;

        IF NOT EXISTS (SELECT FROM pg_database WHERE datname = 'postgres') THEN
            EXECUTE 'CREATE DATABASE csca5028 WITH OWNER = postgres';
        END IF;
    END
$$;