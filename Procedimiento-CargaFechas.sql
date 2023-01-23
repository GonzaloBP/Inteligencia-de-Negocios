
create procedure InsertarFecha
   @CurrentDate date
as
/*SET IDENTITY_INSERT dbo.Dim_Tiempo ON*/
insert into dbo.Dim_Tiempo([ID_Tiempo], [Fecha],
       [NroDia], [NroMes], [NombreMes],
       [NroTrimestre], [NroSemestre], [NroAnio])
   values(
      (DATEPART(year ,@CurrentDate) * 10000) + (DATEPART(month , @CurrentDate)*100) + DATEPART(day, @CurrentDate)
      , @CurrentDate
      , DATEPART(day , @CurrentDate)
      , DATEPART(month , @CurrentDate)
	  , CASE DATEPART(month , @CurrentDate)             
			WHEN 1 THEN 'Enero'
			WHEN 2 THEN 'Febrero'
			WHEN 3 THEN 'Marzo'
			WHEN 4 THEN 'Abril'
			WHEN 5 THEN 'Mayo'
			WHEN 6 THEN 'Junio'
			WHEN 7 THEN 'Julio'
			WHEN 8 THEN 'Agosto'
			WHEN 9 THEN 'Septiembre'
			WHEN 10 THEN 'Octubre'
			WHEN 11 THEN 'Noviembre'
			WHEN 12 THEN 'Diciembre'
		End
      , DATEPART(quarter , @CurrentDate)
	  , CASE WHEN DATEPART(quarter , @CurrentDate) < 3 THEN 1
           ELSE 2
        END
      , DATEPART(year , @CurrentDate)
   )
GO