DROP PROCEDURE IF EXISTS Actividad_Insert
DROP PROCEDURE IF EXISTS Actividad_Update
DROP PROCEDURE IF EXISTS Actividad_Delete
DROP PROCEDURE IF EXISTS CasosActividad_Insert
DROP PROCEDURE IF EXISTS CasosActividad_Update
DROP PROCEDURE IF EXISTS CasosActividad_Delete
DROP PROCEDURE IF EXISTS Cliente_Insert
DROP PROCEDURE IF EXISTS Cliente_Update
DROP PROCEDURE IF EXISTS Cliente_Delete
DROP PROCEDURE IF EXISTS ContactoActividad_Insert
DROP PROCEDURE IF EXISTS ContactoActividad_Update
DROP PROCEDURE IF EXISTS ContactoActividad_Delete
DROP PROCEDURE IF EXISTS CotizacionActividad_Insert
DROP PROCEDURE IF EXISTS CotizacionActividad_Update
DROP PROCEDURE IF EXISTS CotizacionActividad_Delete
DROP PROCEDURE IF EXISTS CuentaCliente_Insert
DROP PROCEDURE IF EXISTS CuentaCliente_Update
DROP PROCEDURE IF EXISTS CuentaCliente_Delete
DROP PROCEDURE IF EXISTS Ejecucion_Insert
DROP PROCEDURE IF EXISTS Ejecucion_Update
DROP PROCEDURE IF EXISTS Ejecucion_Delete
DROP PROCEDURE IF EXISTS EjecucionTarea_Insert
DROP PROCEDURE IF EXISTS EjecucionTarea_Update
DROP PROCEDURE IF EXISTS EjecucionTarea_Delete
DROP PROCEDURE IF EXISTS Inflacion_Insert
DROP PROCEDURE IF EXISTS Inflacion_Update
DROP PROCEDURE IF EXISTS Inflacion_Delete
DROP PROCEDURE IF EXISTS Prioridad_Insert
DROP PROCEDURE IF EXISTS Prioridad_Update
DROP PROCEDURE IF EXISTS Prioridad_Delete
DROP PROCEDURE IF EXISTS Producto_Insert
DROP PROCEDURE IF EXISTS Producto_Update
DROP PROCEDURE IF EXISTS Producto_Delete
DROP PROCEDURE IF EXISTS Rol_Insert
DROP PROCEDURE IF EXISTS Rol_Update
DROP PROCEDURE IF EXISTS Rol_Delete
DROP PROCEDURE IF EXISTS TipoCaso_Insert
DROP PROCEDURE IF EXISTS TipoCaso_Update
DROP PROCEDURE IF EXISTS TipoCaso_Delete
DROP PROCEDURE IF EXISTS UsuarioRoles_Insert
DROP PROCEDURE IF EXISTS UsuarioRoles_Update
DROP PROCEDURE IF EXISTS UsuarioRoles_Delete
DROP PROCEDURE IF EXISTS Cotizacion_Insert
DROP PROCEDURE IF EXISTS Cotizacion_Update
DROP PROCEDURE IF EXISTS Cotizacion_Delete
GO

-- procedimientos almacenados para la tabla: "Actividad"

CREATE PROCEDURE Actividad_Insert
    @idActividad int,
    @descripcion varchar(30),
    @fecha_finalizacion date,
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Actividad
        (
        id, descripcion, fecha_finalizacion
        )
    VALUES
        (
            @idActividad, @descripcion, @fecha_finalizacion)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE ACTIVIDAD

CREATE PROCEDURE Actividad_Update
        @idActividad int,
        @descripcion varchar(30),
        @fecha_finalizacion date,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE Actividad
        SET
            descripcion = @descripcion,
            fecha_finalizacion = @fecha_finalizacion
        WHERE id = @idActividad
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO
-- DELETE ACTIVIDAD

CREATE PROCEDURE Actividad_Delete
        @idActividad int,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM Actividad
        WHERE id = @idActividad
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO 

--  Procedimiento para insertar datos en la tabla CasoSActividad

CREATE PROCEDURE CasosActividad_Insert
    @idCaso int,
    @idActividad int,
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO CasoSActividad
        (
        id_caso, id_actividad
        )
    VALUES
        (
            @idCaso, @idActividad)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE CasoActividad
