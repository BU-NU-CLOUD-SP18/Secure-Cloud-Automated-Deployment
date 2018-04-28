#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER hil WITH PASSWORD '12345' CREATEROLE CREATEDB;
    CREATE DATABASE hil WITH OWNER hil;
    GRANT ALL PRIVILEGES ON DATABASE hil TO hil;
EOSQL

sed -i 's@host    all             all             127.0.0.1/32            trust@host    all             all             127.0.0.1/32            md5@' /var/lib/postgresql/data/pg_hba.conf
sed -i 's@host    all             all             ::1/128                 trust@host    all             all             ::1/128                 md5@' /var/lib/postgresql/data/pg_hba.conf
