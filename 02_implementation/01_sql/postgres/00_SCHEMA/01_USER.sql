-- USUARIO DEL APLICATIVO
-- User: ab_core_us

CREATE USER ab_core_us WITH
  LOGIN
  ENCRYPTED PASSWORD 'ab_core_us'
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;