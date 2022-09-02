CREATE DATABASE DBTMCONFIABLE

USE DBTMCONFIABLE


CREATE TABLE Personas(
IdPersonas int identity primary key,
DocIdentificacion varchar(15) not null,
Nombres varchar(50) not null,
Apellidos varchar(50) not null,
Email varchar(50) not null,
Rol varchar(50) not null,
Credencial varchar(50) not null,
NivelEducativo varchar(50),
CiudadDireccion varchar(50)
)

CREATE PROCEDURE SpGuardarPersonas(
@DocIdentificacion varchar(15),
@Nombres varchar(50),
@Apellidos varchar(50),
@Email varchar(50),
@Rol varchar(50),
@Credencial varchar(50),
@NivelEducativo varchar(50),
@CiudadDireccion varchar(50)
)
as begin
	INSERT INTO Personas (DocIdentificacion, Nombres, Apellidos, Email, Rol, Credencial, NivelEducativo, CiudadDireccion) values (@DocIdentificacion, @Nombres, @Apellidos, @Email, @Rol, @Credencial, @NivelEducativo, @CiudadDireccion)
end

CREATE PROCEDURE SpModificarPersonas(
@IdPersonas int,
@DocIdentificacion varchar(15),
@Nombres varchar(50),
@Apellidos varchar(50),
@Email varchar(50),
@Rol varchar(50),
@Credencial varchar(50),
@NivelEducativo varchar(50),
@CiudadDireccion varchar(50)
)
as begin
	UPDATE Personas set DocIdentificacion = @DocIdentificacion, Nombres = @Nombres, Apellidos = @Apellidos, Email = @Email, Rol = @Rol, @Credencial = @Credencial, NivelEducativo = @NivelEducativo, CiudadDireccion = @CiudadDireccion where IdPersonas = @IdPersonas
end

CREATE PROCEDURE SpEliminarPersonas(
@IdPersonas int
)
as begin
	DELETE Personas where IdPersonas = @IdPersonas
end

CREATE PROCEDURE SpObtenerPersonas(
@IdPersonas int
)
as begin
	SELECT * FROM Personas where IdPersonas = @IdPersonas
end

CREATE PROCEDURE SpListarPersonas
as begin
	SELECT * FROM Personas
end


select * from Personas