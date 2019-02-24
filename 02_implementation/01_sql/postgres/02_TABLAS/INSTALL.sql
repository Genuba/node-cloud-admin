/* Create Tables */

CREATE TABLE ab_core_us.ACU_TAQUE
(
	AQUE_AQUE serial NOT NULL,    -- Identificador unico de la tabla de acueducto.
	AQUE_TMEASURE varchar(50) NOT NULL,    -- Unidad de medida equivalente a consumo
	AQUE_VALUE varchar(50) NOT NULL,    -- Valor consumo segun Unidad de medida
	COMPANY_COMPANY integer NOT NULL
)
;

CREATE TABLE ab_core_us.AU_ACCOUNT
(
	ACCOUNT_ACCOUNT serial NOT NULL,    -- Identificador unico de la tabla de cuenta
	ACCOUNT_NAME varchar(50) NOT NULL,    -- nombre de la cuenta
	ACCOUNT_DESC varchar(50) NOT NULL    -- decripcion del tipo de cuenta);
)
;

CREATE TABLE ab_core_us.AU_TCOMPANY
(
	COMPANY_COMPANY serial NOT NULL,    -- Identificador unico de la tabla de COMPANY
	COMPANY_IDENT varchar(50) NOT NULL,    -- numero de identificacion de la company
	COMPANY_NAME varchar(50) NOT NULL,    -- nombre de la company
	ACCOUNT_ACCOUNT integer NOT NULL
)
;

CREATE TABLE ab_core_us.AU_TLOGIN
(
	LOGIN_LOGIN serial NOT NULL,    -- Identificador unico de la tabla de logeo
	LOGIN_USERNAME varchar(50) NOT NULL,    -- nombre de usuario
	LOGIN_PASSWORD varchar(50) NOT NULL,    -- contrase�a de usuario
	USER_USER integer NOT NULL
)
;

CREATE TABLE ab_core_us.AU_TMEMBERSHIP
(
	MEMBERSHIP_MEMBERSHIP serial NOT NULL,    -- Identificador unico de la tabla de membresias
	MEMBERSHIP_EMAIL varchar(50) NOT NULL,    -- correo de la menbresia del usuario
	MEMBERSHIP_PHONE varchar(50) NOT NULL,    -- telefono asociado ala menbresia
	MENBERSHIP_STATE varchar(50) NULL,    -- estado del usuario activo/inactivo
	USER_USER integer NOT NULL,
	COMPANY_COMPANY integer NOT NULL,
	ROL_ROL integer NOT NULL
)
;

CREATE TABLE ab_core_us.AU_TROL
(
	ROL_ROL serial NOT NULL,    -- Identificador unico de la tabla de usuario
	ROL_NAME varchar(50) NOT NULL,    -- nombre del rol
	ROL_DESC varchar(50) NOT NULL    -- descripcion del rol);
)
;

CREATE TABLE ab_core_us.AU_TUSER
(
	USER_USER serial NOT NULL,    -- Identificador unico de la tabla de usuario
	USER_IDENT varchar(50) NOT NULL,    -- numero de identificacion del usuario
	USER_FNAME varchar(50) NOT NULL,    -- nombre de la persona
	USER_LNAME varchar(50) NOT NULL    -- apellido de la persona);
)
;

CREATE TABLE ab_core_us.CL_TCLIENT
(
	CLIENT_CLIENT serial NOT NULL,    -- Identificador unico de la tabla de cliente
	CLIENT_IDENT varchar(50) NOT NULL,    -- numero de identificacion del cliente
	CLIENT_FNAME varchar(50) NOT NULL,    -- nombre de la persona cliente.
	CLIENT_LNAME varchar(50) NOT NULL,    -- apellido de la persona cliente.
	CLIENT_MORA varchar(50) NULL,
	CLIENT_STATE varchar(50) NULL,
	COMPANY_COMPANY integer NOT NULL
)
;

