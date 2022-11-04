USE CRM
GO

DROP PROCEDURE IF EXISTS procInsertarValorPresenteCotizaciones
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

DROP PROCEDURE IF EXISTS procInsertarCaso
DROP PROCEDURE IF EXISTS procInsertarCasosTarea
DROP PROCEDURE IF EXISTS procInsertarContacto
DROP PROCEDURE IF EXISTS procInsertarContactoTarea
DROP PROCEDURE IF EXISTS procInsertarCotizacionTarea
DROP PROCEDURE IF EXISTS procInsertarDepartamento
DROP PROCEDURE IF EXISTS procInsertarEjecucionActividad
DROP PROCEDURE IF EXISTS procInsertarEstadoCaso
DROP PROCEDURE IF EXISTS procInsertarOrigen
DROP PROCEDURE IF EXISTS procInsertarPrivilegiosXrol
DROP PROCEDURE IF EXISTS procInsertarProductoCotizacion
DROP PROCEDURE IF EXISTS procInsertarTarea
DROP PROCEDURE IF EXISTS procInsertarTipoPrivilegio
DROP PROCEDURE IF EXISTS procInsertarEstadoProducto

DROP PROCEDURE IF EXISTS procModificarCaso
DROP PROCEDURE IF EXISTS procModificarCasosTarea
DROP PROCEDURE IF EXISTS procModificarContacto
DROP PROCEDURE IF EXISTS procModificarContactoTarea
DROP PROCEDURE IF EXISTS procModificarCotizacionTarea
DROP PROCEDURE IF EXISTS procModificarDepartamento
DROP PROCEDURE IF EXISTS procModificarEjecucionActividad
DROP PROCEDURE IF EXISTS procModificarEstadoCaso
DROP PROCEDURE IF EXISTS procModificarOrigen
DROP PROCEDURE IF EXISTS procModificarPrivilegiosXrol
DROP PROCEDURE IF EXISTS procModificarProductoCotizacion
DROP PROCEDURE IF EXISTS procModificarTarea
DROP PROCEDURE IF EXISTS procModificarTipoPrivilegio
DROP PROCEDURE IF EXISTS procModificarEstadoProducto

DROP PROCEDURE IF EXISTS procEliminarCaso
DROP PROCEDURE IF EXISTS procEliminarCasosTarea
DROP PROCEDURE IF EXISTS procEliminarContacto
DROP PROCEDURE IF EXISTS procEliminarContactoTarea
DROP PROCEDURE IF EXISTS procEliminarCotizacionTarea
DROP PROCEDURE IF EXISTS procEliminarDepartamento
DROP PROCEDURE IF EXISTS procEliminarEjecucionActividad
DROP PROCEDURE IF EXISTS procEliminarEstadoCaso
DROP PROCEDURE IF EXISTS procEliminarOrigen
DROP PROCEDURE IF EXISTS procEliminarPrivilegiosXrol
DROP PROCEDURE IF EXISTS procEliminarProductoCotizacion
DROP PROCEDURE IF EXISTS procEliminarTarea
DROP PROCEDURE IF EXISTS procEliminarTipoPrivilegio
DROP PROCEDURE IF EXISTS procEliminarEstadoProducto
DROP PROCEDURE IF EXISTS procBuscarCotizacion
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
-- select * FROM ContactoActividad

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
    @anno int,
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
            @anno, @porcentaje)
        SET @ret = 2
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -2
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
    @fecha_proyeccion_cierre DATE,
    @fecha_cierre DATE,
    @orden_compra VARCHAR(30),
    @descripcion VARCHAR(30),
    @id_etapa VARCHAR(30),
    @id_probabilidad SMALLINT,
    @motivo_denegacion VARCHAR(10),
    @id_competidor VARCHAR(30),
    @ret int OUTPUT
