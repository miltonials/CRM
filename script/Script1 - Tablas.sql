--##################CREACIÓN DE LA BASE DE DATOS

--MILTON BARRERA ZEPEDA | 2021091205
--ANDY PORRAS ROMERO | 20210678934

EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'CRM';


USE master
GO


-- Validacion si existe la base de datos
IF EXISTS (SELECT * FROM sys.databases WHERE [name] = N'CRM')
BEGIN
	PRINT 'ELIMINANDO...';
	ALTER DATABASE CRM SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE CRM;
END
GO

-- Creacion de la base de datos
IF NOT EXISTS (SELECT * FROM sys.databases WHERE (name = N'CRM'))
BEGIN
	PRINT 'CREANDO...';
	CREATE DATABASE CRM;
END
GO

USE CRM;
GO

-- Aqui inicia la creacion de las tablas

-- Creacion de la tabla TipoPrivilegio
CREATE TABLE TipoPrivilegio(
  id int primary key,
  tipo varchar(20)
);

-- Creacion de la tabla PrivilegioxRol	
CREATE TABLE PrivilegiosXrol(
  id_rol int,
  id_privilegio int,
  PRIMARY KEY (id_rol, id_privilegio)
);
  
 -- Creacion de la tabla Rol 
CREATE TABLE Rol(
	id int PRIMARY KEY,
	tipo varchar(15) NOT NULL
);

-- Creacion de la tabla UsuarioRoles
CREATE TABLE UsuarioRoles(
	id_rol int,
	cedula_usuario VARCHAR(30),
	PRIMARY KEY(id_rol,cedula_usuario)
);

-- Creacion de la tabla Departamento
CREATE TABLE Departamento(
  id VARCHAR(30),
  nombre VARCHAR(20),
  PRIMARY KEY (id)
)

-- Creacion de la tabla Usuario
CREATE TABLE Usuario(
	cedula VARCHAR(30) UNIQUE,
	clave VARCHAR(30) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(30) NOT NULL,
	apellido2 VARCHAR(30) NOT NULL,
	id_departamento VARCHAR(30) NOT NULL
	PRIMARY KEY(cedula)
);

-- Creacion de la tabla Cliente
CREATE TABLE Cliente(
	cedula VARCHAR(30) UNIQUE,
	telefono VARCHAR(30) NOT NULL,
	celular Varchar(30) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(30) NOT NULL,
	apellido2 VARCHAR(30) NOT NULL,
	  PRIMARY KEY(cedula)
);

-- Creacion de la tabla CuentaCliente
CREATE TABLE CuentaCliente(
  id INT,
  cedula_cliente VARCHAR(30) UNIQUE not null,
  nombre_cuenta varchar(30) UNIQUE NOT NULL,
  moneda INT NOT NULL,
  contacto_principal VARCHAR(30) NOT NULL,
  sitio_web VARCHAR (50) NOT NULL,
  informacion_adicional varchar(50) NOT NULL,
  correo_electronico varchar (50) NOT NULL,
  id_zona INT,
  id_sector INT,
  PRIMARY KEY(id,cedula_cliente, moneda, nombre_cuenta) 
);

-- Creacion de la tabla Moneda
CREATE TABLE Moneda(
  id INT PRIMARY KEY,
  nombre  VARCHAR (30)
);

-- Creacion de la tabla Zona
CREATE table zona(
  id int primary KEY,
  nombre VARCHAR(30)
);

-- Creacion de la tabla Sector
CREATE table Sector (
  id int primary KEY,
  nombre VARCHAR(30)
);

-- Creacion de la tabla Provincia
CREATE table Provincia (
  id int primary KEY,
  nombre VARCHAR(30)
);

-- Creacion de la tabla Canton
create TABLE Canton(
  id int PRIMARY KEY,
  nombre VARCHAR(30)
);

-- Creacion de la tabla Distrito
create TABLE Distrito (
  id int PRIMARY KEY,
  nombre VARCHAR(30)
);

-- Creacion de la tabla Direccion
create TABLE Direccion (
  id int UNIQUE,
  id_provincia int NOT NULL,
  id_canton int NOT  NULL,
  id_distrito int NOT NULL,
  PRIMARY KEY(id)
);

-- Creacion de la tabla Estado
CREATE TABLE Estado(
  id int PRIMARY KEY,
  nombre VARCHAR(30)
);

