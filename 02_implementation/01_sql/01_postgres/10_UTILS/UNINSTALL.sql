--DESINSTALADOR GENERAL

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'ab_core' -- ← change this to your DB
  AND pid <> pg_backend_pid();

/*Drop Schema*/  
DROP SCHEMA ab_core_us;

DROP DATABASE "ab_core";
DROP USER ab_core_us;
