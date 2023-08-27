
CREATE SEQUENCE IF NOT EXISTS public.areas_carreras_genericas_id_areagenerica_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;
	
CREATE SEQUENCE IF NOT EXISTS public.areas_cinef_id_areacinef_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;
	
CREATE SEQUENCE IF NOT EXISTS public.areas_unesco_id_areaunesco_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;
	
CREATE SEQUENCE IF NOT EXISTS public.comunas_id_comuna_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;
	

CREATE SEQUENCE IF NOT EXISTS public.jornadas_id_jornada_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;
	
CREATE SEQUENCE IF NOT EXISTS public.modalidades_id_modalidad_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.niveles_carrera1_id_nivelcarrera1_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;


CREATE SEQUENCE IF NOT EXISTS public.niveles_carreras2_id_nivelcarrera2_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;


CREATE SEQUENCE IF NOT EXISTS public.niveles_globales_id_nivelglobal_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.provincias_id_provincia_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.seq_planes
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
	
CREATE SEQUENCE IF NOT EXISTS public.tipos_planes_id_tipo_plan_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.subareas_cinef_id_subareacinef93_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE SEQUENCE IF NOT EXISTS public.subareas_cinef_id_subareacinef_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;


CREATE TABLE IF NOT EXISTS public.areas_carreras_genericas
(
    id_areagenerica integer NOT NULL DEFAULT nextval('areas_carreras_genericas_id_areagenerica_seq'::regclass),
    areagenerica character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT areas_carreras_genericas_pkey PRIMARY KEY (id_areagenerica)
);

CREATE TABLE IF NOT EXISTS public.areas_cinef93
(
    id_areacinef integer NOT NULL DEFAULT nextval('areas_cinef_id_areacinef_seq'::regclass),
    areacinesf character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT areas_cinef93_pkey PRIMARY KEY (id_areacinef)
);

CREATE TABLE IF NOT EXISTS public.areas_cinef97
(
    id_areacinef integer NOT NULL DEFAULT nextval('areas_cinef_id_areacinef_seq'::regclass),
    areacinesf character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT areas_cinef_pkey PRIMARY KEY (id_areacinef)
);

CREATE TABLE IF NOT EXISTS public.areas_unesco
(
    id_areaunesco integer NOT NULL DEFAULT nextval('areas_unesco_id_areaunesco_seq'::regclass),
    areaunesco character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT areas_unesco_pkey PRIMARY KEY (id_areaunesco)
);

CREATE TABLE IF NOT EXISTS public.carreras
(
    codigo_unico character varying(20) COLLATE pg_catalog."default" NOT NULL,
    cod_carrera integer NOT NULL,
    nombrecarrera character varying(250) COLLATE pg_catalog."default" NOT NULL,
    institucion integer NOT NULL,
    sede integer NOT NULL,
    nivelcarrera1 integer NOT NULL,
    nivelcarrera2 integer NOT NULL,
    jornada integer NOT NULL,
    modalidad integer NOT NULL,
    areacarrgenerica integer NOT NULL,
    subareacinef97 integer,
    areaunesco integer,
    nivel_carrera1 integer,
    nivel_carrera2 integer NOT NULL,
    tipo_plan_carrera integer NOT NULL,
    subareacine93 integer NOT NULL,
    CONSTRAINT carreras_pkey PRIMARY KEY (codigo_unico)
);

CREATE TABLE IF NOT EXISTS public.carrerasversiones
(
    carrera character varying(20) COLLATE pg_catalog."default" NOT NULL,
    version integer NOT NULL,
    duracionestudio integer NOT NULL,
    duraciontitulacion integer NOT NULL,
    duraciontotal integer NOT NULL,
    CONSTRAINT carrerasversiones_pkey PRIMARY KEY (carrera, version)
);

CREATE TABLE IF NOT EXISTS public.comunas
(
    id_provincia integer NOT NULL,
    id_comuna integer NOT NULL DEFAULT nextval('comunas_id_comuna_seq'::regclass),
    comuna character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT comunas_pkey PRIMARY KEY (id_comuna)
);

CREATE TABLE IF NOT EXISTS public.estudiantes
(
    mrut bigint NOT NULL,
    gen_alu integer NOT NULL,
    fecha_nac_alu date NOT NULL,
    edad_tit_alumno integer NOT NULL ,
    CONSTRAINT estudiantes_pkey PRIMARY KEY (mrut),
    CONSTRAINT ck_edad_alumno check (edad_tit_alumno > 14)
);

