CREATE PROCEDURE [dbo].[AtualizarPessoa]
	@ID INT,
	@Nome NVARCHAR(255),
	@Cidade NVARCHAR(255),
	@Email NVARCHAR(255),
	@CEP NVARCHAR(255),
	@Endereco NVARCHAR(255),
	@Pais NVARCHAR(255),
	@Usuario NVARCHAR(255),
	@Telefone NVARCHAR(255),
	@Data_Nascimento NVARCHAR(255),
	@Cargo_ID NVARCHAR(255)
AS
BEGIN
	UPDATE Pessoa SET Nome=@Nome, Cidade=@Cidade, Email=@Email, CEP=@CEP, Endereco=@Endereco, Pais=@Pais, Usuario=@Usuario, Telefone=@Telefone, Data_Nascimento=@Data_Nascimento, Cargo_ID=@Cargo_ID WHERE ID=@ID;
	
	UPDATE Pessoa_Salario 
	SET Pessoa_Salario.Salario = c.salario
	FROM Pessoa_Salario ps
	INNER JOIN Pessoa p on ps.Pessoa_ID = p.ID
	INNER JOIN Cargo c on c.ID = p.Cargo_ID
	WHERE p.ID = @ID
END