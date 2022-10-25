USE MASTER
GO

USE CRM
GO
-- Aqui inicia la 
-- Eliminacion de los foreign keys
ALTER TABLE UsuarioRoles DROP CONSTRAINT IF EXISTS fk_UsuarioRoles_Rol
ALTER TABLE UsuarioRoles DROP CONSTRAINT IF EXISTS fk_UsuarioRoles_Usuario
ALTER TABLE Cliente DROP CONSTRAINT IF EXISTS fk_Cliente_Contacto
ALTER TABLE Contacto DROP CONSTRAINT IF EXISTS fk_Contacto_Usuario
ALTER TABLE ContactoActividad DROP CONSTRAINT IF EXISTS fk_ContactoActividad_Contacto
ALTER TABLE ContactoActividad DROP CONSTRAINT IF EXISTS fk_ContactoActividad_Actividad
ALTER TABLE CotizacionActividad DROP CONSTRAINT IF EXISTS fk_CotizacionActividad_Cotizacion
ALTER TABLE CotizacionActividad DROP CONSTRAINT IF EXISTS fk_CotizacionActividad_Actividad
ALTER TABLE CotizacionTarea DROP CONSTRAINT IF EXISTS fk_CotizacionTarea_Cotizacion
ALTER TABLE CotizacionTarea DROP CONSTRAINT IF EXISTS fk_CotizacionTarea_Tarea
ALTER TABLE ContactoTarea DROP CONSTRAINT IF EXISTS fk_ContactoTarea_Contacto
ALTER TABLE ContactoTarea DROP CONSTRAINT IF EXISTS fk_ContactoTarea_Tarea
ALTER TABLE Caso DROP CONSTRAINT IF EXISTS fk_Caso_Ejecucion
ALTER TABLE Caso DROP CONSTRAINT IF EXISTS fk_Caso_Usuario
ALTER TABLE CasosTarea DROP CONSTRAINT IF EXISTS fk_CasosTarea_Caso
ALTER TABLE CasosTarea DROP CONSTRAINT IF EXISTS fk_CasosTarea_Tarea
ALTER TABLE EjecucionTarea DROP CONSTRAINT IF EXISTS fk_EjecucionTarea_Ejecucion
ALTER TABLE EjecucionTarea DROP CONSTRAINT IF EXISTS fk_EjecucionTarea_tarea
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_Contacto
ALTER TABLE Inflacion DROP CONSTRAINT IF EXISTS fk_Inflacion_Cotizacion
ALTER TABLE ProductoCotizacion DROP CONSTRAINT IF EXISTS fk_ProductoCotizacion_Producto
ALTER TABLE ProductoCotizacion DROP CONSTRAINT IF EXISTS fk_ProductoCotizacion_Cotizacion
ALTER TABLE Producto DROP CONSTRAINT IF EXISTS fk_Producto_Familia
ALTER TABLE EjecucionActividad DROP CONSTRAINT IF EXISTS fk_EjecucionActividad_Ejecucion
ALTER TABLE EjecucionActividad DROP CONSTRAINT IF EXISTS fk_EjecucionActividad_Actividad
ALTER TABLE CasosActividad DROP CONSTRAINT IF EXISTS fk_CasosActividad_Caso
ALTER TABLE casosActividad DROP CONSTRAINT IF EXISTS fk_casosActividad_Actividad
ALTER TABLE Ejecucion DROP CONSTRAINT IF EXISTS fk_Ejecucion_numeroCotizacion

