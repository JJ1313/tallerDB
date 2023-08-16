-- ================= CREACION TABLAS & PK =====================
-- opcion 1	
create table tipos_planes(
	id int primary key,
	name varchar(100) not null
);

-- opcion 2
create table tipos_planes(
	id int,
	name varchar(100)
	constraint pk_tipoPlanes primary key (id)
);

-- opcion 3 RECOMENDADO USAR ESTE
create sequence seq_tipos_planes; -- autoincremental, es el estandar.

create table tipos_planes(
	id int not null default nextval('seq_tipos_planes'), -- Apostrofe con comillas
	name varchar(100),
	constraint pk_tipoPlanes primary key
);

-- =================== FOREIGN KEY & CHECK =====================

create sequence seq_planes;
-- Tabla no del modelo, solo xa ejemplo
create table planes(
	id int not null default nextval('seq_planes'),
	name varchar(100) not null,
	check_ejemplo int not null,
	tipo_plan int not null,
	constraint chk_campocheck check (check_ejemplo) between 1 and 4,
	constraint fk_planes foreign key (tipo_plan) references tipos_planes(id) 
										on delete cascade 
										on delete no action -- restrict, otra alternativa  
);