CREATE TABLE IF NOT EXISTS public.generos
(
    id_genero integer NOT NULL,
    genero character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT generos_pkey PRIMARY KEY (id_genero)
);

CREATE TABLE IF NOT EXISTS public.imparten
(
    codigounico character varying(20) COLLATE pg_catalog."default" NOT NULL,
    version integer NOT NULL,
    sucursal integer NOT NULL,
    modalidad integer NOT NULL,
    institucion integer NOT NULL,
    CONSTRAINT imparten_pkey PRIMARY KEY (codigounico, version, sucursal, modalidad, institucion)
);

CREATE TABLE IF NOT EXISTS public.instituciones
(
    cod_inst integer NOT NULL,
    nomb_inst character varying(250) COLLATE pg_catalog."default" NOT NULL,
    tipo_institucion3 integer NOT NULL,
    CONSTRAINT instituciones_pkey PRIMARY KEY (cod_inst)
);

CREATE TABLE IF NOT EXISTS public.jornadas
(
    id_jornada integer NOT NULL DEFAULT nextval('jornadas_id_jornada_seq'::regclass),
    jornada character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT jornadas_pkey PRIMARY KEY (id_jornada)
);

CREATE TABLE IF NOT EXISTS public.modalidades
(
    id_modalidad integer NOT NULL DEFAULT nextval('modalidades_id_modalidad_seq'::regclass),
    modalidad character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT modalidades_pkey PRIMARY KEY (id_modalidad)
);

CREATE TABLE IF NOT EXISTS public.niveles_carreras1
(
    id_nivelglobal integer NOT NULL,
    id_nivelcarrera1 integer NOT NULL DEFAULT nextval('niveles_carrera1_id_nivelcarrera1_seq'::regclass),
    nivelcarrera1 character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT nivelcarrera1_pkey PRIMARY KEY (id_nivelcarrera1)
);

CREATE TABLE IF NOT EXISTS public.niveles_carreras2
(
    id_nivelglobal integer NOT NULL,
    id_nivelcarrera2 integer NOT NULL DEFAULT nextval('niveles_carreras2_id_nivelcarrera2_seq'::regclass),
    nivelcarrera2 integer NOT NULL,
    CONSTRAINT nivel_carrera2_pkey PRIMARY KEY (id_nivelcarrera2)
);

CREATE TABLE IF NOT EXISTS public.niveles_globales
(
    id_nivelglobal integer NOT NULL DEFAULT nextval('niveles_globales_id_nivelglobal_seq'::regclass),
    nivelglobal character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT niveles_globales_pkey PRIMARY KEY (id_nivelglobal)
);

CREATE TABLE IF NOT EXISTS public.periodos
(
    cat_periodo integer NOT NULL,
    CONSTRAINT periodos_pkey PRIMARY KEY (cat_periodo)
);

CREATE TABLE IF NOT EXISTS public.provincias
(
    id_region integer NOT NULL,
    id_provincia integer NOT NULL DEFAULT nextval('provincias_id_provincia_seq'::regclass),
    provincia character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT provincias_pkey PRIMARY KEY (id_provincia)
);

CREATE TABLE IF NOT EXISTS public.rango_edades
(
    edad_inicial integer NOT NULL,
    edad_final integer NOT NULL,
    rango_edad character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT rango_edades_pkey PRIMARY KEY (edad_inicial)
);

CREATE TABLE IF NOT EXISTS public.regiones
(
    id_region integer NOT NULL,
    region character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT regiones_pkey PRIMARY KEY (id_region)
);

CREATE TABLE IF NOT EXISTS public.sedes
(
    cod_inst integer NOT NULL,
    cod_sede integer NOT NULL,
    nomb_sede character varying(250) COLLATE pg_catalog."default",
    comuna integer NOT NULL,
    CONSTRAINT sedes_pkey PRIMARY KEY (cod_sede, cod_inst)
);

CREATE TABLE IF NOT EXISTS public.subareas_cinef93
(
    id_areacinef integer NOT NULL,
    id_subareacinef integer NOT NULL DEFAULT nextval('subareas_cinef_id_subareacinef93_seq'::regclass),
    subareacinef character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT subareacinef93_pkey PRIMARY KEY (id_subareacinef)
);

