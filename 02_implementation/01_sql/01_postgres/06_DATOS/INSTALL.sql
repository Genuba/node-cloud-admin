-- \i 06_DATOS/01_GENERAL_AUTENTICACION/INSTALL.sql

-- au_trol
INSERT INTO ab_core_us.au_trol(
	rol_name, rol_desc)
	VALUES ('administrador', 'persona encargada de gestionar los usuarios');

INSERT INTO ab_core_us.au_trol(
	rol_name, rol_desc)
	VALUES ('tesorero', 'persona encargada de recibir los pagos de los recibos');

INSERT INTO ab_core_us.au_trol(
	rol_name, rol_desc)
	VALUES ('fontanero', 'persona encargada de tomar registro del agua');

-- acu_account
INSERT INTO ab_core_us.acu_account(
	 account_name, account_desc)
	VALUES ('pruebas', 'cuenta para la realizacion de pruebas');

-- acu_tcompany
INSERT INTO ab_core_us.acu_tcompany(
	company_ident, company_name, account_account)
	VALUES ('acu-por', 'porvenir', 1);

-- au_tuser
INSERT INTO ab_core_us.au_tuser(
	user_ident, user_fname, user_lname)
	VALUES ('1019143966', 'master', 'zen');

-- au_tlogin
INSERT INTO ab_core_us.au_tlogin(
	login_username, login_password, user_user)
	VALUES ('master zen', '123456', 1);

-- au_tmembership
INSERT INTO ab_core_us.au_tmembership(
	user_user, company_company, rol_rol)
	VALUES (1, 1, 1);