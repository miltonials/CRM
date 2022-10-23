--##################CREACIÓN DE LA BASE DE DATOS

--MILTON BARRERA ZEPEDA | 2021091205
--ANDY PORRAS ROMERO | 20210678934


USE master
GO

IF EXISTS (SELECT * FROM sys.databases WHERE [name] = N'CRM')
BEGIN
	PRINT 'ELIMINANDO...';
	DROP DATABASE CRM;
END
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE (name = N'CRM'))
BEGIN
	PRINT 'CREANDO...';
	CREATE DATABASE CRM;
END
GO

USE CRM;
GO

IF OBJECT_ID(N'UsuarioRoles', N'U') IS NOT NULL
	DROP TABLE UsuarioRoles;
GO

IF OBJECT_ID(N'Rol', N'U') IS NOT NULL
	DROP TABLE Rol;
GO

IF OBJECT_ID(N'Usuario', N'U') IS NOT NULL
	DROP TABLE Usuario;
GO

IF OBJECT_ID(N'Cliente', N'U') IS NOT NULL
	DROP TABLE Cliente;
GO

IF OBJECT_ID(N'Asesoria', N'U') IS NOT NULL
	DROP TABLE Asesoria;
GO

IF OBJECT_ID(N'Cuenta', N'U') IS NOT NULL
	DROP TABLE Cuenta;
GO

IF OBJECT_ID(N'Contacto', N'U') IS NOT NULL
	DROP TABLE Contacto;
GO

IF OBJECT_ID(N'Caso', N'U') IS NOT NULL
	DROP TABLE Caso;
GO

IF OBJECT_ID(N'Ejecucion', N'U') IS NOT NULL
	DROP TABLE Ejecucion;
GO

IF OBJECT_ID(N'Tarea', N'U') IS NOT NULL
	DROP TABLE Tarea;
GO

IF OBJECT_ID(N'CasosTarea', N'U') IS NOT NULL
	DROP TABLE CasosTarea;
GO

IF OBJECT_ID(N'EjecucionTarea', N'U') IS NOT NULL
	DROP TABLE EjecucionTarea;
GO

IF OBJECT_ID(N'CotizacionTarea', N'U') IS NOT NULL
	DROP TABLE CotizacionTarea;
GO

IF OBJECT_ID(N'ContactoTarea', N'U') IS NOT NULL
	DROP TABLE ContactoTarea;
GO

IF OBJECT_ID(N'Factura', N'U') IS NOT NULL
	DROP TABLE Factura;
GO

IF OBJECT_ID(N'Denegacion', N'U') IS NOT NULL
	DROP TABLE Denegacion;
GO

IF OBJECT_ID(N'Inflacion', N'U') IS NOT NULL
	DROP TABLE Inflacion;
GO

IF OBJECT_ID(N'Producto', N'U') IS NOT NULL
	DROP TABLE Producto;
GO

IF OBJECT_ID(N'Familia', N'U') IS NOT NULL
	DROP TABLE Familia;
GO

IF OBJECT_ID(N'ProductoCotizacion', N'U') IS NOT NULL
	DROP TABLE ProductoCotizacion;
GO

IF OBJECT_ID(N'Cotizacion', N'U') IS NOT NULL
	DROP TABLE Cotizacion;
GO

IF OBJECT_ID(N'Actividad', N'U') IS NOT NULL
	DROP TABLE Actividad;
GO

IF OBJECT_ID(N'EjecucionActividad', N'U') IS NOT NULL
	DROP TABLE EjecucionActividad;
GO

IF OBJECT_ID(N'CotizacionActividad', N'U') IS NOT NULL
	DROP TABLE CotizacionActividad;
GO

IF OBJECT_ID(N'ContactoActividad', N'U') IS NOT NULL
	DROP TABLE ContactoActividad;
GO

IF OBJECT_ID(N'CasosActividad', N'U') IS NOT NULL
	DROP TABLE CasosActividad;
GO

CREATE TABLE Rol(
	id int PRIMARY KEY,
	tipo varchar(15) NOT NULL
);

CREATE TABLE UsuarioRoles(
	id_rol int,
	cedula_usuario VARCHAR(30),
	PRIMARY KEY(id_rol,cedula_usuario)
);

CREATE TABLE Usuario(
	cedula VARCHAR(30) UNIQUE,
	clave VARCHAR(30) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(30) NOT NULL,
	apellido2 VARCHAR(30) NOT NULL,
	departemento VARCHAR(30) NOT NULL
	PRIMARY KEY(cedula) 
);


CREATE TABLE Cliente(
	cedula VARCHAR(30) UNIQUE,
	telefono VARCHAR(30) NOT NULL,
	celular Varchar(30) NOT NULL,
	contacto_principal int NOT NULL,
	sitio_web VARCHAR(30) NOT NULL,
	informacion_adicional VARCHAR(30) NOT NULL,
	correo_electronico VARCHAR(30) NOT NULL,
	sector VARCHAR(20),
	zona VARCHAR(30),
	PRIMARY KEY(cedula,contacto_principal)
);

CREATE TABLE Asesoria(
	cedula_cliente varchar(30) NOT NULL,
	cedula_usuario varchar(30) NOT NULL,
	PRIMARY KEY (cedula_cliente,cedula_usuario)
);
CREATE TABLE Cuenta(
	cedula_cliente VARCHAR(30),
	nombre_cuenta VARCHAR(30),
	modeda_cuenta VARCHAR(30)
);

