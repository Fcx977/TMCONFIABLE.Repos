
USE DBTMCONFIABLE

DELETE Vehiculo

CREATE TABLE Vehiculo(
IdVehiculo int identity primary key,
Placa varchar(6) not null,
IdPropietario int not null,
IdMecanico int not null,
Tipo varchar(15) not null,
Modelo varchar(15) not null,
CapacidadPasajeros varchar(15) not null,
CilindradaMotor varchar(15) not null,
PaisOrigen varchar(15),
OtrasCaracteristicas varchar(15),
NombreSeguro varchar(15) not null,
FechaCompra DateTime not null,
FechaVence DateTime not null,
CONSTRAINT FKPropietario FOREIGN KEY (IdPropietario) REFERENCES Personas(IdPersonas),
CONSTRAINT FKMecanico FOREIGN KEY (IdMecanico) REFERENCES Personas(IdPersonas)
)

CREATE PROCEDURE SpGuardarVehiculo(
@Placa varchar(6),
@IdPropietario int,
@IdMecanico int,
@Tipo varchar(15),
@Modelo varchar(15),
@CapacidadPasajeros varchar(15),
@CilindradaMotor varchar(15),
@PaisOrigen varchar(15),
@OtrasCaracteristicas varchar(15),
@NombreSeguro varchar(15),
@FechaCompra DateTime,
@FechaVence DateTime
)
as begin
	INSERT INTO Vehiculo (Placa, IdPropietario, IdMecanico, Tipo, Modelo, CapacidadPasajeros, CilindradaMotor, PaisOrigen, OtrasCaracteristicas, NombreSeguro, FechaCompra, FechaVence) values (@Placa, @IdPropietario, @IdMecanico, @Tipo, @Modelo, @CapacidadPasajeros, @CilindradaMotor, @PaisOrigen, @OtrasCaracteristicas, @NombreSeguro, @FechaCompra, @FechaVence)
end

CREATE PROCEDURE SpModificarVehiculo(
@IdVehiculo int,
@Placa varchar(6),
@IdPropietario int,
@IdMecanico int,
@Tipo varchar(15),
@Modelo varchar(15),
@CapacidadPasajeros varchar(15),
@CilindradaMotor varchar(15),
@PaisOrigen varchar(15),
@OtrasCaracteristicas varchar(15),
@NombreSeguro varchar(15),
@FechaCompra DateTime,
@FechaVence DateTime
)
as begin
	UPDATE Vehiculo set Placa = @Placa, IdPropietario = @IdPropietario, IdMecanico = @IdMecanico, Tipo = @Tipo, Modelo = @Modelo, CapacidadPasajeros = @CapacidadPasajeros, CilindradaMotor = @CilindradaMotor, PaisOrigen = @PaisOrigen, OtrasCaracteristicas = @OtrasCaracteristicas, NombreSeguro = @NombreSeguro, FechaCompra = @FechaCompra, FechaVence = @FechaVence where IdVehiculo = @IdVehiculo
end

CREATE PROCEDURE SpEliminarVehiculo(
@IdVehiculo int
)
as begin
	DELETE Vehiculo where IdVehiculo = @IdVehiculo
end

CREATE PROCEDURE SpObtenerVehiculo(
@IdVehiculo int
)
as begin
	SELECT * FROM Vehiculo where IdVehiculo = @IdVehiculo
end

CREATE PROCEDURE SpListarVehiculo
as begin
	SELECT * FROM Vehiculo
end