CREATE TABLE IF NOT EXISTS public.subareas_cinef97
(
    id_areacinef integer NOT NULL,
    id_subareacinef integer NOT NULL DEFAULT nextval('subareas_cinef_id_subareacinef_seq'::regclass),
    subareacinef character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT subareacinef97_pkey PRIMARY KEY (id_subareacinef)
);

CREATE TABLE IF NOT EXISTS public.tipos_instituciones
(
    id_tipo_institucion integer NOT NULL,
    tipo_institucion character varying(100) COLLATE pg_catalog."default" NOT NULL,
    id_tipo_inst_superior integer,
    CONSTRAINT tipos_instituciones_pkey PRIMARY KEY (id_tipo_institucion)
);

CREATE TABLE IF NOT EXISTS public.tipos_planes
(
    id_tipo_plan integer NOT NULL DEFAULT nextval('tipos_planes_id_tipo_plan_seq'::regclass),
    tipo_plan character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tipos_planes_pkey PRIMARY KEY (id_tipo_plan)
);


CREATE TABLE IF NOT EXISTS public.carrerastitulogrados
(
    carrera character varying(20)  NOT NULL,
    titulogrado char not null default 't',
    nombretitulogrado character varying(250)  NOT NULL,
    CONSTRAINT chk_tituloogrado check (titulogrado = 't' or titulogrado = 'g'),
    CONSTRAINT carrerastitulogrados_pkey PRIMARY KEY (carrera, titulogrado)
);


CREATE TABLE IF NOT EXISTS public.titulaciones
(
    alumno integer NOT NULL,
    carrera character varying(20) COLLATE pg_catalog."default" NOT NULL,
    titulogrado char not null,
    "ano_ingreso_Carr_orig" integer NOT NULL,
    sem_ing_carr_orig integer NOT NULL,
    ano_ing_carr_actual integer NOT NULL,
    sem_ing_carr_actual integer NOT NULL,
    fecha_obt_titulo integer NOT NULL,
    version integer NOT NULL,
    sede integer NOT NULL,
    institucion integer NOT NULL,
    modalidad integer NOT NULL,
    CONSTRAINT titulaciones_pkey PRIMARY KEY (alumno, carrera, titulogrado)
);



ALTER TABLE IF EXISTS public.carreras
    ADD CONSTRAINT fk_carrera_tipoplan FOREIGN KEY (tipo_plan_carrera)
    REFERENCES public.tipos_planes (id_tipo_plan) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.carreras
    ADD CONSTRAINT fk_carreras_arreascarrerasgenericas FOREIGN KEY (areacarrgenerica)
    REFERENCES public.areas_carreras_genericas (id_areagenerica) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.carreras
    ADD CONSTRAINT fk_carreras_arreasunesco FOREIGN KEY (areaunesco)
    REFERENCES public.areas_unesco (id_areaunesco) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.carreras
    ADD CONSTRAINT fk_carreras_jornadas FOREIGN KEY (jornada)
    REFERENCES public.jornadas (id_jornada) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.carreras
    ADD CONSTRAINT fk_carreras_modalidades FOREIGN KEY (modalidad)
    REFERENCES public.modalidades (id_modalidad) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.carreras
    ADD CONSTRAINT fk_carreras_nivel1 FOREIGN KEY (nivel_carrera1)
    REFERENCES public.niveles_carreras1 (id_nivelcarrera1) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.carreras
    ADD CONSTRAINT fk_carreras_nivel2 FOREIGN KEY (nivelcarrera2)
    REFERENCES public.niveles_carreras2 (id_nivelcarrera2) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.carreras
    ADD CONSTRAINT fk_carreras_sedes FOREIGN KEY (institucion, sede)
    REFERENCES public.sedes (cod_inst, cod_sede) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.carreras
    ADD CONSTRAINT fk_carreras_subareacinef93 FOREIGN KEY (subareacine93)
    REFERENCES public.subareas_cinef93 (id_subareacinef) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.carreras
    ADD CONSTRAINT fk_subareacinef FOREIGN KEY (subareacinef97)
    REFERENCES public.subareas_cinef97 (id_subareacinef) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.carrerasversiones
    ADD CONSTRAINT fk_carrerasversiones_carreras FOREIGN KEY (carrera)
    REFERENCES public.carreras (codigo_unico) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.comunas
    ADD CONSTRAINT fk_comunas_provincias FOREIGN KEY (id_provincia)
    REFERENCES public.provincias (id_provincia) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.estudiantes
    ADD CONSTRAINT fk_estudiantes_generos FOREIGN KEY (gen_alu)
    REFERENCES public.generos (id_genero) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.imparten
    ADD CONSTRAINT fk_imparten_carrerasversiones FOREIGN KEY (codigounico, version)
    REFERENCES public.carrerasversiones (carrera, version) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.imparten
    ADD CONSTRAINT fk_imparten_sedes FOREIGN KEY (institucion, sucursal)
    REFERENCES public.sedes (cod_inst, cod_sede) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.instituciones
    ADD CONSTRAINT fk_instituciones_tipoinstitucion FOREIGN KEY (tipo_institucion3)
    REFERENCES public.tipos_instituciones (id_tipo_institucion) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;