ALTER TABLE PrivilegiosXRol DROP CONSTRAINT IF EXISTS fk_PrivilegiosXRol_Rol
ALTER TABLE privilegiosXrol DROP CONSTRAINT IF EXISTS fk_privilegiosXrol_TipoPrivilegio
ALTER TABLE CuentaCliente DROP CONSTRAINT IF EXISTS fk_CuentaCliente_Cliente
ALTER TABLE CuentaCliente DROP CONSTRAINT IF EXISTS fk_CuentaCliente_Moneda
ALTER TABLE CuentaCliente DROP CONSTRAINT IF EXISTS fk_CuentaCliente_Zona
ALTER TABLE CuentaCliente DROP CONSTRAINT IF EXISTS fk_CuentaCliente_Sector
ALTER TABLE Contacto DROP CONSTRAINT IF EXISTS fk_Contacto_CuentaCliente
ALTER TABLE Contacto DROP CONSTRAINT IF EXISTS fk_Contacto_Zona
ALTER TABLE Contacto DROP CONSTRAINT IF EXISTS fk_Contacto_Sector
ALTER TABLE Contacto DROP CONSTRAINT IF EXISTS fk_Contacto_Direccion
ALTER TABLE Contacto DROP CONSTRAINT IF EXISTS fk_Contacto_Estado
ALTER TABLE Contacto DROP CONSTRAINT IF EXISTS fk_Contacto_TipoContacto
ALTER TABLE Direccion DROP CONSTRAINT IF EXISTS fk_Direccion_Provincia
ALTER TABLE Direccion DROP CONSTRAINT IF EXISTS fk_Direccion_Canton
ALTER TABLE Direccion DROP CONSTRAINT IF EXISTS fk_Direccion_Distrito

ALTER TABLE Usuario DROP CONSTRAINT IF EXISTS fk_Usuario_Departamento
ALTER TABLE Caso DROP CONSTRAINT IF EXISTS fk_Caso_Direccion
ALTER TABLE Caso DROP CONSTRAINT IF EXISTS fk_Caso_Origen
ALTER TABLE Caso DROP CONSTRAINT IF EXISTS fk_Caso_EstadoCaso
ALTER TABLE Caso DROP CONSTRAINT IF EXISTS fk_Caso_TipoCaso
ALTER TABLE Caso DROP CONSTRAINT IF EXISTS fk_Caso_Prioridad
ALTER TABLE Ejecucion DROP CONSTRAINT IF EXISTS fk_Ejecucion_Departamento
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_Zona
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_Sector
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_Moneda
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_Etapa
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_Asesor
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_Probabilidad
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_Motivo
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_Competidor
ALTER TABLE Tarea DROP CONSTRAINT IF EXISTS fk_Tarea_EstadoTarea
ALTER TABLE Contacto DROP CONSTRAINT IF EXISTS fk_Contacto_Cliente
ALTER TABLE Producto DROP CONSTRAINT IF EXISTS fk_Producto_EstadoProducto
ALTER TABLE Familia DROP CONSTRAINT IF EXISTS fk_Familia_EstadoFamilia

ALTER TABLE Ejecucion DROP CONSTRAINT IF EXISTS fk_Ejecucion_Cotizacion
ALTER TABLE Caso DROP CONSTRAINT IF EXISTS fk_Caso_Ejecucion_nombreCuenta
ALTER TABLE Caso DROP CONSTRAINT IF EXISTS fk_Caso_Cotizacion_asesor
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_CuentaCliente



-- Aqui se crea los foreign keys de las tablas

ALTER TABLE UsuarioRoles ADD CONSTRAINT fk_UsuarioRoles_Rol FOREIGN KEY (id_rol) REFERENCES Rol (id)
	ON DELETE NO ACTION;
ALTER TABLE UsuarioRoles ADD CONSTRAINT fk_UsuarioRoles_Usuario FOREIGN KEY (cedula_usuario) REFERENCES Usuario (cedula)
	ON DELETE NO ACTION;
ALTER TABLE Contacto ADD CONSTRAINT fk_Contacto_Cliente FOREIGN KEY (cedula_cliente) REFERENCES Cliente (cedula)
	ON DELETE NO ACTION;
ALTER TABLE Contacto ADD CONSTRAINT fk_Contacto_Usuario FOREIGN KEY (cedula_usuario) REFERENCES Usuario (cedula)
	ON DELETE NO ACTION;
ALTER TABLE ContactoActividad ADD CONSTRAINT fk_ContactoActividad_Contacto FOREIGN KEY (id_contacto) REFERENCES Contacto (id)
	ON DELETE NO ACTION;
