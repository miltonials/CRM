USE CRM
GO

DROP PROCEDURE IF EXISTS procCalcularValorPresenteCotizaciones
DROP PROCEDURE IF EXISTS procBorrarValorPresenteCotizaciones
GO


CREATE PROCEDURE procBorrarValorPresenteCotizaciones
AS
	BEGIN
		DELETE FROM ValorPresenteCotizaciones
		SELECT * FROM ValorPresenteCotizaciones
	END
GO

CREATE PROCEDURE procCalcularValorPresenteCotizaciones
AS
  BEGIN
	DELETE FROM ValorPresenteCotizaciones
	DECLARE	@numero_cotizacion INT,
			@numero_contacto INT,
			@nombre_oportunidad VARCHAR(30),
			@fecha_cotizacion VARCHAR(30),
			@nombre_cuenta VARCHAR(30),
			@total_cotizacion VARCHAR(30),
			@total_a_valor_presente VARCHAR(30),
			@anno int,
			@porcentaje FLOAT,
			@anno1 int 


	DECLARE curValorPresenteCotizaciones CURSOR
			FOR SELECT numero_Cotizacion, id_contacto, nombre_oportunidad, fecha_cotizacion,
			nombre_cuenta FROM Cotizacion co FOR UPDATE
			OPEN curValorPresenteCotizaciones

			FETCH NEXT FROM curValorPresenteCotizaciones INTO @numero_cotizacion, @numero_contacto, @nombre_oportunidad, @fecha_cotizacion, @nombre_cuenta;

			--INICIO WHILE CURSOR EXTERNO
			WHILE (@@FETCH_STATUS = 0)
			BEGIN
				SELECT @total_cotizacion = SUM(precio_negociado)
				FROM productoCotizacion WHERE numero_cotizacion = @numero_cotizacion
				
				SET @anno = (SELECT YEAR(@fecha_cotizacion))
				SET @total_a_valor_presente = @total_cotizacion

				--Se valida que la cotización tenga productos
				IF @numero_cotizacion IN (SELECT numero_cotizacion FROM ProductoCotizacion)
				BEGIN
					--INICIO CURSOR INTERNO
					DECLARE curInflacionPorAnno CURSOR LOCAL
							FOR SELECT anno, porcentaje FROM Inflacion ORDER BY anno;
							OPEN curInflacionPorAnno

							FETCH NEXT FROM curInflacionPorAnno INTO @anno1, @porcentaje;

							WHILE (@@FETCH_STATUS = 0)
							BEGIN
				  				if @anno1 > @anno
				  				BEGIN
									SET @total_a_valor_presente = @total_a_valor_presente + @total_cotizacion * @porcentaje/100;
				  				END

								FETCH NEXT FROM curInflacionPorAnno INTO @anno1, @porcentaje;
							END

						CLOSE curInflacionPorAnno
						DEALLOCATE curInflacionPorAnno
						--FIN CURSOR INTERNO

					INSERT INTO ValorPresenteCotizaciones VALUES 
							(@numero_cotizacion, @numero_contacto, @nombre_oportunidad,
							 @fecha_cotizacion, @nombre_cuenta, @total_cotizacion,
							 @total_a_valor_presente)
				END
				FETCH NEXT FROM curValorPresenteCotizaciones INTO @numero_cotizacion, @numero_contacto, @nombre_oportunidad, @fecha_cotizacion, @nombre_cuenta;
 			END
		--FIN WHILE CURSOR EXTERNO

		CLOSE curValorPresenteCotizaciones;
		DEALLOCATE curValorPresenteCotizaciones;

		SELECT * FROM ValorPresenteCotizaciones
	END	
GO
	DELETE FROM ValorPresenteCotizaciones