/*
CREATE PROCEDURE CasosActividad_Update
        @idCaso int,
        @idActividad int,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE CasosActividad
        SET
            id_actividad = @idActividad
        WHERE id_caso = @idCaso and id_actividad = @idActividad
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO
*/
-- DELETE CasoActividad

CREATE PROCEDURE CasosActividad_Delete
        @idCaso int,
		@idActividad int,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM CasosActividad
        WHERE id_caso = @idCaso and id_actividad = @idActividad
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla Cliente 

CREATE PROCEDURE Cliente_Insert
    @cedula VARCHAR(30),
    @telefono varchar(30),
    @celular varchar(30),
    @nombre varchar(30),
    @apellido1 varchar(30),
    @apellido2 varchar(30),
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Cliente(cedula, telefono, celular, nombre, apellido1, apellido2
        )
    VALUES
        (
            @cedula, @telefono, @celular, @nombre, @apellido1, @apellido2)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE Cliente

CREATE PROCEDURE Cliente_Update
        @cedula VARCHAR(30),
        @telefono varchar(30),
        @celular varchar(30),
        @nombre varchar(30),
        @apellido1 varchar(30),
        @apellido2 varchar(30),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE Cliente
        SET
            telefono = @telefono,
            celular = @celular,
            nombre = @nombre,
            apellido1 = @apellido1,
            apellido2 = @apellido2
        WHERE cedula = @cedula
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO
-- DELETE Cliente

CREATE PROCEDURE Cliente_Delete
        @cedula int,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM Cliente
        WHERE cedula = @cedula
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla ContactoActividad

CREATE PROCEDURE ContactoActividad_Insert
    @idContacto int,
    @idActividad int,
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO ContactoActividad(
        id_contacto, id_actividad)
    VALUES(@idContacto, @idActividad)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE ContactoActividad
/*
CREATE PROCEDURE ContactoActividad_Update
        @idContacto int,
        @idActividad int,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE ContactoActividad
        SET
            id_actividad = @idActividad
        WHERE id_contacto = @idContacto
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO
*/
-- DELETE ContactoActividad

CREATE PROCEDURE ContactoActividad_Delete
        @idContacto int,
		@idActividad int,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM ContactoActividad
        WHERE id_contacto = @idContacto and id_actividad  = @idActividad
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla CotizacionActividad

CREATE PROCEDURE CotizacionActividad_Insert
    @idCotizacion int,
    @idActividad int,
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO CotizacionActividad
        (
        id_cotizacion, id_actividad
        )
    VALUES
        (
            @idCotizacion, @idActividad)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE CotizacionActividad

/*
CREATE PROCEDURE CotizacionActividad_Update
        @idCotizacion int,
        @idActividad int,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE CotizacionActividad
        SET
            id_actividad = @idActividad
        WHERE id_cotizacion = @idCotizacion
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO
*/

-- DELETE CotizacionActividad

CREATE PROCEDURE CotizacionActividad_Delete
        @idCotizacion int,
        @idActividad int,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM CotizacionActividad
        WHERE id_cotizacion = @idCotizacion and id_actividad = @idActividad
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla CuentaCliente

CREATE PROCEDURE CuentaCliente_Insert
    @id int,
    @cedula_cliente VARCHAR(30),
    @nombre_cuenta VARCHAR(30),
    @moneda int,
    @contacto_principal varchar(30),
    @sitio_web varchar(50),
    @informacion_adicional varchar(50),
    @correo_electronico varchar(50),
    @id_zona int,
    @id_sector int,
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO CuentaCliente
        (
        id, cedula_cliente, nombre_cuenta, moneda, contacto_principal, sitio_web, informacion_adicional, correo_electronico, id_zona, id_sector
        )
    VALUES
        (
            @id, @cedula_cliente, @nombre_cuenta, @moneda, @contacto_principal, @sitio_web, @informacion_adicional, @correo_electronico, @id_zona, @id_sector)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE CuentaCliente

