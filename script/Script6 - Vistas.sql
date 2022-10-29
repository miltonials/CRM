USE CRM
GO

DROP VIEW IF EXISTS vProductosInfoGeneral
DROP VIEW IF EXISTS vClienteInfoGeneral
DROP VIEW IF EXISTS vContactosInfoGeneral
DROP VIEW IF EXISTS vCotizacionInfoGeneral
DROP PROCEDURE IF EXISTS procObtenerContactosPorCliente
GO

CREATE VIEW vProductosInfoGeneral AS
	SELECT p.codigo, f.nombre AS familia, p.nombre, p.precio_estandar, e.nombre AS estado, p.descripcion
	FROM Producto p, familia f, estado e
	WHERE p.codigo_Familia = f.codigo AND p.estado = e.id;
GO

/*Se debe reemplazar por cuenta cliente*/
CREATE VIEW vClienteInfoGeneral AS
	SELECT c.cedula, c.telefono, c.celular, c.nombre, c.apellido1, c.apellido2
	FROM Cliente c;
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
			orden_compra, coti.descripcion, precio_negociado, zn.nombre AS zona, sec.nombre AS sector,
			mo.nombre, id_etapa AS etapa, id_asesor AS asesor, probabilidad, moti.descripcion AS motivo ,
			id_competidor AS competidor
		FROM Cotizacion coti
			INNER JOIN Zona zn ON zn.id = coti.id_zona
			INNER JOIN Sector sec ON sec.id = coti.id_sector
			INNER JOIN Moneda mo ON mo.id = coti.id_moneda
			INNER JOIN Motivo moti ON moti.id = coti.motivo_denegacion
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