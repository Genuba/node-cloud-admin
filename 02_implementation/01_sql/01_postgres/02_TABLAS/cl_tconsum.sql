CREATE TABLE ab_core_us.cl_tconsum
(
	consum_consum serial NOT NULL,    -- Identificador unico de la tabla de usuario
	consum_cant varchar(50) NOT NULL,    -- cantidad de consumo segun unidad de medida.
	consum_date varchar(50) NOT NULL,    -- fecha de registro del consumo.
	consum_state varchar(50) NOT NULL,    -- estado del consumo activo/inactivo.
	client_client integer NOT NULL
)
;

ALTER TABLE ab_core_us.cl_tconsum ADD CONSTRAINT PK_cl_tconsum
	PRIMARY KEY (consum_consum)
;

CREATE INDEX IXFK_cl_tconsum_cl_tclient ON ab_core_us.cl_tconsum (client_client ASC)
;

COMMENT ON TABLE ab_core_us.cl_tconsum
	IS 'Tabla encargada de registras el consumo de los clientes'
;

COMMENT ON COLUMN ab_core_us.cl_tconsum.consum_consum
	IS 'Identificador unico de la tabla de usuario'
;

COMMENT ON COLUMN ab_core_us.cl_tconsum.consum_cant
	IS 'cantidad de consumo segun unidad de medida.'
;

COMMENT ON COLUMN ab_core_us.cl_tconsum.consum_date
	IS 'fecha de registro del consumo.'
;

COMMENT ON COLUMN ab_core_us.cl_tconsum.consum_state
	IS 'estado del consumo activo/inactivo.'
;