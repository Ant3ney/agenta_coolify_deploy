-- Agenta OSS database bootstrap.
-- This mirrors the upstream self-hosting init script and creates the
-- databases expected by the API, tracing, and SuperTokens services.

\c postgres

SELECT 'CREATE ROLE username WITH LOGIN PASSWORD ''password'''
WHERE NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'username')\gexec

SELECT 'CREATE DATABASE agenta_oss_core'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'agenta_oss_core')\gexec

SELECT 'CREATE DATABASE agenta_oss_tracing'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'agenta_oss_tracing')\gexec

SELECT 'CREATE DATABASE agenta_oss_supertokens'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'agenta_oss_supertokens')\gexec

GRANT ALL PRIVILEGES ON DATABASE agenta_oss_core TO username;
GRANT ALL PRIVILEGES ON DATABASE agenta_oss_tracing TO username;
GRANT ALL PRIVILEGES ON DATABASE agenta_oss_supertokens TO username;

\c agenta_oss_core
GRANT ALL ON SCHEMA public TO username;

\c agenta_oss_tracing
GRANT ALL ON SCHEMA public TO username;

\c agenta_oss_supertokens
GRANT ALL ON SCHEMA public TO username;

\c postgres
