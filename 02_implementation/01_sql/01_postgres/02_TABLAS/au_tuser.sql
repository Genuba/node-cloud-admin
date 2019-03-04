CREATE TABLE ab_core_us.au_tuser
(
	user_user serial NOT NULL,    -- Identificador unico de la tabla de usuario
	user_ident varchar(30) NOT NULL,    -- numero de identificacion del usuario
	user_fname varchar(30) NOT NULL,    -- nombre de la persona
	user_lname varchar(30) NOT NULL    -- apellido de la persona
)
;

ALTER TABLE ab_core_us.au_tuser ADD CONSTRAINT pk_au_tuser
	PRIMARY KEY (user_user)
;

COMMENT ON TABLE ab_core_us.au_tuser
	IS 'Tabla encargada de registras los datos de los usuarios.'
;

COMMENT ON COLUMN ab_core_us.au_tuser.user_user
	IS 'Identificador unico de la tabla de usuario'
;

COMMENT ON COLUMN ab_core_us.au_tuser.user_ident
	IS 'numero de identificacion del usuario'
;

COMMENT ON COLUMN ab_core_us.au_tuser.user_fname
	IS 'nombre de la persona'
;

COMMENT ON COLUMN ab_core_us.au_tuser.user_lname
	IS 'apellido de la persona'
;