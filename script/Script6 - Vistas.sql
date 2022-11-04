USE CRM
GO

DROP VIEW IF EXISTS vProductosInfoGeneral
DROP VIEW IF EXISTS vClienteInfoGeneral
DROP VIEW IF EXISTS vProductosXcotizacion
DROP VIEW IF EXISTS vContactosInfoGeneral
DROP VIEW IF EXISTS vCotizacionInfoGeneral
DROP PROCEDURE IF EXISTS procObtenerContactosPorCliente
DROP PROCEDURE IF EXISTS procObtenerProductoPorCotizacion
GO

CREATE VIEW vProductosInfoGeneral AS
	SELECT p.codigo, f.nombre AS familia, p.nombre, p.precio_estandar, e.nombre AS estado, p.descripcion
	FROM Producto p, familia f, estado e
	WHERE p.codigo_Familia = f.codigo AND p.estado = e.id;
GO

/*Se debe reemplazar por cuenta cliente*/
CREATE VIEW vClienteInfoGeneral AS
	SELECT c.id, c.cedula_cliente, c.nombre_cuenta, m.nombre AS moneda,
			contacto_principal, sitio_web, informacion_adicional, correo_electronico,
			zn.nombre AS zona, SC.nombre AS Sector
		FROM CuentaCliente c
		INNER JOIN zona zn ON zn.id = c.id_zona
		INNER JOIN Moneda m ON m.id = c.moneda
		INNER JOIN Sector sc ON sc.id = c.id_sector;
GO


CREATE VIEW vContactosInfoGeneral AS
	SELECT con.id, con.cedula_cliente,
			cl.nombre + ' ' + cl.apellido1 + ' ' + cl.apellido2 AS Cliente,
			us.nombre + ' ' + us.apellido1 + ' ' + us.apellido2 AS Asesor,
			tcon.tipo, con.motivo, con.nombre AS nombre_contacto_especifico ,
			con.telefono AS telefono_contacto_especifico, con.correo_electronico,
			est.nombre AS estado,
			prov.nombre + ', '  + can.nombre + ', ' + dis.nombre AS direccion,
			con.descripcion, zn.nombre AS zona, sec.nombre AS sector
		FROM Contacto con
		INNER JOIN Cliente cl ON cl.cedula = con.cedula_cliente
		INNER JOIN Usuario us ON us.cedula = con.cedula_usuario
		INNER JOIN TipoContacto tcon ON tcon.id = con.tipo_contacto
		INNER JOIN Estado est ON est.id = con.estado
		INNER JOIN Zona zn ON zn.id = con.id_zona
		INNER JOIN Sector sec ON sec.id = con.id_sector
		INNER JOIN Direccion dir ON dir.id = con.direccion
		INNER JOIN Provincia prov ON prov.id = dir.id_provincia
		INNER JOIN Canton can ON can.id = dir.id_canton
		INNER JOIN Distrito dis ON dis.id = dir.id_distrito
GO


CREATE VIEW vCotizacionInfoGeneral AS
	SELECT numero_cotizacion, id_factura, id_contacto, tipo, nombre_oportunidad,
			fecha_cotizacion, nombre_cuenta, fecha_proyeccion_cierre, fecha_cierre,
			orden_compra, coti.descripcion, zn.nombre AS zona, sec.nombre AS sector,
			mo.nombre, id_etapa AS etapa, ase.nombre + ' ' + ase.apellido1 + ' ' + ase.apellido2 AS asesor, probabilidad, moti.descripcion AS motivo ,
			id_competidor AS competidor
		FROM Cotizacion coti
			INNER JOIN Zona zn ON zn.id = coti.id_zona
			INNER JOIN Sector sec ON sec.id = coti.id_sector
			INNER JOIN Moneda mo ON mo.id = coti.id_moneda
			INNER JOIN Motivo moti ON moti.id = coti.motivo_denegacion
			INNER JOIN Usuario ase ON ase.cedula = coti.id_asesor
GO

CREATE PROCEDURE procObtenerContactosPorCliente
	@cedula_cliente VARCHAR(30),
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT *
			FROM vContactosInfoGeneral vcon
			WHERE vcon.cedula_cliente = @cedula_cliente

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

/* Procedimiento que obtenga producto por cotizacion */
CREATE VIEW vProductosXcotizacion AS 
	SELECT pc.numero_cotizacion, p.codigo as codigo,f.nombre as Familia, p.nombre,p.precio_estandar,
		e.nombre AS Estado, p.descripcion, COUNT(*) AS Cantidad
			FROM ProductoCotizacion pc, Producto p, Estado e, Familia F
				WHERE p.estado = e.id and p.codigo_Familia = f.codigo AND
						pc.codigo_producto = P.codigo
				GROUP BY pc.numero_cotizacion, p.codigo ,f.nombre , p.nombre,p.precio_estandar, e.nombre, p.descripcion
GO

CREATE PROCEDURE procObtenerProductoPorCotizacion
	@numero_cotizacion INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT * FROM vProductosXcotizacion
			WHERE numero_cotizacion = @numero_cotizacion
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

DROP PROCEDURE IF EXISTS procBuscarProducto
GO
CREATE PROCEDURE procBuscarProducto
	@codigo INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT * FROM Producto
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

DROP PROCEDURE IF EXISTS procBuscarCliente
GO
CREATE PROCEDURE procBuscarCliente
	@cedula INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT * FROM Cliente
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

DROP PROCEDURE IF EXISTS procBuscarContacto
GO
CREATE PROCEDURE procBuscarContacto
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM Contacto
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


