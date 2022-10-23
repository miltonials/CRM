USE MASTER
GO

USE CRM
GO

ALTER TABLE UsuarioRoles DROP CONSTRAINT IF EXISTS fk_UsuarioRoles_Rol
ALTER TABLE UsuarioRoles DROP CONSTRAINT IF EXISTS fk_UsuarioRoles_Usuario
ALTER TABLE Asesoria DROP CONSTRAINT IF EXISTS fk_Asesoria_Usuario
ALTER TABLE Asesoria DROP CONSTRAINT IF EXISTS fk_Asesoria_Cliente
ALTER TABLE Cuenta DROP CONSTRAINT IF EXISTS fk_Cuenta_Cliente
ALTER TABLE Cliente DROP CONSTRAINT IF EXISTS fk_Cliente_Contacto
ALTER TABLE Contacto DROP CONSTRAINT IF EXISTS fk_Contacto_Cliente
ALTER TABLE Contacto DROP CONSTRAINT IF EXISTS fk_Contacto_Usuario
ALTER TABLE ContactoActividad DROP CONSTRAINT IF EXISTS fk_ContactoActividad_Contacto
ALTER TABLE ContactoActividad DROP CONSTRAINT IF EXISTS fk_ContactoActividad_Actividad
ALTER TABLE CotizacionActividad DROP CONSTRAINT IF EXISTS fk_CotizacionActividad_Cotizacion
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
ALTER TABLE Factura DROP CONSTRAINT IF EXISTS fk_Factura_Cotizacion
ALTER TABLE Denegacion DROP CONSTRAINT IF EXISTS fk_Denegacion_Cotizacion
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_Factura
ALTER TABLE Cotizacion DROP CONSTRAINT IF EXISTS fk_Cotizacion_Contacto
ALTER TABLE Inflacion DROP CONSTRAINT IF EXISTS fk_Inflacion_Cotizacion
ALTER TABLE ProductoCotizacion DROP CONSTRAINT IF EXISTS fk_ProductoCotizacion_Producto
ALTER TABLE ProductoCotizacion DROP CONSTRAINT IF EXISTS fk_ProductoCotizacion_Cotizacion
ALTER TABLE Producto DROP CONSTRAINT IF EXISTS fk_Producto_Familia
ALTER TABLE EjecucionActividad DROP CONSTRAINT IF EXISTS fk_EjecucionActividad_Ejecucion
ALTER TABLE EjecucionActividad DROP CONSTRAINT IF EXISTS fk_EjecucionActividad_Actividad
ALTER TABLE CasosActividad DROP CONSTRAINT IF EXISTS fk_CasosActividad_Caso
ALTER TABLE casosActividad DROP CONSTRAINT IF EXISTS fk_casosActividad_Actividad




--select * from Cliente


ALTER TABLE UsuarioRoles ADD CONSTRAINT fk_UsuarioRoles_Rol FOREIGN KEY (id_rol) REFERENCES Rol (id)
	ON DELETE NO ACTION;
ALTER TABLE UsuarioRoles ADD CONSTRAINT fk_UsuarioRoles_Usuario FOREIGN KEY (cedula_usuario) REFERENCES Usuario (cedula)
	ON DELETE NO ACTION;
ALTER TABLE Asesoria ADD CONSTRAINT fk_Asesoria_Usuario FOREIGN KEY (cedula_usuario) REFERENCES Usuario (cedula)
	ON DELETE NO ACTION;
ALTER TABLE Asesoria ADD CONSTRAINT fk_Asesoria_Cliente FOREIGN KEY (cedula_cliente) REFERENCES Cliente (cedula)
	ON DELETE NO ACTION;
ALTER TABLE Cuenta ADD CONSTRAINT fk_Cuenta_Cliente FOREIGN KEY (cedula_cliente) REFERENCES Cliente (cedula)
	ON DELETE NO ACTION;
ALTER TABLE Cliente ADD CONSTRAINT fk_Cliente_Contacto FOREIGN KEY (contacto_principal) REFERENCES Contacto (id)
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
ALTER TABLE Factura ADD CONSTRAINT fk_Factura_Cotizacion FOREIGN KEY (id_cotizacion) REFERENCES Cotizacion (numero_cotizacion)
	ON DELETE NO ACTION;
ALTER TABLE Denegacion ADD CONSTRAINT fk_Denegacion_Cotizacion FOREIGN KEY (id_cotizacion) REFERENCES Cotizacion (numero_cotizacion)
	ON DELETE NO ACTION;
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_Factura FOREIGN KEY (id_factura) REFERENCES Factura (consecutivo)
	ON DELETE NO ACTION;
ALTER TABLE Cotizacion ADD CONSTRAINT fk_Cotizacion_Contacto FOREIGN KEY (id_contacto) REFERENCES Contacto (id)
	ON DELETE NO ACTION;
ALTER TABLE Inflacion ADD CONSTRAINT fk_Inflacion_Cotizacion FOREIGN KEY (numero_cotizacion) REFERENCES Cotizacion (numero_cotizacion)
	ON DELETE NO ACTION;
ALTER TABLE ProductoCotizacion ADD CONSTRAINT fk_ProductoCotizacion_Producto FOREIGN KEY (codigo_producto) REFERENCES Producto (codigo)
	ON DELETE NO ACTION;
ALTER TABLE ProductoCotizacion ADD CONSTRAINT fk_ProductoCotizacion_Cotizacion FOREIGN KEY (numero_cotizacion) REFERENCES Cotizacion (numero_cotizacion)
	ON DELETE NO ACTION;
ALTER TABLE Producto ADD CONSTRAINT fk_Producto_Familia FOREIGN KEY (codigo_Familia) REFERENCES Familia (codigoFamilia)
	ON DELETE NO ACTION;
ALTER TABLE EjecucionActividad ADD CONSTRAINT fk_EjecucionActividad_Ejecucion FOREIGN KEY (id_ejecucion) REFERENCES Ejecucion (id)
	ON DELETE NO ACTION;
ALTER TABLE EjecucionActividad ADD CONSTRAINT fk_EjecucionActividad_Actividad FOREIGN KEY (id_actividad) REFERENCES Actividad (id)
	ON DELETE NO ACTION;
ALTER TABLE CasosActividad ADD CONSTRAINT fk_CasosActividad_Caso FOREIGN KEY (id_caso) REFERENCES Caso (id)
	ON DELETE NO ACTION;
ALTER TABLE casosActividad ADD CONSTRAINT fk_casosActividad_Actividad FOREIGN KEY (id_actividad) REFERENCES Actividad (id)
	ON DELETE NO ACTION;