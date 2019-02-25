-- INSTRUCCIONES
-- REEMPLAZAR EL TEXTO _ab_core_ CON EL NOMBRE DEL PROYECTO

-- ********************  NOTA IMPORTANTE!!!!  ***********************
-- *                                                                *
-- *  POR FAVOR ENVIAR LOS LOGS DE EJECUCION DE ESTE SCRIPT (.LST)  *
-- *  PARA EFECTOS DE VERIFICACION DEL CAMBIO                       *
-- *                                                                *
-- *                                                                *
-- *                     ABSTRACT Inc                               *
-- *                                                                *
-- *                                                                *
-- ******************************************************************

-- SETUP
\i SETUP.sql

-- SCRIPTS
-- CORRIENDO SCRIPTS
-- ==================================================================
-- @INSTALL_SCHEMA.sql
\i INSTALL_SCHEMA.sql

-- CORRIENDO SCRIPTS
-- ==================================================================
-- @INSTALL_OBJECTS.sql
\i INSTALL_OBJECTS.sql

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA ab_core_us TO ab_core_us;
GRANT ALL PRIVILEGES ON ALL SEQUENCES  IN SCHEMA ab_core_us TO ab_core_us;

-- Si la ejecución del script no presenta ningún problema por favor haga
-- COMMIT, de lo contrario haga ROLLBACK y comuniquese con ABSTRACT Inc
--
-- ********************  NOTA IMPORTANTE!!!!  ***********************
-- *                                                                *
-- *  POR FAVOR ENVIAR EL LOG DE EJECUCION DE ESTE SCRIPT (*.LST)   *
-- *  PARA EFECTOS DE VERIFICACION DEL CAMBIO                       *
-- *  AL CORREO proyectos@ABSTRACT.CO                               *
-- *                                                                *
-- *                        ABSTRACT S.A.S                          *
-- *                                                                *
-- ******************************************************************
