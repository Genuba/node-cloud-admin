CREATE TABLE ab_core_us.cl_treceipt
(
	receipt_receipt serial NOT NULL,    -- Identificador unico de la tabla de recibos
	receipt_value money NOT NULL,    -- valor del recibo.
	receipt_date date NOT NULL DEFAULT CURRENT_DATE,    -- fecha de recibo
	receipt_lastc integer NOT NULL,    -- ultima lectura de consumo en unidad de medida
	receipt_pasc integer NOT NULL,    -- Lectura anterior de consumo segun unidad de medida.
	receipt_state varchar(10) NOT NULL DEFAULT 'activo',    -- estado del recibo
	client_client integer NOT NULL
)
;

ALTER TABLE ab_core_us.cl_treceipt ADD CONSTRAINT pk_cl_treceipt
	PRIMARY KEY (receipt_receipt)
;

CREATE INDEX ixfk_cl_treceipt_cl_tclient ON ab_core_us.cl_treceipt (client_client ASC)
;

COMMENT ON TABLE ab_core_us.cl_treceipt
	IS 'Tabla encargada de registras los datos de los recibos creados.'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_receipt
	IS 'Identificador unico de la tabla de recibos'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_value
	IS 'valor del recibo.'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_date
	IS 'fecha de recibo'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_lastc
	IS 'ultima lectura de consumo en unidad de medida'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_pasc
	IS 'Lectura anterior de consumo segun unidad de medida.'
;

COMMENT ON COLUMN ab_core_us.cl_treceipt.receipt_state
	IS 'estado del recibo'
;