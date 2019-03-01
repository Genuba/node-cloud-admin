/* Drop Sequences */

DROP SEQUENCE  IF EXISTS  ab_core_us.acu_account_account_account_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.acu_tacue_acue_acue_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.acu_taque_aque_aque_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.acu_tcompany_company_company_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.au_tlogin_login_login_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.au_tmembership_membership_membership_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.au_trol_rol_rol_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.au_tuser_user_user_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.cl_tclient_client_client_seq  CASCADE
;

DROP SEQUENCE  IF EXISTS  ab_core_us.cl_treceipt_receipt_receipt_seq  CASCADE
;


/* Drop Tables */

DROP TABLE IF EXISTS ab_core_us.acu_account CASCADE
;

DROP TABLE IF EXISTS ab_core_us.acu_tacue CASCADE
;

DROP TABLE IF EXISTS ab_core_us.acu_tcompany CASCADE
;

DROP TABLE IF EXISTS ab_core_us.au_tlogin CASCADE
;

DROP TABLE IF EXISTS ab_core_us.au_tmembership CASCADE
;

DROP TABLE IF EXISTS ab_core_us.au_trol CASCADE
;

DROP TABLE IF EXISTS ab_core_us.au_tuser CASCADE
;

DROP TABLE IF EXISTS ab_core_us.cl_tclient CASCADE
;

DROP TABLE IF EXISTS ab_core_us.cl_tconsum CASCADE
;

DROP TABLE IF EXISTS ab_core_us.cl_treceipt CASCADE
;

--DESINSTALADOR GENERAL

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'ab_core' -- ← change this to your DB
  AND pid <> pg_backend_pid();

/*Drop Schema*/  
DROP SCHEMA ab_core_us;

DROP DATABASE "ab_core";
DROP USER ab_core_us;
