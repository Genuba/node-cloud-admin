--DESINSTALADOR GENERAL

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'AB_CORE' -- ← change this to your DB
  AND pid <> pg_backend_pid();

/* Drop Tables */

DROP TABLE IF EXISTS ab_core_us.ACU_TAQUE CASCADE
;

DROP TABLE IF EXISTS ab_core_us.AU_ACCOUNT CASCADE
;

DROP TABLE IF EXISTS ab_core_us.AU_TCOMPANY CASCADE
;

DROP TABLE IF EXISTS ab_core_us.AU_TLOGIN CASCADE
;

DROP TABLE IF EXISTS ab_core_us.AU_TMEMBERSHIP CASCADE
;

DROP TABLE IF EXISTS ab_core_us.AU_TROL CASCADE
;

DROP TABLE IF EXISTS ab_core_us.AU_TUSER CASCADE
;

DROP TABLE IF EXISTS ab_core_us.CL_TCLIENT CASCADE
;

DROP TABLE IF EXISTS ab_core_us.CL_TRECEIPT CASCADE
;
  
DROP SCHEMA ab_core_us;

DROP DATABASE "AB_CORE";
DROP USER ab_core_us;