ALTER TABLE ContactoActividad ADD CONSTRAINT fk_ContactoActividad_Actividad FOREIGN KEY (id_actividad) REFERENCES Actividad (id)
	ON DELETE NO ACTION;
ALTER TABLE CotizacionActividad ADD CONSTRAINT fk_CotizacionActividad_Cotizacion FOREIGN KEY (id_cotizacion) REFERENCES Cotizacion (numero_cotizacion)
	ON DELETE NO ACTION;
ALTER TABLE CotizacionActividad ADD CONSTRAINT fk_CotizacionActividad_Actividad FOREIGN KEY (id_actividad) REFERENCES Actividad (id)
	ON DELETE NO ACTION;
ALTER TABLE CotizacionTarea ADD CONSTRAINT fk_CotizacionTarea_Cotizacion FOREIGN KEY (id_cotizacion) REFERENCES Cotizacion (numero_cotizacion)
	ON DELETE NO ACTION;
ALTER TABLE CotizacionTarea ADD CONSTRAINT fk_CotizacionTarea_Tarea FOREIGN KEY (id_tarea) REFERENCES Tarea (id)
	ON DELETE NO ACTION;
ALTER TABLE ContactoTarea ADD CONSTRAINT fk_ContactoTarea_Contacto FOREIGN KEY (id_contacto) REFERENCES Contacto (id)
	ON DELETE NO ACTION;
ALTER TABLE ContactoTarea ADD CONSTRAINT fk_ContactoTarea_Tarea FOREIGN KEY (id_tarea) REFERENCES Tarea (id)
	ON DELETE NO ACTION;
ALTER TABLE Caso ADD CONSTRAINT fk_Caso_Ejecucion FOREIGN KEY (proyectoAsociado) REFERENCES Ejecucion (id)
	ON DELETE NO ACTION;
ALTER TABLE Caso ADD CONSTRAINT fk_Caso_Usuario FOREIGN KEY (propietarioCaso) REFERENCES Usuario (Cedula)
	ON DELETE NO ACTION;
ALTER TABLE CasosTarea ADD CONSTRAINT fk_CasosTarea_Caso FOREIGN KEY (id_caso) REFERENCES Caso (id)
	ON DELETE NO ACTION;
ALTER TABLE CasosTarea ADD CONSTRAINT fk_CasosTarea_Tarea FOREIGN KEY (id_tarea) REFERENCES Tarea (id)
	ON DELETE NO ACTION;
ALTER TABLE EjecucionTarea ADD CONSTRAINT fk_EjecucionTarea_Ejecucion FOREIGN KEY (id_ejecucion) REFERENCES Ejecucion (id)
	ON DELETE NO ACTION;
ALTER TABLE EjecucionTarea ADD CONSTRAINT fk_EjecucionTarea_tarea FOREIGN KEY (id_tarea) REFERENCES tarea (id)
	ON DELETE NO ACTION;
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_Contacto FOREIGN KEY (id_contacto) REFERENCES Contacto (id)
	ON DELETE NO ACTION;
ALTER TABLE ProductoCotizacion ADD CONSTRAINT fk_ProductoCotizacion_Producto FOREIGN KEY (codigo_producto) REFERENCES Producto (codigo)
	ON DELETE NO ACTION;
ALTER TABLE ProductoCotizacion ADD CONSTRAINT fk_ProductoCotizacion_Cotizacion FOREIGN KEY (numero_cotizacion) REFERENCES Cotizacion (numero_cotizacion)
	ON DELETE NO ACTION;
ALTER TABLE Producto ADD CONSTRAINT fk_Producto_Familia FOREIGN KEY (codigo_Familia) REFERENCES Familia (codigo)
	ON DELETE NO ACTION;
ALTER TABLE EjecucionActividad ADD CONSTRAINT fk_EjecucionActividad_Ejecucion FOREIGN KEY (id_ejecucion) REFERENCES Ejecucion (id)
	ON DELETE NO ACTION;
