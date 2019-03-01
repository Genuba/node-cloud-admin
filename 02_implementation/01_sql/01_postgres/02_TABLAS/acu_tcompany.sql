CREATE TABLE ab_core_us.acu_tcompany
(
	company_company serial NOT NULL,    -- Identificador unico de la tabla de COMPANY
	company_ident varchar(50) NOT NULL,    -- numero de identificacion de la company
	company_name varchar(50) NOT NULL,    -- nombre de la company
	account_account integer NOT NULL
)
;

ALTER TABLE ab_core_us.acu_tcompany ADD CONSTRAINT pk_acu_tcompany
	PRIMARY KEY (company_company)
;

CREATE INDEX ixfk_acu_tcompany_acu_taccount ON ab_core_us.acu_tcompany (account_account ASC)
;

COMMENT ON TABLE ab_core_us.acu_tcompany
	IS 'Tabla encargada de registras los datos de la company o asociacion.'
;

COMMENT ON COLUMN ab_core_us.acu_tcompany.company_company
	IS 'Identificador unico de la tabla de COMPANY'
;

COMMENT ON COLUMN ab_core_us.acu_tcompany.company_ident
	IS 'numero de identificacion de la company'
;

COMMENT ON COLUMN ab_core_us.acu_tcompany.company_name
	IS 'nombre de la company'
;