DROP PROCEDURE IF EXISTS procBuscarDireccion
GO
CREATE PROCEDURE procBuscarDireccion
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM Direccion
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

DROP PROCEDURE IF EXISTS procBuscarProvincia
GO
CREATE PROCEDURE procBuscarProvincia
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM Provincia
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

DROP PROCEDURE IF EXISTS procBuscarCanton
GO
CREATE PROCEDURE procBuscarCanton
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM Canton
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

DROP PROCEDURE IF EXISTS procBuscarDistrito
GO
CREATE PROCEDURE procBuscarDistrito
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM Distrito
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

DROP PROCEDURE IF EXISTS procBuscarUsuario
GO
CREATE PROCEDURE procBuscarUsuario
	@cedula INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM Usuario
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

DROP PROCEDURE IF EXISTS procBuscarZona
GO
CREATE PROCEDURE procBuscarZona
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM Zona
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

DROP PROCEDURE IF EXISTS procBuscarSector
GO
CREATE PROCEDURE procBuscarSector
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM Sector
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


DROP PROCEDURE IF EXISTS procBuscarTipoContacto
GO
CREATE PROCEDURE procBuscarTipoContacto
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM TipoContacto
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


DROP PROCEDURE IF EXISTS procBuscarEstadoContacto
GO
CREATE PROCEDURE procBuscarEstadoContacto
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT *
		FROM Estado
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


DROP PROCEDURE IF EXISTS procBuscarActividadContacto
GO
CREATE PROCEDURE procBuscarActividadContacto
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT id, descripcion, fecha_finalizacion
		FROM ContactoActividad, Actividad
			WHERE id_contacto = @id AND id_actividad = Actividad.id
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

DROP PROCEDURE IF EXISTS procBuscarActividad
GO
CREATE PROCEDURE procBuscarActividad
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
		SELECT id, descripcion, fecha_finalizacion
		FROM ContactoActividad, Actividad
			WHERE id_contacto = @id AND id_actividad = Actividad.id
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


DROP PROCEDURE IF EXISTS procBuscarTareaContacto
GO
CREATE PROCEDURE procBuscarTareaContacto
	@id INT,
	@ret INT OUTPUT
AS
BEGIN
	BEGIN TRY
	--select * from tarea
		SELECT id, descripcion, fecha_finalizacion, fecha_creacion, estado
		FROM ContactoTarea, Tarea
			WHERE id_contacto = @id AND id_tarea = Tarea.id
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

DROP PROCEDURE IF EXISTS procSelectCliente
GO
CREATE PROCEDURE procSelectCliente
AS
BEGIN
		SELECT * FROM Cliente
END
GO

DROP PROCEDURE IF EXISTS procSelectDireccionCompleta
GO
CREATE PROCEDURE procSelectDireccionCompleta
AS
BEGIN
		SELECT Direccion.id, Provincia.nombre id_provincia, Canton.nombre id_canton, Distrito.nombre id_distrito
		FROM Direccion, Provincia, Canton, Distrito
			WHERE Direccion.id_canton = canton.id AND Direccion.id_distrito = Distrito.id 
				AND Direccion.id_provincia = Provincia.id
END
GO

DROP PROCEDURE IF EXISTS procSelectUsuario
GO
CREATE PROCEDURE procSelectUsuario
AS
BEGIN
		SELECT * FROM USuario
END
GO

DROP PROCEDURE IF EXISTS procSelectDireccion
GO
CREATE PROCEDURE procSelectDireccion
AS
BEGIN
		SELECT * FROM Direccion
END
GO

DROP PROCEDURE IF EXISTS procSelectEstadoContacto
GO
CREATE PROCEDURE procSelectEstadoContacto
AS
BEGIN
		SELECT * FROM Estado
END
GO

DROP PROCEDURE IF EXISTS procSelectSector
GO
CREATE PROCEDURE procSelectSector
AS
BEGIN
		SELECT * FROM Sector
END
GO

DROP PROCEDURE IF EXISTS procSelectZona
GO
CREATE PROCEDURE procSelectZona
AS
BEGIN
		SELECT * FROM Zona
END
GO

DROP PROCEDURE IF EXISTS procSelectTipoContacto
GO
CREATE PROCEDURE procSelectTipoContacto
AS
BEGIN
		SELECT * FROM TipoContacto
END
GO

DROP PROCEDURE IF EXISTS procSelectCuentaCliente
GO
CREATE PROCEDURE procSelectCuentaCliente
AS
BEGIN
		SELECT * FROM CuentaCliente
END
GO

DROP PROCEDURE IF EXISTS procSelectClienteConCuenta
GO
CREATE PROCEDURE procSelectClienteConCuenta
AS
BEGIN
		SELECT * FROM CuentaCliente cc, Cliente cl
			WHERE cc.cedula_cliente = cl.cedula
END
GO

DROP PROCEDURE IF EXISTS procSelectContactos
GO
CREATE PROCEDURE procSelectContactos
AS
BEGIN
		SELECT * FROM Contacto
END
GO

DROP PROCEDURE IF EXISTS procSelectInflacion
GO
CREATE PROCEDURE procSelectInflacion
AS
BEGIN
		SELECT * FROM Inflacion
END
GO

DROP PROCEDURE IF EXISTS procSelectActividades
GO
CREATE PROCEDURE procSelectActividades
AS
BEGIN
		SELECT * FROM Actividad
END
GO

DROP PROCEDURE IF EXISTS procSelectTareas
GO
CREATE PROCEDURE procSelectTareas
AS
BEGIN
		SELECT * FROM Tarea
END
GO