ALTER TABLE EjecucionActividad ADD CONSTRAINT fk_EjecucionActividad_Actividad FOREIGN KEY (id_actividad) REFERENCES Actividad (id)
	ON DELETE NO ACTION;
ALTER TABLE CasosActividad ADD CONSTRAINT fk_CasosActividad_Caso FOREIGN KEY (id_caso) REFERENCES Caso (id)
	ON DELETE NO ACTION;
ALTER TABLE casosActividad ADD CONSTRAINT fk_casosActividad_Actividad FOREIGN KEY (id_actividad) REFERENCES Actividad (id)
	ON DELETE NO ACTION;

ALTER TABLE Usuario ADD CONSTRAINT fk_Usuario_Departamento FOREIGN KEY (id_departamento) REFERENCES Departamento (id)
  ON DELETE NO ACTION;
ALTER TABLE Caso ADD CONSTRAINT fk_Caso_Direccion FOREIGN KEY (id_direccion) REFERENCES Direccion (id)
  ON DELETE NO ACTION;
ALTER TABLE Caso ADD CONSTRAINT fk_Caso_Origen FOREIGN KEY (id_origen) REFERENCES Origen (id)
  ON DELETE NO ACTION;
ALTER TABLE Caso ADD CONSTRAINT fk_Caso_EstadoCaso FOREIGN KEY (id_estado) REFERENCES EstadoCaso (id)
  ON DELETE NO ACTION;
ALTER TABLE Caso ADD CONSTRAINT fk_Caso_TipoCaso FOREIGN KEY (id_tipo) REFERENCES TipoCaso (id)
  ON DELETE NO ACTION;
ALTER TABLE Caso ADD CONSTRAINT fk_Caso_Prioridad FOREIGN KEY (id_prioridad) REFERENCES Prioridad (id)
  ON DELETE NO ACTION;
ALTER TABLE Ejecucion ADD CONSTRAINT fk_Ejecucion_Departamento FOREIGN KEY (id_departamento) REFERENCES Departamento (id)
  ON DELETE NO ACTION;
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_Zona FOREIGN KEY (id_zona) REFERENCES Zona (id)
  ON DELETE NO ACTION;
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_Sector FOREIGN KEY (id_sector) REFERENCES Sector (id)
  ON DELETE NO ACTION;
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_Moneda FOREIGN KEY (id_moneda) REFERENCES Moneda (id)
  ON DELETE NO ACTION;
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_Etapa FOREIGN KEY (id_etapa) REFERENCES Etapa (nombre)
  ON DELETE NO ACTION;
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_Asesor FOREIGN KEY (id_asesor) REFERENCES Usuario (Cedula)
  ON DELETE NO ACTION;
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_Probabilidad FOREIGN KEY (probabilidad) REFERENCES Probabilidad (porcentaje)
  ON DELETE NO ACTION;
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_Motivo FOREIGN KEY (motivo_denegacion) REFERENCES Motivo (id)
  ON DELETE NO ACTION;
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_Competidor FOREIGN KEY (id_competidor) REFERENCES Competidor (nombre)
ON DELETE NO ACTION;



ALTER TABLE PrivilegiosXRol ADD CONSTRAINT fk_PrivilegiosXRol_Rol FOREIGN KEY (id_rol) REFERENCES Rol (id)
  ON DELETE NO ACTION;
ALTER TABLE privilegiosXrol ADD CONSTRAINT fk_privilegiosXrol_TipoPrivilegio FOREIGN KEY (id_privilegio) REFERENCES TipoPrivilegio (id)
  ON DELETE NO ACTION;
ALTER TABLE CuentaCliente ADD CONSTRAINT fk_CuentaCliente_Cliente FOREIGN KEY (cedula_cliente) REFERENCES Cliente (cedula)
  ON DELETE NO ACTION;
ALTER TABLE CuentaCliente ADD CONSTRAINT fk_CuentaCliente_Moneda FOREIGN KEY (moneda) REFERENCES Moneda (id)
  ON DELETE NO ACTION;
