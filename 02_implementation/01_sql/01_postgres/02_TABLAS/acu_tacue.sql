CREATE TABLE ab_core_us.acu_tacue
(
	acue_acue serial NOT NULL,    -- Identificador unico de la tabla de acueducto.
	acue_tmeasure varchar(50) NOT NULL,    -- Unidad de medida equivalente a consumo
	acue_value varchar(50) NOT NULL,    -- Valor consumo segun Unidad de medida
	company_company integer NOT NULL
)
;

ALTER TABLE ab_core_us.acu_tacue ADD CONSTRAINT pk_acu_tacue
	PRIMARY KEY (acue_acue)
;

CREATE INDEX ixfk_acu_tacue_au_tcompany ON ab_core_us.acu_tacue (company_company ASC)
;

COMMENT ON TABLE ab_core_us.acu_tacue
	IS 'Tabla encargada de registras los datos del acueducto.'
;

COMMENT ON COLUMN ab_core_us.acu_tacue.acue_acue
	IS 'Identificador unico de la tabla de acueducto.'
;

COMMENT ON COLUMN ab_core_us.acu_tacue.acue_tmeasure
	IS 'Unidad de medida equivalente a consumo'
;

COMMENT ON COLUMN ab_core_us.acu_tacue.acue_value
	IS 'Valor consumo segun Unidad de medida'
;