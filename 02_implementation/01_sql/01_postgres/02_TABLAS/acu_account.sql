CREATE TABLE ab_core_us.acu_account
(
	account_account serial NOT NULL,    -- Identificador unico de la tabla de cuenta
	account_name varchar(50) NOT NULL,    -- nombre de la cuenta
	account_desc text NOT NULL    -- decripcion del tipo de cuenta
)
;

ALTER TABLE ab_core_us.acu_account ADD CONSTRAINT pk_acu_taccount
	PRIMARY KEY (account_account)
;

COMMENT ON TABLE ab_core_us.acu_account
	IS 'Tabla encargada de registras los datos de las cuentas.'
;

COMMENT ON COLUMN ab_core_us.acu_account.account_account
	IS 'Identificador unico de la tabla de cuenta'
;

COMMENT ON COLUMN ab_core_us.acu_account.account_name
	IS 'nombre de la cuenta'
;

COMMENT ON COLUMN ab_core_us.acu_account.account_desc
	IS 'decripcion del tipo de cuenta'
;