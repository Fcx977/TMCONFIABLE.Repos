USE DBTMCONFIABLE

CREATE TABLE RevNiveles(
IdRevNiveles int identity primary key,
FechaHora DateTime not null,
IdVehiculo int not null,
NivelAceite varchar(15) not null,
NivelFrenos varchar(15) not null,
NivelRefrigerante varchar(15) not null,
NivelDireccion varchar(15) not null,
CONSTRAINT FKVehiculo FOREIGN KEY (IdVehiculo) REFERENCES Vehiculo(IdVehiculo)
)

CREATE PROCEDURE SpGuardarRevNiveles(
@FechaHora DateTime,
@IdVehiculo int,
@NivelAceite varchar(15),
@NivelFrenos varchar(15),
@NivelRefrigerante varchar(15),
@NivelDireccion varchar(15)
)
as begin
	INSERT INTO RevNiveles (FechaHora, IdVehiculo, NivelAceite, NivelFrenos, NivelRefrigerante, NivelDireccion) values (@FechaHora, @IdVehiculo, @NivelAceite, @NivelFrenos, @NivelRefrigerante, @NivelDireccion)
end

CREATE PROCEDURE SpModificarRevNiveles(
@IdRevNiveles int,
@FechaHora DateTime,
@IdVehiculo int,
@NivelAceite varchar(15),
@NivelFrenos varchar(15),
@NivelRefrigerante varchar(15),
@NivelDireccion varchar(15)
)
as begin
	UPDATE RevNiveles set FechaHora = @FechaHora, IdVehiculo = @IdVehiculo, NivelAceite = @NivelAceite, NivelFrenos = @NivelFrenos, NivelRefrigerante = @NivelRefrigerante, NivelDireccion = @NivelDireccion where IdRevNiveles = @IdRevNiveles
end

CREATE PROCEDURE SpEliminarRevNiveles(
@IdRevNiveles int
)
as begin
	DELETE RevNiveles where IdRevNiveles = @IdRevNiveles
end

CREATE PROCEDURE SpObtenerRevNiveles(
@IdRevNiveles int
)
as begin
	SELECT * FROM RevNiveles where IdRevNiveles = @IdRevNiveles
end

CREATE PROCEDURE SpListarRevNiveles
as begin
	SELECT * FROM RevNiveles
end