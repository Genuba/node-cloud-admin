CREATE TABLE ab_core_us.cl_tclient
(
	client_client serial NOT NULL,    -- Identificador unico de la tabla de cliente
	client_ident varchar(50) NOT NULL,    -- numero de identificacion del cliente
	client_fname varchar(50) NOT NULL,    -- nombre de la persona cliente.
	client_lname varchar(50) NOT NULL,    -- apellido de la persona cliente.
	client_mora money NOT NULL,    -- saldo en mora del cliente
	client_state varchar(10) NOT NULL DEFAULT 'activo',
	company_company integer NOT NULL
)
;

ALTER TABLE ab_core_us.cl_tclient ADD CONSTRAINT pk_cl_tclient
	PRIMARY KEY (client_client)
;

CREATE INDEX ixfk_cl_tclient_au_tcompany ON ab_core_us.cl_tclient (company_company ASC)
;

COMMENT ON TABLE ab_core_us.cl_tclient
	IS 'Tabla encargada de registras los datos de los clientes.'
;

COMMENT ON COLUMN ab_core_us.cl_tclient.client_client
	IS 'Identificador unico de la tabla de cliente'
;

COMMENT ON COLUMN ab_core_us.cl_tclient.client_ident
	IS 'numero de identificacion del cliente'
;

COMMENT ON COLUMN ab_core_us.cl_tclient.client_fname
	IS 'nombre de la persona cliente.'
;

COMMENT ON COLUMN ab_core_us.cl_tclient.client_lname
	IS 'apellido de la persona cliente.'
;

COMMENT ON COLUMN ab_core_us.cl_tclient.client_mora
	IS 'saldo en mora del cliente'
;