AS
BEGIN
    BEGIN TRY
        DECLARE @nombrecuenta VARCHAR(30), @id_zona INT, @id_sector INT, @id_moneda INT, @id_asesor VARCHAR(30), @cedula_cliente VARCHAR(30)
        -- sacar la cedula del cliente del contacto y guardarlo en @nombre_cuenta 
        SELECT @cedula_cliente = cedula_cliente FROM Contacto WHERE id = @idContacto
        -- sacar el nombre de la cuenta con la cedula del cliente 
        SELECT @nombrecuenta = nombre_cuenta FROM CuentaCliente WHERE cedula_cliente = @cedula_cliente
        -- sacar el id de la zona de la cuenta y guardarlo en @id_zona
        SELECT @id_zona = id_zona FROM Contacto WHERE id = @idContacto
        -- sacar el id del sector de la cuenta y guardarlo en @id_sector
        SELECT @id_sector = id_sector FROM Contacto WHERE id = @idContacto
        -- sacar el id de la moneda de la cuenta y guardarlo en @id_moneda
        SELECT @id_moneda = moneda FROM CuentaCliente WHERE cedula_cliente = @cedula_cliente
        -- sacar el id del asesor de la cuenta y guardarlo en @id_asesor
        SELECT @id_asesor = cedula_usuario FROM Contacto WHERE id = @idContacto
        INSERT INTO Cotizacion
        (
        numero_cotizacion, id_factura, id_contacto, tipo, nombre_oportunidad, fecha_cotizacion, nombre_cuenta, fecha_proyeccion_cierre, fecha_cierre, orden_compra, descripcion, id_zona, id_sector, id_moneda, id_etapa, id_asesor,probabilidad, motivo_denegacion, id_competidor
        )
    VALUES
        (
        @numeroCotizacion, @idFactura, @idContacto, @tipo, @nombre_oportunidad, @fechaCotizacion, @nombrecuenta, @fecha_proyeccion_cierre, @fecha_cierre, @orden_compra, @descripcion, @id_zona, @id_sector, @id_moneda, @id_etapa, @id_asesor, @id_probabilidad, @motivo_denegacion, @id_competidor
        )
		SET @ret = 1
    END TRY
    BEGIN CATCH
        PRINT @@ERROR
        print ERROR_MESSAGE()
        SET @ret = -1
        PRINT @ret
        PRINT @numeroCotizacion
        PRINT @idFactura
        PRINT @idContacto
        PRINT @tipo
        PRINT @nombre_oportunidad
        PRINT @fechaCotizacion
        PRINT @nombrecuenta
        PRINT @fecha_proyeccion_cierre
        PRINT @fecha_cierre
        PRINT @orden_compra
        PRINT @descripcion
        PRINT @id_zona
        PRINT @id_sector
        PRINT @id_moneda
        PRINT @id_etapa
        PRINT @id_asesor
        PRINT @id_probabilidad
        PRINT @motivo_denegacion
        PRINT @id_competidor
        
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
        @fecha_proyeccion_cierre DATE,
        @fecha_cierre DATE,
        @orden_compra VARCHAR(30),
        @descripcion VARCHAR(30),
        @id_etapa VARCHAR(30),
        @id_probabilidad SMALLINT,
        @motivo_denegacion VARCHAR(10),
        @id_competidor VARCHAR(30),
        @ret int OUTPUT
    AS
BEGIN
	DECLARE @nombrecuenta VARCHAR(30), @id_zona INT, @id_sector INT, @id_moneda INT, @id_asesor VARCHAR(30), @cedula_cliente VARCHAR(30)
    BEGIN TRY
            -- sacar la cedula del cliente del contacto y guardarlo en @nombre_cuenta 
            SELECT @cedula_cliente = cedula_cliente FROM Contacto WHERE id = @idContacto
            -- sacar el nombre de la cuenta con la cedula del cliente 
            SELECT @nombrecuenta = nombre_cuenta FROM CuentaCliente WHERE cedula_cliente = @cedula_cliente
            -- sacar el id de la zona de la cuenta y guardarlo en @id_zona
            SELECT @id_zona = id_zona FROM Contacto WHERE id = @idContacto
            -- sacar el id del sector de la cuenta y guardarlo en @id_sector
            SELECT @id_sector = id_sector FROM Contacto WHERE id = @idContacto
            -- sacar el id de la moneda de la cuenta y guardarlo en @id_moneda
            SELECT @id_moneda = moneda FROM CuentaCliente WHERE cedula_cliente = @cedula_cliente
            -- sacar el id del asesor de la cuenta y guardarlo en @id_asesor
            SELECT @id_asesor = cedula_usuario FROM Contacto WHERE id = @idContacto
			PRINT @nombrecuenta
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


