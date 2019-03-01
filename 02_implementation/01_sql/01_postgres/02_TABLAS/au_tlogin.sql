CREATE TABLE ab_core_us.au_tlogin
(
	login_login serial NOT NULL,    -- Identificador unico de la tabla de logeo
	login_username varchar(50) NOT NULL,    -- nombre de usuario
	login_password varchar(50) NOT NULL,    -- password de usuario
	user_user integer NOT NULL
)
;

ALTER TABLE ab_core_us.au_tlogin ADD CONSTRAINT pk_au_tlogin
	PRIMARY KEY (login_login)
;

CREATE INDEX ixfk_au_tlogin_au_user ON ab_core_us.au_tlogin (user_user ASC)
;

COMMENT ON TABLE ab_core_us.au_tlogin
	IS 'Tabla encargada de registras los datos de logeo de los usuarios.'
;

COMMENT ON COLUMN ab_core_us.au_tlogin.login_login
	IS 'Identificador unico de la tabla de logeo'
;

COMMENT ON COLUMN ab_core_us.au_tlogin.login_username
	IS 'nombre de usuario'
;

COMMENT ON COLUMN ab_core_us.au_tlogin.login_password
	IS 'password de usuario'
;