 CREATE PROCEDURE XYZ
  @VAR1 tipo_dato(longitud) 
 AS
 SELECT titulo, editorial,precio
 FROM libros
 WHERE autor= @autor;


 SELECT * from parques_naturales


SELECT * FROM especie
SELECT * FROM animal
SELECT * FROM especie as e 
INNER JOIN animal as a on e.id_especie = a.id_especie;

EXEC agregarAnimal 'Felinus Maximum','Gato montes nuevo','A','Plativoro','07/07/2020'

ALTER PROC agregarAnimal
@nombre_cient varchar(50), @denominacion_vul varchar(50), @tipo_especie char(1), @tipo_alim varchar(30), @periodo_celo date
AS
	BEGIN TRY
		DECLARE @identificador integer;
		INSERT INTO especie VALUES (@nombre_cient,@denominacion_vul, @tipo_especie);
		SET @identificador = SCOPE_IDENTITY();
		INSERT INTO animal VALUES(@identificador, @tipo_alim, @periodo_celo);
		PRINT 'DATOS INGRESADOS CORRECTAMENTE';
	END TRY
	BEGIN CATCH
		PRINT 'HA OCURRIDO UN ERROR ' +ERROR_MESSAGE();
	END CATCH

ALTER PROC agregarAnimal
@nombre_cient varchar(50), @denominacion_vul varchar(50), @tipo_especie char(1), @tipo_alim varchar(30), @periodo_celo date
AS
	BEGIN TRY
		DECLARE @identificador integer;
		IF @tipo_alim = 'Carnívoro' OR @tipo_alim = 'Herbívoro' OR @tipo_alim = 'Omnívoro'
		BEGIN
			INSERT INTO especie VALUES (@nombre_cient,@denominacion_vul, @tipo_especie);
			SET @identificador = SCOPE_IDENTITY();
			INSERT INTO animal VALUES(@identificador, @tipo_alim, @periodo_celo);
			PRINT 'Datos ingresados correctamente';
		END
		ELSE
		BEGIN
			PRINT 'Solo se permiten los datos Hervíboro, Carnívoro u Onmívoro como tipo de alimentación'; 
		END
	END TRY
	BEGIN CATCH
		PRINT 'Error: '+ ERROR_MESSAGE();
	END CATCH


Select * from animal

update animal
set tipo_alimentacion = 'Herbívoro' where tipo_alimentacion = 'hervivoro'

update animal
set tipo_alimentacion = 'Omnívoro' where tipo_alimentacion = 'omnivoro'

update animal
set tipo_alimentacion = 'Carnívoro' where tipo_alimentacion = 'Carnivoro'


select * from persona
select * from persona_excursion


ALTER TABLE persona_habitacion

ALTER TABLE habitacion
ADD tipo_habitacion varchar(15);

UPDATE habitacion 
set tipo_habitacion = 'Lujo'
where id_habitacion between 1 and 30;

UPDATE habitacion 
set tipo_habitacion = 'Básica'
where id_habitacion between 31 and 50;

select * from habitacion
select * from persona_habitacion

alter table persona 
add tipo_cliente varchar(10);

select * from persona

Update persona set tipo_cliente = NULL;


-- SELECCIONAR LOS CLIENTES QUE USARON HABITACIONES DE LUJO --
UPDATE persona set
tipo_cliente = 'Basica' where cedula_identidad NOT IN
(select ph.cedula_identidad from habitacion as h inner join persona_habitacion as ph 
on h.id_habitacion = ph.id_habitacion) 

select * from persona

EXEC actualizarTiposCliente
ALTER PROCEDURE actualizarTiposCliente
AS
	DECLARE @lujosos table (identificador varchar(10));
	INSERT INTO @lujosos select ph.cedula_identidad from habitacion as h inner join persona_habitacion as ph on h.id_habitacion = ph.id_habitacion;
	UPDATE persona SET tipo_cliente = 'Lujosa' where cedula_identidad IN (SELECT * FROM @lujosos);
	UPDATE persona SET tipo_cliente = 'Básica' where cedula_identidad NOT IN (SELECT * FROM @lujosos);