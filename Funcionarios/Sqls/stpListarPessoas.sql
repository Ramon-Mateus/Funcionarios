CREATE PROCEDURE [dbo].[ListarPessoas]
AS
BEGIN
	SELECT p.ID, p.Nome as Pessoa, Cidade, Email, CEP, Endereco, Pais, Usuario, Telefone, Data_Nascimento, c.Nome as Cargo, ps.Salario FROM Pessoa as p 
		INNER JOIN Pessoa_Salario as ps on p.ID = ps.Pessoa_ID
		INNER JOIN Cargo as c on p.Cargo_ID = c.ID
		ORDER BY Pessoa;
END