CREATE PROCEDURE CuentaCliente_Update
        @id int,
        @cedula_cliente VARCHAR(30),
        @nombre_cuenta VARCHAR(30),
        @moneda int,
        @contacto_principal varchar(30),
        @sitio_web varchar(50),
        @informacion_adicional varchar(50),
        @correo_electronico varchar(50),
        @id_zona int,
        @id_sector int,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE CuentaCliente
        SET
            cedula_cliente = @cedula_cliente,
			nombre_cuenta = @nombre_cuenta,
            moneda = @moneda,
            contacto_principal = @contacto_principal,
            sitio_web = @sitio_web,
            informacion_adicional = @informacion_adicional,
            correo_electronico = @correo_electronico,
            id_zona = @id_zona,
            id_sector = @id_sector
        WHERE id = @id AND nombre_cuenta = @nombre_cuenta
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- DELETE CuentaCliente

CREATE PROCEDURE CuentaCliente_Delete
        @id int,
        @nombre_cuenta VARCHAR(30),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM CuentaCliente
        WHERE id = @id AND nombre_cuenta = @nombre_cuenta
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla Ejecucion

CREATE PROCEDURE Ejecucion_Insert
    @id int,
    @numeroCotizacion int,
    @asesor VARCHAR(30),
    @fechaEjecucion date,
    @nombreCuenta VARCHAR(30),
    @nombreEjecucion VARCHAR(30),
    @propietarioEjecucion VARCHAR(30),
    @añoProyectadoCierre int,
    @mesProyectadoCierre int,
    @fechaCierre date,
    @id_departamento INT,
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Ejecucion
        (
        id, numerocotizacion, asesor, fechaejecucion, nombrecuenta, nombreejecucion, propietarioejecucion, añoproyectadocierre, mesproyectadocierre, fechacierre, id_departamento
        )
    VALUES
        (
            @id, @numeroCotizacion, @asesor, @fechaEjecucion, @nombreCuenta, @nombreEjecucion, @propietarioEjecucion, @añoProyectadoCierre, @mesProyectadoCierre, @fechaCierre, @id_departamento)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE Ejecucion

CREATE PROCEDURE Ejecucion_Update
        @id int,
        @numeroCotizacion int,
        @asesor VARCHAR(30),
        @fechaEjecucion date,
        @nombreCuenta VARCHAR(30),
        @nombreEjecucion VARCHAR(30),
        @propietarioEjecucion VARCHAR(30),
        @añoProyectadoCierre int,
        @mesProyectadoCierre int,
        @fechaCierre date,
        @id_departamento VARCHAR(30),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE Ejecucion
        SET
            numerocotizacion = @numeroCotizacion,
            asesor = @asesor,
            fechaejecucion = @fechaEjecucion,
            nombrecuenta = @nombreCuenta,
            nombreejecucion = @nombreEjecucion,
            propietarioejecucion = @propietarioEjecucion,
            añoproyectadocierre = @añoProyectadoCierre,
            mesproyectadocierre = @mesProyectadoCierre,
            fechacierre = @fechaCierre,
            id_departamento = @id_departamento
        WHERE id = @id and nombrecuenta = @nombreCuenta
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- DELETE Ejecucion

CREATE PROCEDURE Ejecucion_Delete
        @id int,
        @nombreCuenta VARCHAR(30),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM Ejecucion
        WHERE id = @id
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla EjecucionTarea

CREATE PROCEDURE EjecucionTarea_Insert
    @id_ejecucion int,
    @id_tarea int,
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO EjecucionTarea
        (
        id_ejecucion, id_tarea
        )
    VALUES
        (
            @id_ejecucion, @id_tarea)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE EjecucionTarea

CREATE PROCEDURE EjecucionTarea_Update
        @id_ejecucion int,
        @id_tarea int,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE EjecucionTarea
        SET
            id_ejecucion = @id_ejecucion,
            id_tarea = @id_tarea
        WHERE id_ejecucion = @id_ejecucion AND id_tarea = @id_tarea
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- DELETE EjecucionTarea

CREATE PROCEDURE EjecucionTarea_Delete
        @id_ejecucion int,
        @id_tarea int,
        @ret int OUTPUT
    AS 
BEGIN
    BEGIN TRY
        DELETE FROM EjecucionTarea
        WHERE id_ejecucion = @id_ejecucion AND id_tarea = @id_tarea
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla Inflacion

