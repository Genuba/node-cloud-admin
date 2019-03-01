CREATE TABLE ab_core_us.au_trol
(
	rol_rol serial NOT NULL,    -- Identificador unico de la tabla de usuario
	rol_name varchar(50) NOT NULL,    -- nombre del rol
	rol_desc text NOT NULL    -- descripcion del rol
)
;

ALTER TABLE ab_core_us.au_trol ADD CONSTRAINT pk_au_trol
	PRIMARY KEY (rol_rol)
;

COMMENT ON TABLE ab_core_us.au_trol
	IS 'Tabla encargada de registras los datos de los roles.'
;

COMMENT ON COLUMN ab_core_us.au_trol.rol_rol
	IS 'Identificador unico de la tabla de usuario'
;

COMMENT ON COLUMN ab_core_us.au_trol.rol_name
	IS 'nombre del rol'
;

COMMENT ON COLUMN ab_core_us.au_trol.rol_desc
	IS 'descripcion del rol'
;