CREATE TABLE ab_core_us.CL_TRECEIPT
(
	RECEIPT_RECEIPT serial NOT NULL,    -- Identificador unico de la tabla de recibos
	RECEIPT_VALUE varchar(50) NOT NULL,    -- valor del recibo.
	RECEIPT_DATE varchar(50) NOT NULL,    -- fecha de recibo
	RECEIPT_LASTC varchar(50) NULL,    -- ultima lectura de consumo en unidad de medida
	RECEIPT_PASC varchar(50) NULL,    -- Lectura anterior de consumo segun unidad de medida.
	RECEIPT_STATE varchar(50) NOT NULL,    -- estado del recibo
	CLIENT_CLIENT integer NOT NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE ab_core_us.ACU_TAQUE ADD CONSTRAINT PK_ACU_TAQUE
	PRIMARY KEY (AQUE_AQUE)
;

CREATE INDEX IXFK_ACU_TAQUE_AU_TCOMPANY ON ab_core_us.ACU_TAQUE (COMPANY_COMPANY ASC)
;

ALTER TABLE ab_core_us.AU_ACCOUNT ADD CONSTRAINT PK_AU_TACCOUNT
	PRIMARY KEY (ACCOUNT_ACCOUNT)
;

ALTER TABLE ab_core_us.AU_TCOMPANY ADD CONSTRAINT PK_AU_TCOMPANY
	PRIMARY KEY (COMPANY_COMPANY)
;

CREATE INDEX IXFK_AU_TCOMPANY_AU_TACCOUNT ON ab_core_us.AU_TCOMPANY (ACCOUNT_ACCOUNT ASC)
;

ALTER TABLE ab_core_us.AU_TLOGIN ADD CONSTRAINT PK_AU_TLOGIN
	PRIMARY KEY (LOGIN_LOGIN)
;

CREATE INDEX IXFK_AU_TLOGIN_US_USER ON ab_core_us.AU_TLOGIN (USER_USER ASC)
;

ALTER TABLE ab_core_us.AU_TMEMBERSHIP ADD CONSTRAINT PK_AU_TMEMBERSHIP
	PRIMARY KEY (MEMBERSHIP_MEMBERSHIP)
;

CREATE INDEX IXFK_AU_TMEMBERSHIP_AU_COMPANY ON ab_core_us.AU_TMEMBERSHIP (COMPANY_COMPANY ASC)
;

CREATE INDEX IXFK_AU_TMEMBERSHIP_AU_TROL ON ab_core_us.AU_TMEMBERSHIP (ROL_ROL ASC)
;

CREATE INDEX IXFK_AU_TMEMBERSHIP_AU_USER ON ab_core_us.AU_TMEMBERSHIP (USER_USER ASC)
;

ALTER TABLE ab_core_us.AU_TROL ADD CONSTRAINT PK_AU_TROL
	PRIMARY KEY (ROL_ROL)
;

ALTER TABLE ab_core_us.AU_TUSER ADD CONSTRAINT PK_AU_TUSER
	PRIMARY KEY (USER_USER)
;

ALTER TABLE ab_core_us.CL_TCLIENT ADD CONSTRAINT PK_CL_TCLIENT
	PRIMARY KEY (CLIENT_CLIENT)
;

CREATE INDEX IXFK_CL_TCLIENT_AU_TCOMPANY ON ab_core_us.CL_TCLIENT (COMPANY_COMPANY ASC)
;

ALTER TABLE ab_core_us.CL_TRECEIPT ADD CONSTRAINT PK_CL_TRECEIPT
	PRIMARY KEY (RECEIPT_RECEIPT)
;

CREATE INDEX IXFK_CL_TRECEIPT_CL_TCLIENT ON ab_core_us.CL_TRECEIPT (CLIENT_CLIENT ASC)
;

/* Create Table Comments, Sequences for Autonumber Columns */

COMMENT ON TABLE ab_core_us.ACU_TAQUE
	IS 'Tabla encargada de registras los datos del acueducto.'
;

COMMENT ON COLUMN ab_core_us.ACU_TAQUE.AQUE_AQUE
	IS 'Identificador unico de la tabla de acueducto.'
;

COMMENT ON COLUMN ab_core_us.ACU_TAQUE.AQUE_TMEASURE
	IS 'Unidad de medida equivalente a consumo'
;

COMMENT ON COLUMN ab_core_us.ACU_TAQUE.AQUE_VALUE
	IS 'Valor consumo segun Unidad de medida'
;

 

 

COMMENT ON TABLE ab_core_us.AU_ACCOUNT
	IS 'Tabla encargada de registras los datos de las cuentas.'
;

COMMENT ON COLUMN ab_core_us.AU_ACCOUNT.ACCOUNT_ACCOUNT
	IS 'Identificador unico de la tabla de cuenta'
;

COMMENT ON COLUMN ab_core_us.AU_ACCOUNT.ACCOUNT_NAME
	IS 'nombre de la cuenta'
;

COMMENT ON COLUMN ab_core_us.AU_ACCOUNT.ACCOUNT_DESC
	IS 'decripcion del tipo de cuenta'
;

 

COMMENT ON TABLE ab_core_us.AU_TCOMPANY
	IS 'Tabla encargada de registras los datos de la company o asociacion.'
;

COMMENT ON COLUMN ab_core_us.AU_TCOMPANY.COMPANY_COMPANY
	IS 'Identificador unico de la tabla de COMPANY'
;

COMMENT ON COLUMN ab_core_us.AU_TCOMPANY.COMPANY_IDENT
	IS 'numero de identificacion de la company'
;

COMMENT ON COLUMN ab_core_us.AU_TCOMPANY.COMPANY_NAME
	IS 'nombre de la company'
;

 

 

COMMENT ON TABLE ab_core_us.AU_TLOGIN
	IS 'Tabla encargada de registras los datos de logeo de los usuarios.'
;

COMMENT ON COLUMN ab_core_us.AU_TLOGIN.LOGIN_LOGIN
	IS 'Identificador unico de la tabla de logeo'
;

COMMENT ON COLUMN ab_core_us.AU_TLOGIN.LOGIN_USERNAME
	IS 'nombre de usuario'
;

COMMENT ON COLUMN ab_core_us.AU_TLOGIN.LOGIN_PASSWORD
	IS 'contrase�a de usuario'
;

 

 

COMMENT ON TABLE ab_core_us.AU_TMEMBERSHIP
	IS 'Tabla encargada de registras la menbresia del usuario.'
;

COMMENT ON COLUMN ab_core_us.AU_TMEMBERSHIP.MEMBERSHIP_MEMBERSHIP
	IS 'Identificador unico de la tabla de membresias'
;

COMMENT ON COLUMN ab_core_us.AU_TMEMBERSHIP.MEMBERSHIP_EMAIL
	IS 'correo de la menbresia del usuario'
;

COMMENT ON COLUMN ab_core_us.AU_TMEMBERSHIP.MEMBERSHIP_PHONE
	IS 'telefono asociado ala menbresia'
;

COMMENT ON COLUMN ab_core_us.AU_TMEMBERSHIP.MENBERSHIP_STATE
	IS 'estado del usuario activo/inactivo'
;

 

 

 

 

COMMENT ON TABLE ab_core_us.AU_TROL
	IS 'Tabla encargada de registras los datos de los roles.'
;

COMMENT ON COLUMN ab_core_us.AU_TROL.ROL_ROL
	IS 'Identificador unico de la tabla de usuario'
;

COMMENT ON COLUMN ab_core_us.AU_TROL.ROL_NAME
	IS 'nombre del rol'
;

COMMENT ON COLUMN ab_core_us.AU_TROL.ROL_DESC
	IS 'descripcion del rol'
;

 

COMMENT ON TABLE ab_core_us.AU_TUSER
	IS 'Tabla encargada de registras los datos de los usuarios.'
;

COMMENT ON COLUMN ab_core_us.AU_TUSER.USER_USER
	IS 'Identificador unico de la tabla de usuario'
;

COMMENT ON COLUMN ab_core_us.AU_TUSER.USER_IDENT
	IS 'numero de identificacion del usuario'
;

COMMENT ON COLUMN ab_core_us.AU_TUSER.USER_FNAME
	IS 'nombre de la persona'
;

COMMENT ON COLUMN ab_core_us.AU_TUSER.USER_LNAME
	IS 'apellido de la persona'
;

 

COMMENT ON TABLE ab_core_us.CL_TCLIENT
	IS 'Tabla encargada de registras los datos de los clientes.'
;

COMMENT ON COLUMN ab_core_us.CL_TCLIENT.CLIENT_CLIENT
	IS 'Identificador unico de la tabla de cliente'
;

COMMENT ON COLUMN ab_core_us.CL_TCLIENT.CLIENT_IDENT
	IS 'numero de identificacion del cliente'
;

COMMENT ON COLUMN ab_core_us.CL_TCLIENT.CLIENT_FNAME
	IS 'nombre de la persona cliente.'
;

COMMENT ON COLUMN ab_core_us.CL_TCLIENT.CLIENT_LNAME
	IS 'apellido de la persona cliente.'
;

 

 

COMMENT ON TABLE ab_core_us.CL_TRECEIPT
	IS 'Tabla encargada de registras los datos de los recibos creados.'
;

COMMENT ON COLUMN ab_core_us.CL_TRECEIPT.RECEIPT_RECEIPT
	IS 'Identificador unico de la tabla de recibos'
;

COMMENT ON COLUMN ab_core_us.CL_TRECEIPT.RECEIPT_VALUE
	IS 'valor del recibo.'
;

COMMENT ON COLUMN ab_core_us.CL_TRECEIPT.RECEIPT_DATE
	IS 'fecha de recibo'
;

COMMENT ON COLUMN ab_core_us.CL_TRECEIPT.RECEIPT_LASTC
	IS 'ultima lectura de consumo en unidad de medida'
;

COMMENT ON COLUMN ab_core_us.CL_TRECEIPT.RECEIPT_PASC
	IS 'Lectura anterior de consumo segun unidad de medida.'
;

COMMENT ON COLUMN ab_core_us.CL_TRECEIPT.RECEIPT_STATE
	IS 'estado del recibo'
;