CREATE PROCEDURE Inflacion_Insert
    @año int,
    @porcentaje float,
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Inflacion
        (
        anno, porcentaje
        )
    VALUES
        (
            @año, @porcentaje)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE Inflacion

CREATE PROCEDURE Inflacion_Update
        @año int,
        @porcentaje float,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE Inflacion
        SET
            anno = @año,
            porcentaje = @porcentaje
        WHERE anno = @año
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- DELETE Inflacion

CREATE PROCEDURE Inflacion_Delete
        @año int,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM Inflacion
        WHERE anno = @año
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla Prioridad

CREATE PROCEDURE Prioridad_Insert
    @id varchar(30),
    @prioridad varchar(30),
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Prioridad
        (
        id, prioridad
        )
    VALUES
        (
            @id, @prioridad)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE Prioridad

CREATE PROCEDURE Prioridad_Update
        @id varchar(30),
        @prioridad varchar(30),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE Prioridad
        SET
            id = @id,
            prioridad = @prioridad
        WHERE id = @id
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- DELETE Prioridad

CREATE PROCEDURE Prioridad_Delete
        @id varchar(30),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM Prioridad
        WHERE id = @id
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla Producto

CREATE PROCEDURE Producto_Insert
    @codigo INT,
    @codigo_familia INT,
    @nombre VARCHAR(30),
    @precioEstandar INT,
    @estado INT,
    @descripcion VARCHAR(30),
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Producto
        (
        codigo, codigo_familia, nombre, precio_estandar, estado, descripcion
        )
    VALUES
        (
            @codigo, @codigo_familia, @nombre, @precioEstandar, @estado, @descripcion)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE Producto

CREATE PROCEDURE Producto_Update
        @codigo INT,
        @codigo_familia INT,
        @nombre VARCHAR(30),
        @precioEstandar INT,
        @estado INT,
        @descripcion VARCHAR(30),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE Producto
        SET
            codigo = @codigo,
            codigo_familia = @codigo_familia,
            nombre = @nombre,
            precio_estandar = @precioEstandar,
            estado = @estado,
            descripcion = @descripcion
        WHERE codigo = @codigo
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- DELETE Producto

CREATE PROCEDURE Producto_Delete
        @codigo INT,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM Producto
        WHERE codigo = @codigo
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla Rol

CREATE PROCEDURE Rol_Insert
    @id INT,
    @tipo VARCHAR(15),
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Rol
        (
        id, tipo
        )
    VALUES
        (
            @id, @tipo)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE Rol

CREATE PROCEDURE Rol_Update
        @id INT,
        @tipo VARCHAR(15),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE Rol
        SET
            id = @id,
            tipo = @tipo
        WHERE id = @id
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- DELETE Rol

CREATE PROCEDURE Rol_Delete
        @id INT,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM Rol
        WHERE id = @id
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla TipoCaso

CREATE PROCEDURE TipoCaso_Insert
    @id varchar(30),
    @tipo VARCHAR(30),
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO TipoCaso
        (
        id, tipo
        )
    VALUES
        (
            @id, @tipo)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE TipoCaso

CREATE PROCEDURE TipoCaso_Update
        @id varchar(30),
        @tipo VARCHAR(30),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE TipoCaso
        SET
            id = @id,
            tipo = @tipo
        WHERE id = @id
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- DELETE TipoCaso

CREATE PROCEDURE TipoCaso_Delete
        @id varchar(30),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM TipoCaso
        WHERE id = @id
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla UsuarioRoles

CREATE PROCEDURE UsuarioRoles_Insert
    @id_rol INT,
    @cedula_usuario VARCHAR(30),
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO UsuarioRoles
        (
        id_rol, cedula_usuario
        )
    VALUES
        (
            @id_rol, @cedula_usuario)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE UsuarioRoles

CREATE PROCEDURE UsuarioRoles_Update
        @id_rol INT,
        @cedula_usuario VARCHAR(30),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE UsuarioRoles
        SET
            id_rol = @id_rol,
            cedula_usuario = @cedula_usuario
        WHERE id_rol = @id_rol AND cedula_usuario = @cedula_usuario
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- DELETE UsuarioRoles