CREATE TABLE Contacto(
	id int,
	cedula_cliente VARCHAR(30),
	cedula_usuario VARCHAR(30),
	medio VARCHAR(30),
	motivo VARCHAR(30),
	nombre VARCHAR(30),
	telefono VARCHAR(30),
	correo_electronico VARCHAR(30),
	estado VARCHAR(30),
	dirreccion VARCHAR(30),
	sector VARCHAR(30),
	zona VARCHAR(30),
	descripcion VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE Caso(
	id INT,
	proyectoAsociado INT,
	propietarioCaso VARCHAR(30),
	asunto VARCHAR(30),
	dirrecion VARCHAR(30),
	nombreCuenta VARCHAR(30),
	nombreContacto VARCHAR(30),
	origenCaso VARCHAR(30),
	descripcion VARCHAR(30),
	estado VARCHAR(50),
	tipoCaso VARCHAR(30),
	PRIMARY KEY (id)
);

CREATE TABLE Ejecucion(
	id int PRIMARY KEY,
	numeroCotizacion smallint,
	asesor VARCHAR(30),
	fechaEjecucion DATE,
	nombreCuenta VARCHAR(30),
	nombreEjecucion VARCHAR(30),
	propietarioEjecucion VARCHAR(30),
	añoProyectadoCierre int,
	mesProyectadoCierre int,
	fechaCierre DATE,
	departamento VARCHAR(30)
);

CREATE TABLE Tarea(
	id Int PRIMARY KEY,
	fecha_Finalizacion DATE,
	estado VARCHAR(30),
	descripcion VARCHAR(30)
);

CREATE TABLE CasosTarea(
	id_caso INT,
	id_tarea INT, 
	PRIMARY KEY (id_caso, id_tarea)
);

CREATE TABLE EjecucionTarea(
	id_ejecucion INT,
	id_tarea INT, 
	PRIMARY KEY (id_ejecucion, id_tarea)
);

CREATE TABLE CotizacionTarea(
	id_cotizacion INT,
	id_tarea INT, 
	PRIMARY KEY (id_cotizacion, id_tarea)
);

CREATE TABLE ContactoTarea(
	id_contacto int,
	id_tarea int, 
	PRIMARY KEY (id_contacto, id_tarea)
);

--drop table Factura
CREATE TABLE Factura(
	consecutivo INT UNIQUE,
	id_cotizacion int,
	monto smallint,
	fecha DATE,
	PRIMARY KEY (consecutivo, id_cotizacion)
);

CREATE TABLE Denegacion(
	id_cotizacion int PRIMARY KEY,
	motivo VARCHAR(30),
	competidor Varchar(30)
);

CREATE TABLE Inflacion(
	anno INT,
	porcentaje INT,
	numero_cotizacion INT unique,
	PRIMARY KEY(anno, numero_cotizacion)
);

--drop table Producto
CREATE TABLE Producto(
	codigo int unique,
	codigo_Familia int,
	nombre VARCHAR(30),
	precio_estandar int,
	estado VARCHAR(30),
	descripcion VARCHAR(30),
	PRIMARY KEY(codigo,codigo_Familia)
);

CREATE TABLE Familia(
	codigoFamilia int PRIMARY KEY,
	nombreFamilia VARCHAR(30),
	estado VARCHAR(30),
	descripcion VARCHAR(30)
);

CREATE TABLE ProductoCotizacion(
	codigo_producto int,
	numero_cotizacion int, 
	cantidad int,
	PRIMARY KEY (codigo_producto,numero_cotizacion)
);

CREATE TABLE Cotizacion(
	numero_cotizacion int unique,
	id_factura INT, 
	id_contacto INT,
	zona VARCHAR(30),
	tipo VARCHAR(30),
	moneda_oportunidad VARCHAR(30),
	etapa VARCHAR(30),
	asesor VARCHAR(30),
	nombre_oportunidad VARCHAR(30),
	fecha_cotizacion VARCHAR(30),
	nombre_cuenta VARCHAR(30),
	fecha_proyeccion_cierre DATE,
	fecha_cierre DATE,
	probabilidades VARCHAR(30),
	orden_compra VARCHAR(30),
	descripcion VARCHAR(30),
	PRIMARY KEY(numero_cotizacion, id_factura,id_contacto)
);

CREATE TABLE Actividad(
	id int,
	descripcion VARCHAR(30),
	fecha_finalizacion DATE,
	PRIMARY KEY (id)
);

CREATE TABLE CotizacionActividad(
	id_cotizacion INT,
	id_actividad INT,
	PRIMARY KEY(id_cotizacion,id_actividad)
);

CREATE TABLE EjecucionActividad(
	id_ejecucion INT,
	id_actividad INT,
	PRIMARY KEY(id_ejecucion,id_actividad)
);

CREATE TABLE ContactoActividad(
	id_contacto INT,
	id_actividad INT,
	PRIMARY KEY(id_contacto,id_actividad)
);

CREATE TABLE CasosActividad(
	id_caso INT,
	id_actividad INT,
	PRIMARY KEY(id_caso,id_actividad)
);