-- Creacion de la tabla TipoContacto
CREATE TABLE TipoContacto(
	id int PRIMARY KEY NOT NULL,
  tipo VARCHAR(30) not null
);

-- Creacion de la tabla Contacto
CREATE TABLE Contacto(
	id int UNIQUE,
	cedula_cliente VARCHAR(30) ,
	cedula_usuario VARCHAR(30) NOT NULL,
 	tipo_contacto INT NOT NULL,
	motivo VARCHAR(30) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	telefono VARCHAR(30) NOT NULL,
	correo_electronico VARCHAR(30) NOT NULL,
	estado INT NOT NULL,
	direccion INT NOT NULL,
	descripcion VARCHAR(50) NOT NULL,
  	id_zona INT NOT NULL,
  	id_sector INT NOT NULL,
	PRIMARY KEY (id)
);

-- Creacion de la tabla Origen
CREATE TABLE Origen(
  id VARCHAR(30) PRIMARY KEY,
  origen VARCHAR(30),
)

-- Creacion de la tabla EstadoCaso
CREATE TABLE EstadoCaso(
  id VARCHAR(30) PRIMARY KEY,
  estado VARCHAR(30),
)

-- Creacion de la tabla TipoCaso
CREATE TABLE TipoCaso(
  id VARCHAR(30) PRIMARY KEY,
  tipo VARCHAR(30),
)
  
-- Creacion de la tabla Prioridad
CREATE TABLE Prioridad(
  id VARCHAR(30) PRIMARY KEY,
  prioridad VARCHAR(30),
)