/*
##############################################
#####################Caso#####################
##############################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarCaso
  @idCaso INT,
  @proyecto INT,
  @propietarioCaso VARCHAR(30),
  @asunto VARCHAR(255),
  @nombreCuenta VARCHAR(30),
  @nombreContacto VARCHAR(30),
  @descripcion VARCHAR(255),
  @direccion INT,
  @estado VARCHAR(30),
  @tipo VARCHAR(30),
  @prioridad VARCHAR(30),
  @origen VARCHAR(30),
  @ret INT OUTPUT

AS
  BEGIN
	BEGIN TRY
		INSERT INTO Caso (
					id, proyectoAsociado, propietarioCaso,
					asunto, nombreCuenta, nombreContacto,
					descripcion, id_direccion, id_origen,
					id_estado, id_tipo, id_prioridad
					)
		VALUES (
				@idCaso, @proyecto, @propietarioCaso,
				@asunto, @nombreCuenta, @nombreContacto,
				@descripcion, @direccion, @origen,
				@estado, @tipo, @prioridad
				)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. UPDATE
CREATE PROCEDURE procModificarCaso
  @idCaso INT,
  @proyecto INT,
  @propietarioCaso VARCHAR(30),
  @asunto VARCHAR(255),
  @nombreCuenta VARCHAR(30),
  @nombreContacto VARCHAR(30),
  @descripcion VARCHAR(255),
  @direccion INT,
  @estado VARCHAR(30),
  @tipo VARCHAR(30),
  @prioridad VARCHAR(30),
  @origen VARCHAR(30),
  @ret INT OUTPUT


AS
  BEGIN
	BEGIN TRY
		UPDATE Caso
		SET proyectoAsociado = @proyecto, propietarioCaso = @propietarioCaso, asunto = @asunto,
			nombreCuenta = @nombreCuenta, nombreContacto = @nombreContacto, descripcion = @descripcion,
			id_direccion = @direccion, id_estado = @estado, id_tipo = @tipo, id_prioridad = @prioridad,
			id_origen = @origen
		WHERE id = @idCaso
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--3. DELETE
CREATE PROCEDURE procEliminarCaso
  @idCaso INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM CasosActividad
			WHERE id_caso = @idCaso
		DELETE FROM CasosTarea
			WHERE id_caso = @idCaso
		DELETE FROM Caso
			WHERE id = @idCaso
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO


/*
##################################################
#####################Contacto#####################
##################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarContacto
  @id INT,
  @cedula_cliente VARCHAR(30),
  @cedula_usuario VARCHAR(30),
  @tipo_contacto INT,
  @motivo VARCHAR(30),
  @nombre VARCHAR(30),
  @telefono VARCHAR(255),
  @correo_electronico VARCHAR(30),
  @estado INT,
  @direccion INT,
  @descripcion VARCHAR(50),
  @id_zona INT,
  @id_sector INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO Contacto (
					id, cedula_cliente, cedula_usuario, tipo_contacto, motivo, nombre, telefono,
					correo_electronico, estado, direccion, descripcion, id_zona, id_sector
					)
		VALUES (
				  @id, @cedula_cliente, @cedula_usuario, @tipo_contacto, @motivo, @nombre, @telefono,
				  @correo_electronico, @estado, @direccion, @descripcion, @id_zona, @id_sector
				)
					
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. UPDATE
CREATE PROCEDURE procModificarContacto
  @id INT,
  @cedula_cliente VARCHAR(30),
  @cedula_usuario VARCHAR(30),
  @tipo_contacto INT,
  @motivo VARCHAR(30),
  @nombre VARCHAR(30),
  @telefono VARCHAR(255),
  @correo_electronico VARCHAR(30),
  @estado INT,
  @direccion INT,
  @descripcion VARCHAR(50),
  @id_zona INT,
  @id_sector INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		UPDATE Contacto
		SET cedula_cliente = @cedula_cliente, cedula_usuario = @cedula_usuario, tipo_contacto = @tipo_contacto,
			motivo = @motivo, nombre = @nombre, telefono = @telefono, correo_electronico = @correo_electronico,
			estado = @estado, direccion = @direccion, descripcion = @descripcion, id_zona = @id_zona, id_sector = @id_sector
			WHERE id = @id
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--3. DELETE
CREATE PROCEDURE procEliminarContacto
  @id INT,
  @ret INT OUTPUT

AS
  BEGIN
	BEGIN TRY
		DELETE FROM ContactoTarea
			WHERE id_contacto = @id
		DELETE FROM ContactoActividad
			WHERE id_contacto = @id
		DELETE FROM Contacto
			WHERE id = @id
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

/*
######################################################
#####################Departamento#####################
######################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarDepartamento
  @id INT,
  @nombre VARCHAR(20),
  @ret INT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO Departamento VALUES (@id, @nombre)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. UPDATE
CREATE PROCEDURE procModificarDepartamento
  @id INT,
  @nombre VARCHAR(20),
  @ret INT
AS
  BEGIN
	BEGIN TRY
		UPDATE Departamento
		SET nombre = @nombre
			WHERE id = @id
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--3. DELETE
CREATE PROCEDURE procEliminarDepartamento
  @id INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM Departamento
			WHERE id = @id
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

/*
######################################################
##################### Origen #####################
######################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarOrigen
  @id INT,
  @nombre VARCHAR(20),
  @ret INT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO Departamento VALUES (@id, @nombre)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. UPDATE
CREATE PROCEDURE procModificarOrigen
  @id INT,
  @nombre VARCHAR(20),
  @ret INT
AS
  BEGIN
	BEGIN TRY
		UPDATE Departamento
		SET nombre = @nombre
			WHERE id = @id
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--3. DELETE
CREATE PROCEDURE procEliminarOrigen
  @id INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM Origen
			WHERE id = @id
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

/*
#################################################
##################### Tarea #####################
#################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarTarea
  @id INT,
  @fecha_finalizacion DATE,
  @fecha_creacion DATE,
  @estado INT,
  @descripcion VARCHAR(20),
  @ret INT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO Tarea VALUES (@id, @fecha_finalizacion, @fecha_creacion, @estado, @descripcion)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. UPDATE
CREATE PROCEDURE procModificarTarea
  @id INT,
  @fecha_finalizacion DATE,
  @fecha_creacion DATE,
  @estado INT,
  @descripcion VARCHAR(20),
  @ret INT
AS
  BEGIN
	BEGIN TRY
		UPDATE Tarea
		SET fecha_finalizacion = @fecha_finalizacion, fecha_creacion = @fecha_creacion, estado = @estado, descripcion = @descripcion
			WHERE id = @id
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--3. DELETE
CREATE PROCEDURE procEliminarTarea 
  @id INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM Origen
			WHERE id = @id
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO


/*
#################################################
##################### CasosTarea #####################
#################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarCasosTarea
  @id_caso INT,
  @id_tarea INT,
  @ret INT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO CasosTarea VALUES (@id_caso, @id_tarea)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. DELETE
CREATE PROCEDURE procEliminarCasosTarea
  @id_caso INT,
  @id_tarea INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM CasosTarea
			WHERE id_caso = @id_caso AND id_tarea = @id_tarea
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO


/*
#################################################
##################### ContactoTarea #####################
#################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarContactoTarea
  @id_contacto INT,
  @id_tarea INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO ContactoTarea (id_contacto, id_tarea)VALUES (@id_contacto, @id_tarea)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. DELETE
CREATE PROCEDURE procEliminarContactoTarea
  @id_contacto INT,
  @id_tarea INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM ContactoTarea
			WHERE id_contacto = @id_contacto AND id_tarea = @id_tarea
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

/*
#################################################
##################### CotizacionTarprocInsertarEjecucionActividadea #####################
#################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarCotizacionTarea
  @id_cotizacion INT,
  @id_tarea INT,
  @ret INT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO CotizacionTarea VALUES (@id_cotizacion, @id_tarea)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. DELETE
CREATE PROCEDURE procEliminarCotizacionTarea
  @id_cotizacion INT,
  @id_tarea INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM CotizacionTarea
			WHERE id_cotizacion = @id_cotizacion AND id_tarea = @id_tarea
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO


/*
#################################################
##################### EjecucionActividad #####################
#################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarEjecucionActividad
  @id_ejecucion INT,
  @id_actividad INT,
  @ret INT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO EjecucionActividad VALUES (@id_ejecucion, @id_actividad)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. DELETE
CREATE PROCEDURE procEliminarEjecucionActividad
  @id_ejecucion INT,
  @id_actividad INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM EjecucionActividad
			WHERE id_ejecucion = @id_ejecucion AND id_actividad = @id_actividad
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO



/*
#################################################
##################### EstadoCaso #####################
#################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarEstadoCaso
  @id INT,
  @estado VARCHAR(30),
  @ret INT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO EstadoCaso VALUES (@id, @estado)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. UPDATE
CREATE PROCEDURE procModificarEstadoCaso
  @id INT,
  @estado VARCHAR(20),
  @ret INT
	AS
		BEGIN
		BEGIN TRY
			UPDATE EstadoCaso
			SET estado = @estado
				WHERE id = @id
			SET @ret = 1
		END TRY
		BEGIN CATCH
			print @@ERROR
			PRINT ERROR_MESSAGE()
			SET @ret = -1
			PRINT @ret
		END CATCH
		END
	GO

--3. DELETE
CREATE PROCEDURE procEliminarEstadoCaso
  @id INT,
  @estado VARCHAR(30),
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM EstadoCaso
			WHERE id = @id AND estado = @estado
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO



/*
#################################################
##################### PrivilegiosXrol #####################
#################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarPrivilegiosXrol
  @id_rol INT,
  @id_privilegio INT,
  @ret INT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO PrivilegiosXrol VALUES (@id_rol, @id_privilegio)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. DELETE
CREATE PROCEDURE procEliminarPrivilegiosXrol
  @id_rol INT,
  @id_privilegio INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM PrivilegiosXrol
			WHERE id_rol = @id_rol AND id_privilegio = @id_privilegio
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO


/*
#################################################
##################### ProductoCotizacion ########
#################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarProductoCotizacion
  @codigo_producto INT,
  @numero_cotizacion INT,
  --@precio_negociado FLOAT,
  @cantidad INT,
  @ret INT
AS
  BEGIN
	BEGIN TRY
        DECLARE @precioProducto FLOAT
        SELECT @precioProducto = precio_estandar FROM Producto WHERE codigo = @codigo_producto
		INSERT INTO ProductoCotizacion VALUES (@codigo_producto, @numero_cotizacion, @cantidad*@precioProducto, @cantidad)		
        SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. DELETE
CREATE PROCEDURE procEliminarProductoCotizacion
  @codigo_producto INT,
  @numero_cotizacion INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM ProductoCotizacion
			WHERE codigo_producto = @codigo_producto AND numero_cotizacion = @numero_cotizacion
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO


/*
#################################################
##################### TipoPrivilegio ############
#################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarTipoPrivilegio
  @id INT,
  @tipo VARCHAR(30),
  @ret INT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO TipoPrivilegio VALUES (@id, @tipo)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. UPDATE
CREATE PROCEDURE procModificarTipoPrivilegio
  @id INT,
  @tipo VARCHAR(20),
  @ret INT
	AS
		BEGIN
		BEGIN TRY
			UPDATE TipoPrivilegio
			SET tipo = @tipo
				WHERE id = @id
			SET @ret = 1
		END TRY
		BEGIN CATCH
			print @@ERROR
			PRINT ERROR_MESSAGE()
			SET @ret = -1
			PRINT @ret
		END CATCH
		END
	GO

--3. DELETE
CREATE PROCEDURE procEliminarTipoPrivilegio
  @id INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM TipoPrivilegio
			WHERE id = @id
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

/*
#################################################
##################### EstadoProducto ############
#################################################
*/
--1. INSERT
CREATE PROCEDURE procInsertarEstadoProducto
  @id INT,
  @estado VARCHAR(30),
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		INSERT INTO EstadoProducto VALUES (@id, @estado)
		SET @ret = 1
	END TRY
	BEGIN CATCH
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

