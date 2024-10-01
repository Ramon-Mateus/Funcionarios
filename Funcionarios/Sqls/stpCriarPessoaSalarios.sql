CREATE PROCEDURE [dbo].[CriarPessoaSalarios]
AS
BEGIN
	DELETE FROM Pessoa_Salario;

	INSERT INTO Pessoa_Salario (Pessoa_ID, Nome, Salario)
	SELECT
		p.ID as Pessoa_ID,
		p.Nome,
		c.Salario
	FROM Pessoa as p
	INNER JOIN Cargo as c on c.ID = p.Cargo_ID;
END