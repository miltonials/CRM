USE CRM
GO

--DROP VIEW IF EXISTS vista_productos
--DROP VIEW IF EXISTS Vista_clientes
--DROP VIEW IF EXISTS	Vista_cotizaciones


/* Vista de los productos con codigo, nombre de la familia en vez de su codigo,
nombre, precioEstandar, nombre del estado en vez de su codigo, descripcion */

CREATE VIEW vista_productos AS
SELECT p.codigo, f.nombre AS familia, p.nombre, p.precio_estandar, e.nombre AS estado, p.descripcion
FROM Producto p, familia f, estado e
WHERE p.codigo_Familia = f.codigo AND p.estado = e.id;
GO

/* Vista de los clientes con cedula, telefono, celular, nombre, apellido1, apellido2 */ 
CREATE VIEW vista_clientes AS
SELECT c.cedula, c.telefono, c.celular, c.nombre, c.apellido1, c.apellido2
FROM Cliente c;
GO

/* Vista de las cotizaciones con numero_Cotizacion, id_factura, contanto en vez de su id, tipo, nombre_oportunidad,
fecha_cotizacion, nombre_cuenta, fecha_proyeccion, fecha_cierre, orden_compra, descripcion,
precio_negociado, nombre de la zona en vez de su id, nombre del sector en vez de su id,
nombre de la moneda en vez de su id, nombre de la etapa en vez de su id, nombre del asesor en vez de su id,
probabilidad, motivo_Denegacion y  competidor no se debe repetir ningun resultado*/