ALTER TABLE IF EXISTS public.niveles_carreras1
    ADD CONSTRAINT fk_nivelescarrera1_nivelesgenerales FOREIGN KEY (id_nivelglobal)
    REFERENCES public.niveles_globales (id_nivelglobal) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.niveles_carreras2
    ADD CONSTRAINT fk_nivelcarrera2_nivelglobal FOREIGN KEY (id_nivelglobal)
    REFERENCES public.niveles_globales (id_nivelglobal) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.provincias
    ADD CONSTRAINT fk_provincias_regiones FOREIGN KEY (id_region)
    REFERENCES public.regiones (id_region) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.sedes
    ADD CONSTRAINT fk_sedes_comunas FOREIGN KEY (comuna)
    REFERENCES public.comunas (id_comuna) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.sedes
    ADD CONSTRAINT fk_sedes_instituciones FOREIGN KEY (cod_inst)
    REFERENCES public.instituciones (cod_inst) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.subareas_cinef93
    ADD CONSTRAINT fk_subareacinef93_areascinef93 FOREIGN KEY (id_areacinef)
    REFERENCES public.areas_cinef93 (id_areacinef) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.subareas_cinef97
    ADD CONSTRAINT fk_subareacinef97_areascinef97 FOREIGN KEY (id_areacinef)
    REFERENCES public.areas_cinef97 (id_areacinef) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.tipos_instituciones
    ADD CONSTRAINT fk_tipoinstitucion_tipo_institucion FOREIGN KEY (id_tipo_inst_superior)
    REFERENCES public.tipos_instituciones (id_tipo_institucion) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public.carrerastitulogrados
    ADD CONSTRAINT fk_carrerastitulogrados_carreras FOREIGN KEY (carrera)
    REFERENCES public.carreras (codigo_unico) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.titulaciones
    ADD CONSTRAINT fk_titulaciones_alumnos FOREIGN KEY (alumno)
    REFERENCES public.estudiantes (mrut) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.titulaciones
    ADD CONSTRAINT fk_titulaciones_titulogrado FOREIGN KEY (carrera,titulogrado)
    REFERENCES public.carrerastitulogrados (carrera,titulogrado) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.titulaciones
    ADD CONSTRAINT fk_titulaciones_imparten FOREIGN KEY (carrera,version,sede,modalidad,institucion)
    REFERENCES public.imparten (codigounico,version,sucursal,modalidad,institucion) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


create table traspaso (
periodo varchar(10),
codigounico varchar(50),
rut varchar(25),
genero varchar(10), 
fechanacimiento varchar(10),
rangoedad varchar(50),
anoingresocarori varchar(5),
semestreingresocarori varchar(2),
anoingresocaract varchar(5),
semestreingresocaract varchar(2),
nombretitulo varchar(250),
nombregrado varchar(250),
fechaobtencion varchar(10),
tipoinstitucion1 varchar(150),
tipoinstitucion2 varchar(150),
tipoinstitucion3 varchar(150),
codigoinstitucion varchar(10),
nombreinstitucion varchar(250),
codigosede varchar(10),
nombresede varchar(250),
codigocarrera varchar(10),
nombrecarrera varchar(250),
nivelglobal varchar(150),
nivelcarrera1  varchar(150),
nivelcarrera2  varchar(150),
duracionestudio varchar(10),
duraciontitulacion varchar(10),
duraciontotal varchar(10),
region varchar(150),
provincia varchar(150),
comuna varchar(150),
jornada varchar(150),
modalidad varchar(150),
version varchar(10),
tipoplan varchar(100),
area_unesco verchar(250),
area_cinef97 verchar(250),
subarea_cinef97 verchar(250),
area_cinef13 verchar(250),
subarea_cinef13 verchar(250),
area_generica verchar(250)
);


commit;