-- Creacion de la tabla Caso
CREATE TABLE Caso(
	id INT NOT NULL,
	proyectoAsociado INT NOT NULL,
	propietarioCaso VARCHAR(30) NOT NULL,
	asunto VARCHAR(255) NOT NULL,
	nombreCuenta VARCHAR(30) NOT NULL,
	nombreContacto VARCHAR(30) NOT NULL,
	descripcion VARCHAR(255) NOT NULL,
	id_direccion INT NOT NULL,
	id_origen VARCHAR(30) NOT NULL,
	id_estado VARCHAR(30) NOT NULL,
	id_tipo VARCHAR(30) NOT NULL,
  id_prioridad VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

-- Creacion de la tabla Ejecucion
CREATE TABLE Ejecucion(
	id int UNIQUE,
	numeroCotizacion int UNIQUE,
	asesor VARCHAR(30),
	fechaEjecucion DATE,
	nombreCuenta VARCHAR(30) UNIQUE,
	nombreEjecucion VARCHAR(30),
	propietarioEjecucion VARCHAR(30),
	añoProyectadoCierre int,
	mesProyectadoCierre int,
	fechaCierre DATE,
	id_departamento VARCHAR(30),
	PRIMARY KEY(id, nombreCuenta)
);

-- Creacion de la tabla EstadoTarea
CREATE TABLE EstadoTarea (
  id INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);

-- Creacion de la tabla Tarea
CREATE TABLE Tarea(
	id Int PRIMARY KEY,
	fecha_finalizacion DATE,
  fecha_creacion DATE,
	estado INT,
	descripcion VARCHAR(30)
);

-- Creacion de la tabla CasosTareas
CREATE TABLE CasosTarea(
	id_caso INT,
	id_tarea INT, 
	PRIMARY KEY (id_caso, id_tarea)
);

-- Creacion de la tabla EjecucionTarea
CREATE TABLE EjecucionTarea(
	id_ejecucion INT,
	id_tarea INT, 
	PRIMARY KEY (id_ejecucion, id_tarea)
);

-- Creacion de la tabla CotizacionTarea
CREATE TABLE CotizacionTarea(
	id_cotizacion INT,
	id_tarea INT, 
	PRIMARY KEY (id_cotizacion, id_tarea)
);

-- Creacion de la tabla ContactoTarea
CREATE TABLE ContactoTarea(
	id_contacto int,
	id_tarea int, 
	PRIMARY KEY (id_contacto, id_tarea)
);

-- Creacion de la tabla Competidor
CREATE TABLE Competidor(
	nombre Varchar(30) PRIMARY KEY
);

-- Creacion de la tabla Etapa
CREATE TABLE Etapa(
	nombre Varchar(30) PRIMARY KEY
);

-- Creacion de la tabla Probabilidad
CREATE TABLE Probabilidad(
	porcentaje smallint PRIMARY KEY
);

-- Creacion de la tabla Motivo
CREATE TABLE Motivo(
	id VARCHAR(10) PRIMARY KEY,
  descripcion VARCHAR (255)
);

-- Creacion de la tabla Inflacion
CREATE TABLE Inflacion(
	anno INT,
	porcentaje float,
	PRIMARY KEY(anno)
);

-- Creacion de la tabla Producto
CREATE TABLE Producto(
	codigo int unique,
	codigo_Familia int,
	nombre VARCHAR(30) NOT NULL,
	precio_estandar FLOAT,
	estado INT,
	descripcion VARCHAR(30) NOT NULL,
	PRIMARY KEY(codigo,codigo_Familia)
);

-- Creacion de la tabla de los estados de los producto
CREATE TABLE EstadoProducto (
	id INT PRIMARY KEY,
	estado VARCHAR(30)
);

-- Creacion de la tabla Familia
CREATE TABLE Familia(
	codigo int PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	estado INT,
	descripcion VARCHAR(255)
);

-- Creacion de la tabla de los estados de las familias de producto
CREATE TABLE EstadoFamilia (
	id INT PRIMARY KEY,
	estado VARCHAR(30)
);

-- Creacion de la tabla ProductoCotizacion
CREATE TABLE ProductoCotizacion(
	codigo_producto int NOT NULL,
	numero_cotizacion int NOT NULL, 
	precio_negociado FLOAT NOT NULL,
	cantidad int NOT NULL,
	PRIMARY KEY (codigo_producto,numero_cotizacion)
);

-- Creacion de la tabla Cotizacion
CREATE TABLE Cotizacion(
	numero_cotizacion int unique,
	id_factura INT UNIQUE, 
	id_contacto INT,
	tipo VARCHAR(30) NOT NULL, 
	nombre_oportunidad VARCHAR(30) NOT NULL,
	fecha_cotizacion VARCHAR(30) NOT NULL,
	nombre_cuenta VARCHAR(30) NOT NULL UNIQUE,
	fecha_proyeccion_cierre DATE NOT NULL,
	fecha_cierre DATE NOT NULL,
	orden_compra VARCHAR(30) NOT NULL,
	descripcion VARCHAR(30) NOT NULL,
	id_zona INT NOT NULL,
	id_sector INT NOT NULL,
	id_moneda INT NOT NULL,
	id_etapa VARCHAR(30) NOT NULL,
	id_asesor VARCHAR(30) NOT NULL,
	probabilidad smallint NOT NULL,
	motivo_denegacion VARCHAR(10) NOT NULL,
	id_competidor Varchar(30) NOT NULL,
	PRIMARY KEY(numero_cotizacion, nombre_cuenta)
);

-- Creacion de la tabla Actividad
CREATE TABLE Actividad(
	id int,
	descripcion VARCHAR(30) NOT NULL,
	fecha_finalizacion DATE,
	PRIMARY KEY (id)
);

-- Creacion de la tabla CotizacionActividad
CREATE TABLE CotizacionActividad(
	id_cotizacion INT,
	id_actividad INT,
	PRIMARY KEY(id_cotizacion,id_actividad)
);

-- Creacion de la tabla EjecucionActividad
CREATE TABLE EjecucionActividad(
	id_ejecucion INT,
	id_actividad INT,
	PRIMARY KEY(id_ejecucion,id_actividad)
);

-- Creacion de la tabla ContactoActividad
CREATE TABLE ContactoActividad(
	id_contacto INT NOT NULL,
	id_actividad INT NOT NULL,
	PRIMARY KEY(id_contacto,id_actividad)
);

-- Creacion de la tabla CasosActividad
CREATE TABLE CasosActividad(
	id_caso INT NOT NULL,
	id_actividad INT NOT NULL,
	PRIMARY KEY(id_caso,id_actividad)
);

CREATE TABLE ValorPresenteCotizaciones (
	numero_cotizacion INT NOT NULL PRIMARY KEY,
	numero_contacto INT NOT NULL,
	nombre_oportunidad VARCHAR(30) NOT NULL,
	fecha_cotizacion VARCHAR(30) NOT NULL,
	nombre_cuenta VARCHAR(30) NOT NULL,
	total_cotizacion FLOAT NOT NULL,
	total_a_valor_presente FLOAT NOT NULL
)