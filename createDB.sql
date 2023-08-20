-- ================ DROP ================
drop table if exists generos;
drop table if exists estudiantes;
drop table if exists periodos;
drop table if exists rango_edades;
drop table if exists regiones;
drop table if exists provincias;
drop table if exists comunas;
drop table if exists tipo_instituciones;
drop table if exists instituciones;
drop table if exists areas_cinef97;
drop table if exists subareas_cinef97;
drop table if exists areas_cinef93;
drop table if exists subareas_cinef93;
drop table if exists niveles_globales;
drop table if exists niveles_carreras1;
drop table if exists niveles_carreras2;
drop table if exists jornadas;
drop table if exists modalidades;
drop table if exists areas_unesco;
drop table if exists areas_genericas;
drop table if exists tipos_planes;
drop table if exists sedes;
drop table if exists carreras;
drop table if exists versiones_carreras;
drop table if exists titulaciones;

drop sequence if exists seq_generos;
drop sequence if exists seq_regiones;
drop sequence if exists seq_provincias;
drop sequence if exists seq_comunas;
drop sequence if exists seq_tipo_instituciones;
drop sequence if exists seq_areas_cinef97;
drop sequence if exists seq_subareas_cinef97;
drop sequence if exists seq_areas_cinef93;
drop sequence if exists seq_subareas_cinef93;
drop sequence if exists seq_niveles_globales;
drop sequence if exists seq_niveles_carreras1;
drop sequence if exists seq_niveles_carreras2;
drop sequence if exists seq_jornadas;
drop sequence if exists seq_modalidades;
drop sequence if exists seq_areas_unesco;
drop sequence if exists seq_areas_genericas;
drop sequence if exists seq_tiposplanes;
drop sequence if exists seq_version_carrera;


-- =================== GENEROS =================
create sequence seq_generos;
create table generos(
	id int default nextval('seq_generos'),
	genero VARCHAR(30),
	constraint pk_id_genero primary key (id)
);

-- ================== ESTUDIANTES =================
create table estudiantes(
	mrut bigint,
	genero int,
	fecha_nac date,
	edad_tit int,
	constraint pk_id_estudiante primary key (mrut),
	constraint fk_genero_estudiante foreign key (genero) 
									references generos(id) 
									on delete set null 
									on update cascade
);


-- ================= PERIODOS =================
create table periodos(
	cat_periodo int,
	constraint pk_cat_periodo primary key (cat_periodo)
);

-- ================ RANGO EDADES ==============
CREATE TABLE rango_edades(
	inicial int,
	final int,
	rango_edad varchar(40),
	constraint pk_inicial_rango primary key (inicial)
);

-- ================= REGIONES =================
create sequence seq_regiones;
create table regiones(
	id int default nextval('seq_regiones'),
	region varchar(20),
	constraint pk_id_region primary key (id),
);

-- ================ PROVINCIAS =================
create sequence seq_provincias;
create table provincias(
	id int default nextval('seq_provincias'),
	region int not null,
	provincia varchar(20),
	constraint pk_id_provincia primary key (id),
	constraint fk_region_provincia foreign key (region) 
									references regiones(id)
									on delete no action
									on update cascade
);

-- ================ COMUNAS =================
create sequence seq_comunas;
create table comunas(
	id int default nextval('seq_comunas'),
	provincia int not null,
	comuna varchar(100),
	constraint pk_id_comuna primary key (id),
	constraint fk_provincia_comuna foreign key (provincia)
									references provincias(id)
									on delete no action
									on update cascade
);

-- ============= TIPO INSTITUCIONES ==========
create sequence seq_tipo_instituciones;
create table tipo_instituciones(
	id int default nextval('seq_tipo_instituciones'),
	tipo_intitucion varchar(100),
	id_tipo_institucion int,
	constraint pk_id_tipoinstitucion primary key (id),
	constraint fk_id_tipoinstitucion foreign key (id_tipo_institucion)
									references tipo_instituciones(id)
									on delete no action
									on update cascade
);

-- =============== INSTITUCIONES ==============
create table instituciones(
	cod_inst int,
	nombre varchar(100),
	tipo_institucion int not null,
	constraint pk_cod_inst primary key (cod_inst),
	constraint fk_tipo_institucion foreign key (tipo_institucion)
									references tipo_instituciones(id)
									on delete no action
									on update cascade
);

-- ================ AREA CINE F97 ============
create sequence seq_areas_cinef97;
create table areas_cinef97(
	id int default nextval('seq_areas_cinef97'),
	area_cinef97 varchar(100),
	constraint pk_id_areascinef97 primary key (id)
);
-- ============= SUBAREA CINE F97 =============
create sequence seq_subareas_cinef97;
create table subareas_cinef97(
	id int default nextval('seq_subareas_cinef97'),
	subarea_cinef97 varchar(100),
	area_cinef97 int not null,
	constraint pk_subarea_cinef97 primary key (id),
	constraint fk_area_cinef97 foreign key (area_cinef97)
								references area_cinef97(id)
								on delete no action
								on update cascade
);

-- ================ AREA CINE F93 ============
create sequence seq_areas_cinef93;
create table areas_cinef93(
	id int default nextval('seq_areas_cinef93'),
	area_cinef93 varchar(100),
	constraint pk_id_areascinef93 primary key
);
-- ============= SUBAREA CINE F93 =============
create sequence seq_subareas_cinef93;
create table subareas_cinef93(
	id int default nextval('seq_subareas_cinef93'),
	subarea_cinef93 varchar(100),
	area_cinef93 int not null,
	constraint pk_subarea_cinef93 primary key (id),
	constraint fk_area_cinef93 foreign key (area_cinef93)
								references area_cinef93(id)
								on delete no action
								on update cascade
);