--2. UPDATE
CREATE PROCEDURE procModificarEstadoProducto
  @id INT,
  @estado VARCHAR(20),
  @ret INT OUTPUT
	AS
		BEGIN
		BEGIN TRY
			UPDATE EstadoProducto
			SET estado = @estado
				WHERE id = @id
			SET @ret = 1
		END TRY
		BEGIN CATCH
			print @@ERROR
			PRINT ERROR_MESSAGE()
			SET @ret = -1
			PRINT @ret
		END CATCH
		END
	GO

--3. DELETE
CREATE PROCEDURE procEliminarEstadoProducto
  @id INT,
  @ret INT OUTPUT
AS
  BEGIN
	BEGIN TRY
		DELETE FROM EstadoProducto
			WHERE id = @id
		SET @ret = 1
	END TRY
	BEGIN CATCH
		--Se maneja un posible error generado en el try
		print @@ERROR
		PRINT ERROR_MESSAGE()
		SET @ret = -1
		PRINT @ret
	END CATCH
  END
GO

/* procedimiento almacenado que busca una cotizacion por su id
*/
CREATE PROCEDURE procBuscarCotizacion
  @id INT,
  @ret INT OUTPUT
AS
    BEGIN
        BEGIN TRY
            SELECT * FROM Cotizacion WHERE numero_cotizacion = @id
            SET @ret = 1
        END TRY
        BEGIN CATCH
            --Se maneja un posible error generado en el try
            print @@ERROR
            PRINT ERROR_MESSAGE()
            SET @ret = -1
            PRINT @ret
        END CATCH
    END

EXECUTE procEliminarProductoCotizacion 6,1,1