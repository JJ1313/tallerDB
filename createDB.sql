-- ============= ISLAS ===============
CREATE TABLE periodos(
	cat_periodo INT PRIMARY KEY
);
CREATE TABLE rango_edades(
	inicial INT PRIMARY KEY,
	final INT,
	rango_edad VARCHAR(40)
);

-- =================== GENEROS =================
CREATE TABLE generos(
	id_genero INT PRIMARY KEY,
	genero VARCHAR(20)
);

-- ================== ESTUDIANTES =================
CREATE TABLE estudiantes(
	mrut BIGINT PRIMARY KEY,
	genero INT FOREIGN KEY,
	fecha_nac DATE,
	edad_tit INT
);

-- ================== TITULACIONES =================
CREATE TABLE titulaciones (
	alumno INT PRIMARY KEY,
	carrera VARCHAR(20) PRIMARY KEY,
	ano_ingreso_carr INT,
	sem_ing INT,
	ano_ing_actual INT,
	sem_ing_actual INT,
	fecha_obtencion INT,
	version INT FOREIGN KEY,
	sede INT FOREIGN KEY,
	institucion INT FOREIGN KEY,
	modalidad INT FOREIGN KEY
);

-- ================= CARRERAS =================
CREATE TABLE carreras(
	cod_unico VARCHAR(20) PRIMARY KEY,
	cod INT,
	nombre VARCHAR(100),
	institucion INT FOREIGN KEY,
	sede INT FOREIGN KEY,
	--nivel_global INT FOREIGN KEY,
	--nivel_1 INT FOREIGN KEY,
	--nivel_2 INT FOREIGN KEY,
	--jornada INT FOREIGN KEY,
	--modalidad INT FOREIGN KEY,
	--area_generica INT FOREIGN KEY,
	--area_unesco INT FOREIGN KEY,
	--area_F_97 INT FOREIGN KEY,
	--subarea_F_97 INT FOREIGN KEY,
	--tipo_plan INT FOREIGN KEY,
	--area_F_13 INT FOREIGN KEY,
	--subarea_F_13 INT FOREIGN KEY,
); 

CREATE TABLE tipos_plan(
	id INT PRIMARY KEY,
	nombre VARCHAR(50)
);

CREATE TABLE jornadas(
	id INT PRIMARY KEY,
	nombre VARCHAR(50),
);
CREATE TABLE modalidades(
	id INT PRIMARY KEY,
	nombre VARCHAR(50)
);
-- ==================== AREAS Y SUBAREAS =================
CREATE TABLE areas_genericas(
	id INT PRIMARY KEY,
	nombre VARCHAR(100)
);
CREATE TABLE areas_unesco(
	id INT PRIMARY KEY,
	nombre VARCHAR(50)
);
CREATE TABLE areas_f97(
	id INT PRIMARY KEY,
	nombre VARCHAR(100)
);
CREATE TABLE subareas_f97(
	id INT PRIMARY KEY,
	id_area INT FOREIGN KEY,
	nombre VARCHAR(100)
);
CREATE TABLE areas_f13(
	id INT PRIMARY KEY,
	nombre VARCHAR(100)
);
CREATE TABLE subareas_f13(
	id INT PRIMARY KEY,
	id_area INT FOREIGN KEY,
	nombre VARCHAR(100)
);
-- =================== NIVELES DE CARRERA ================
CREATE TABLE niveles_globales(
	id INT PRIMARY KEY,
	nombre VARCHAR(100)
);
CREATE TABLE niveles_carr_1(
	id INT PRIMARY KEY,
	id_global INT FOREIGN KEY,
	nombre VARCHAR(50)
);
CREATE TABLE niveles_carr_2(
	id INT PRIMARY KEY,
	id_global INT FOREIGN KEY,
	nombre VARCHAR(50)
);
-- ============== DONDE Y COMO SE IMPARTEN CARRERAS =======
CREATE TABLE imparten (
	id INT PRIMARY KEY
	cod_unico_carr VARCHAR(20) PRIMARY KEY,
	version INT PRIMARY KEY,
	sucursal INT PRIMARY KEY,
	modalidad INT PRIMARY KEY,
	institucion INT PRIMARY KEY
);