CREATE PROCEDURE UsuarioRoles_Delete
        @id_rol INT,
        @cedula_usuario INT,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM UsuarioRoles
        WHERE id_rol = @id_rol and cedula_usuario = @cedula_usuario
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- Procedimiento para insertar datos en la tabla Cotizacion

CREATE PROCEDURE Cotizacion_Insert
    @numeroCotizacion INT,
    @idFactura INT,
    @idContacto INT,
    @tipo VARCHAR(30),
    @nombre_oportunidad VARCHAR(30),
    @fechaCotizacion DATE,
    @nombrecuenta VARCHAR(30),
    @fecha_proyeccion_cierre DATE,
    @fecha_cierre DATE,
    @orden_compra VARCHAR(30),
    @descripcion VARCHAR(30),
    @precio_negociado float,
    @id_zona INT,
    @id_sector INT,
    @id_moneda INT,
    @id_etapa VARCHAR(30),
    @id_asesor varchar(30),
    @id_probabilidad SMALLINT,
    @motivo_denegacion VARCHAR(10),
    @id_competidor VARCHAR(30),
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Cotizacion
        (
        numero_cotizacion, id_factura, id_contacto, tipo, nombre_oportunidad, fecha_cotizacion, nombre_cuenta, fecha_proyeccion_cierre, fecha_cierre, orden_compra, descripcion, precio_negociado, id_zona, id_sector, id_moneda, id_etapa, id_asesor,probabilidad, motivo_denegacion, id_competidor
        )
    VALUES
        (
            @numeroCotizacion, @idFactura, @idContacto, @tipo, @nombre_oportunidad, @fechaCotizacion, @nombrecuenta, @fecha_proyeccion_cierre, @fecha_cierre, @orden_compra, @descripcion, @precio_negociado, @id_zona, @id_sector, @id_moneda, @id_etapa, @id_asesor, @id_probabilidad, @motivo_denegacion, @id_competidor)
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- UDPATE Cotizacion

CREATE PROCEDURE Cotizacion_Update
        @numeroCotizacion INT,
        @idFactura INT,
        @idContacto INT,
        @tipo VARCHAR(30),
        @nombre_oportunidad VARCHAR(30),
        @fechaCotizacion DATE,
        @nombrecuenta VARCHAR(30),
        @fecha_proyeccion_cierre DATE,
        @fecha_cierre DATE,
        @orden_compra VARCHAR(30),
        @descripcion VARCHAR(30),
        @precio_negociado float,
        @id_zona INT,
        @id_sector INT,
        @id_moneda INT,
        @id_etapa VARCHAR(30),
        @id_asesor varchar(30),
        @id_probabilidad SMALLINT,
        @motivo_denegacion VARCHAR(10),
        @id_competidor VARCHAR(30),
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        UPDATE Cotizacion
        SET
            numero_Cotizacion = @numeroCotizacion,
            id_Factura = @idFactura,
            id_Contacto = @idContacto,
            tipo = @tipo,
            nombre_oportunidad = @nombre_oportunidad,
            fecha_Cotizacion = @fechaCotizacion,
            nombre_cuenta = @nombrecuenta,
            fecha_proyeccion_cierre = @fecha_proyeccion_cierre,
            fecha_cierre = @fecha_cierre,
            orden_compra = @orden_compra,
            descripcion = @descripcion,
            precio_negociado = @precio_negociado,
            id_zona = @id_zona,
            id_sector = @id_sector,
            id_moneda = @id_moneda,
            id_etapa = @id_etapa,
            id_asesor = @id_asesor,
            probabilidad = @id_probabilidad,
            motivo_denegacion = @motivo_denegacion,
            id_competidor = @id_competidor
        WHERE numero_Cotizacion = @numeroCotizacion
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO

-- DELETE Cotizacion

CREATE PROCEDURE Cotizacion_Delete
        @numeroCotizacion INT,
        @ret int OUTPUT
    AS
BEGIN
    BEGIN TRY
        DELETE FROM Cotizacion
        WHERE numero_Cotizacion = @numeroCotizacion
        SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
    END CATCH
END
GO