-- ============== NIVELES GLOBALES ============
create sequence seq_niveles_globales;
create table niveles_globales(
	id int default nextval('seq_niveles_globales'),
	nivelglobal varchar(100),
	constraint pk_nivel_global primary key (id)
);
-- ============== NIVELES CARRERA 1 ===========
create sequence seq_niveles_carreras1;
create table niveles_carreras1(
	id int default nextval('seq_niveles_carreras1'),
	nivel_global int not null,
	nivel_carrera1 varchar(50),
	constraint pk_nivel_carrera1 primary key (id),
	constraint fk_nivel_global foreign key (nivel_global)
								references niveles_globales(id)
								on delete no action
								on update cascade
);
-- ============== NIVELES CARRERA 2 ===========
create sequence seq_niveles_carreras2;
create table niveles_carreras2(
	id int default nextval('seq_niveles_carreras2'),
	nivel_global int not null,
	nivel_carrera2 varchar(50),
	constraint pk_nivel_carrera2 primary key (id),
	constraint fk_nivel_global foreign key (nivel_global)
								references niveles_globales(id)
								on delete no action
								on update cascade
);

-- ================= JORNADAS ================
create sequence seq_jornadas;
create table jornadas(
	id int,
	nombre VARCHAR(50),
	constraint pk_jornada primary key (id)
);

-- ================ MODALIDAD ================
create sequence seq_modalidades;
create table modalidades(
	id int,
	nombre VARCHAR(50),
	constraint pk_modalidad primary key (id)
);

-- ================ AREA UNESCO ================
create sequence seq_areas_unesco;
create table areas_unesco(
	id int,
	nombre VARCHAR(50),
	constraint pk_area_unesco primary key (id)
);

-- ================ AREA GENERICA ================
create sequence seq_areas_genericas;
create table areas_genericas(
	id int,
	nombre VARCHAR(100),
	constraint pk_area_generica primary key (id)
);

-- ================ TIPOS PLAN ================
create sequence seq_tiposplanes;
create table tipos_planes(
	id int,
	nombre VARCHAR(50),
	constraint pk_tipoplan primary key (id)
);

-- ================== SEDES ==================
create table sedes(
	cod_inst int,
	cod_sede int,
	nombre varchar(100),
	comuna int,
	constraint pk_sede primary key (cod_inst, cod_sede),
	constraint fk_comuna_sede foreign key (comuna)
							references comunas(id)
							on delete no action
							on update cascade
);

-- ================= CARRERAS =================
create table carreras(
	cod_unico varchar(20),
	cod_carrera int,
	nombre varchar(100),
	institucion int ,
	sede int,
	nivel1 int,
	nivel2 int,
	jornada int,
	modalidad int,
	area_generica int,
	area_unesco int,
	subarea_f97 int,
	tipo_plan int,
	subarea_f93 int,
	constraint pk_cod_unicocarrera primary key (cod_unico),
	constraint fk_institucion_carrera foreign key (institucion)
										references instituciones(id)
										on delete no action
										on update cascade,
	constraint fk_sede_carrera foreign key (sede)
										references sedes(id)
										on delete no action
										on update cascade,
	constraint fk_nivel1_carrera foreign key (nivel1)
										references nivel_carrera1(id)
										on delete no action
										on update cascade,
	constraint fk_nivel2_carrera foreign key (nivel2)
										references nivel_carrera2(id)
										on delete no action
										on update cascade,
	constraint fk_jornada_carrera foreign key (jornada)
										references jornadas(id)
										on delete no action
										on update cascade,
	constraint fk_modalidad_carrera foreign key (modalidad)
										references modalidades(id)
										on delete no action
										on update cascade,
	constraint fk_areagenerica_carrera foreign key (area_generica)
										references areas_genericas(id)
										on delete no action
										on update cascade,
	constraint fk_areaunesco_carrera foreign key (area_unesco)
										references areas_unesco(id)
										on delete no action
										on update cascade,
	constraint fk_subareacinef93_carrera foreign key (subarea_f93)
										references subareas_cinef93(id)
										on delete no action
										on update cascade,
	constraint fk_subareacinef97_carrera foreign key (subarea_f97)
										references subareas_cinef97(id)
										on delete no action
										on update cascade,
	constraint fk_tipoplan_carrera foreign key (tipo_plan)
										references tipos_planes(id)
										on delete no action
										on update cascade									
); 

-- ================ VERSIONES CARRERAS =============
create sequence seq_version_carrera;
create table versiones_carreras(
	cod_carrera varchar(20),
	version int default nextval('seq_version_carrera'),
	dur_estudio int,
	dur_titulacion int,
	dur_total int,
	constraint pk_versioncarrera primary key (cod_carrera, version),
	constraint fk_codcarrera_versionescarrera foreign key (cod_carrera)
											references carreras(cod_unico)
											on delete no action
											on update cascade

);

-- =============== TITULACION =====================
create table titulaciones(
	estudiante bigint,
	carrera varchar(20),
	version int,
	anno_ing_orig int,
	sem_ing_orig int,
	anno_ing_actual int,
	sem_ing_actual int,
	fecha_obtencion int,
	constraint pk_titulacion primary key (estudiante, carrera),
	constraint fk_carrera_titulacion foreign key (carrera, version)
									references versiones_carreras(cod_carrera, version)
									on delete no action
									on update cascade,
	constraint fk_estudiante_titulacion foreign key (estudiante)
									references estudiantes(mrut)
									on delete no action
									on update cascade
);