ALTER TABLE CuentaCliente ADD CONSTRAINT fk_CuentaCliente_Zona FOREIGN KEY (id_zona) REFERENCES Zona (id)
  ON DELETE NO ACTION;
ALTER TABLE CuentaCliente ADD CONSTRAINT fk_CuentaCliente_Sector FOREIGN KEY (id_sector) REFERENCES Sector (id)
  ON DELETE NO ACTION;
ALTER TABLE Contacto ADD CONSTRAINT fk_Contacto_CuentaCliente FOREIGN KEY (cedula_cliente) REFERENCES CuentaCliente (cedula_cliente)
  ON DELETE NO ACTION;
ALTER TABLE Contacto ADD CONSTRAINT fk_Contacto_Zona FOREIGN KEY (id_zona) REFERENCES Zona (id)
  ON DELETE NO ACTION;
ALTER TABLE Contacto ADD CONSTRAINT fk_Contacto_Sector FOREIGN KEY (id_sector) REFERENCES Sector (id)
  ON DELETE NO ACTION;
ALTER TABLE Contacto ADD CONSTRAINT fk_Contacto_Direccion FOREIGN KEY (direccion) REFERENCES Direccion (id)
  ON DELETE NO ACTION;
ALTER TABLE Contacto ADD CONSTRAINT fk_Contacto_Estado FOREIGN KEY (estado) REFERENCES Estado (id)
  ON DELETE NO ACTION;
ALTER TABLE Contacto ADD CONSTRAINT fk_Contacto_TipoContacto FOREIGN KEY (tipo_contacto) REFERENCES TipoContacto (id)
  ON DELETE NO ACTION;
ALTER TABLE Direccion ADD CONSTRAINT fk_Direccion_Provincia FOREIGN KEY (id_provincia) REFERENCES Provincia (id)
  ON DELETE NO ACTION;
ALTER TABLE Direccion ADD CONSTRAINT fk_Direccion_Canton FOREIGN KEY (id_canton) REFERENCES Canton (id)
  ON DELETE NO ACTION;
ALTER TABLE Direccion ADD CONSTRAINT fk_Direccion_Distrito FOREIGN KEY (id_distrito) REFERENCES Distrito (id)
  ON DELETE NO ACTION;
ALTER TABLE Tarea ADD CONSTRAINT fk_Tarea_EstadoTarea FOREIGN KEY (estado) REFERENCES EstadoTarea (id)
  ON DELETE NO ACTION;
ALTER TABLE Producto ADD CONSTRAINT fk_Producto_EstadoProducto FOREIGN KEY (estado) REFERENCES EstadoProducto (id)
	ON DELETE NO ACTION;
ALTER TABLE Familia ADD CONSTRAINT fk_Familia_EstadoFamilia FOREIGN KEY (estado) REFERENCES EstadoFamilia (id)
	ON DELETE NO ACTION;

ALTER TABLE Ejecucion ADD CONSTRAINT fk_Ejecucion_Cotizacion FOREIGN KEY (nombreCuenta) REFERENCES Cotizacion (nombre_cuenta)
  ON DELETE NO ACTION;
ALTER TABLE Caso ADD CONSTRAINT fk_Caso_Ejecucion_nombreCuenta FOREIGN KEY (nombreCuenta) REFERENCES Ejecucion (nombreCuenta)
  ON DELETE NO ACTION;
/*
ALTER TABLE Caso ADD CONSTRAINT fk_Caso_Cotizacion_asesor FOREIGN KEY (asesor) REFERENCES Cotizacion (id_asesor)
  ON DELETE NO ACTION;
*/
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_CuentaCliente FOREIGN KEY (nombre_cuenta) REFERENCES CuentaCliente (nombre_cuenta)
  ON DELETE NO ACTION;
ALTER TABLE Ejecucion ADD CONSTRAINT fk_Ejecucion_numeroCotizacion FOREIGN KEY (numeroCotizacion) REFERENCES Cotizacion (numero_cotizacion)
	ON DELETE NO ACTION;