CREATE TABLE ab_core_us.au_tmembership
(
	membership_membership serial NOT NULL,    -- Identificador unico de la tabla de membresias
	membership_cdate date NOT NULL DEFAULT CURRENT_DATE,   -- fecha de creacion de la membresia del usuario
	menbership_state varchar(10) NOT NULL DEFAULT 'activo',    -- estado del usuario activo/inactivo
	user_user integer NOT NULL,
	company_company integer NOT NULL,
	rol_rol integer NOT NULL
)
;

ALTER TABLE ab_core_us.au_tmembership ADD CONSTRAINT pk_au_tmembership
	PRIMARY KEY (membership_membership)
;

CREATE INDEX ixfk_au_tmembership_acu_company ON ab_core_us.au_tmembership (company_company ASC)
;

CREATE INDEX ixfk_au_tmembership_au_trol ON ab_core_us.au_tmembership (rol_rol ASC)
;

CREATE INDEX ixfk_au_tmembership_au_user ON ab_core_us.au_tmembership (user_user ASC)
;

COMMENT ON TABLE ab_core_us.au_tmembership
	IS 'Tabla encargada de registras la menbresia del usuario.'
;

COMMENT ON COLUMN ab_core_us.au_tmembership.membership_membership
	IS 'Identificador unico de la tabla de membresias'
;

COMMENT ON COLUMN ab_core_us.au_tmembership.membership_cdate
	IS 'fecha de creacion de la membresia del usuario'
;

COMMENT ON COLUMN ab_core_us.au_tmembership.menbership_state
	IS 'estado del usuario activo/inactivo'
;