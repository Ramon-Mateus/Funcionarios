CREATE PROCEDURE [dbo].[CriarPessoa]
	@Nome NVARCHAR(255),
	@Cidade NVARCHAR(255),
	@Email NVARCHAR(255),
	@CEP NVARCHAR(255),
	@Endereco NVARCHAR(255),
	@Pais NVARCHAR(255),
	@Usuario NVARCHAR(255),
	@Telefone NVARCHAR(255),
	@Data_Nascimento NVARCHAR(255),
	@Cargo_ID INT
AS
BEGIN
	DECLARE @PessoaID INT;

	INSERT INTO Pessoa(Nome, Cidade, Email, CEP, Endereco, Pais, Usuario, Telefone, Data_Nascimento, Cargo_ID) VALUES (@Nome, @Cidade, @Email, @CEP, @Endereco, @Pais, @Usuario, @Telefone, @Data_Nascimento, @Cargo_ID);
	
	SET @PessoaID = SCOPE_IDENTITY();

	INSERT INTO Pessoa_Salario (Pessoa_ID, Nome, Salario)
	SELECT
		p.ID as Pessoa_ID,
		p.Nome,
		c.Salario
	FROM Pessoa as p
	INNER JOIN Cargo as c on c.ID = p.Cargo_ID
	WHERE p.ID = @PessoaID;

	SELECT @PessoaID AS PessoaID;
END