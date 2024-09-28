CREATE PROCEDURE [dbo].[ListarCargos]
AS
BEGIN
	SELECT ID, Nome, Salario FROM Cargo
END