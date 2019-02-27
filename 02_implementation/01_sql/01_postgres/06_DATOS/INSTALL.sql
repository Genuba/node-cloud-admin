-- \i 06_DATOS/01_GENERAL_AUTENTICACION/INSTALL.sql

-- au_trol
INSERT INTO ab_core_us.au_trol(
	rol_rol, rol_name, rol_desc)
	VALUES (1, 'administrador', 'persona encargada de gestionar los usuarios');

INSERT INTO ab_core_us.au_trol(
	rol_rol, rol_name, rol_desc)
	VALUES (2, 'tesorero', 'persona encargada de recibir los pagos de los recibos');

INSERT INTO ab_core_us.au_trol(
	rol_rol, rol_name, rol_desc)
	VALUES (3, 'fontanero', 'persona encargada de tomar registro del agua');

-- acu_account
INSERT INTO ab_core_us.acu_account(
	account_account, account_name, account_desc)
	VALUES (1, 'pruebas', 'cuenta para la realizacion de pruebas');

-- acu_tcompany
INSERT INTO ab_core_us.acu_tcompany(
	company_company, company_ident, company_name, account_account)
	VALUES (1,'acu-por', 'porvenir', 1);

-- au_tuser
INSERT INTO ab_core_us.au_tuser(
	user_user, user_ident, user_fname, user_lname)
	VALUES (1, '1019143966', 'master', 'zen');

-- au_tlogin
INSERT INTO ab_core_us.au_tlogin(
	login_login, login_username, login_password, user_user)
	VALUES (1, 'master zen', '123456', 1);

-- au_tmembership
INSERT INTO ab_core_us.au_tmembership(
	membership_membership, membership_email, membership_phone, menbership_state, user_user, company_company, rol_rol)
	VALUES (1, 'daalpiva@gmail.com', '3107608595', 'active', 1, 1, 1);