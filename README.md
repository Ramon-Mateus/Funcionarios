# Funcionarios
Sistema de gerenciamento de funcionários de uma empresa.

# Orientações

### O que foi desenvolvido
O projeto foi desenvolvido utilizando o ASP.NET para desenvolvimento da aplicação e o SQL Server como banco de dados de armazenamento. Foi feito um cadastro de funcionários(pessoa + cargo) onde é possível fazer as 4 ações padrões de CRUD. Ler, criar, editar e excluir. Além disso, também foi implementado a opção de recalculo de salários, onde o banco de dados faz a relação novamente entre pessoa e cargo, populando a tabela de pessoa_salario dita na descrição do teste.

### Como rodar a aplicação
Na pasta Funcionarios/Backup/ tem um arquivo de backup do banco SQL Server que utilizei com todas as stores procedures utilizadas e dados já inseridos. Logo, precisa apenas fazer um restore do banco.

**OBS**: Após fazer o restore é necessário mudar a string de conexão presente na classe Funcionarios dentro do arquivo Funcionarios.aspx.cs. Alterando pela string de conexão da sua máquina.

Após configurado o banco de dados, abra a solução em algum editor de código de sua preferência(eu utilizei o Visual Studio) e rode a aplicação.

### Store procedures

Para facilitar a visualização das store procedures usadas na aplicação, coloquei os arquivos de criação delas na pasta Funcionarios/Sqls/.

# Objetivos

- [X] Criar o banco de dados com os dados passados
- [X] Criar o projeto base
- [X] Store Procedure de população da tabela pessoa_salario
- [X] Popular a tabela de pessoa_salario
- [X] Store Procedure de criação de pessoa
- [X] Store Procedure de atualização de pessoa
- [X] Store Procedure de exclusão de pessoa
- [X] Store Procedure de listagem de pessoas e salários
- [X] Store Procedure de listagem de cargos
- [X] Store Procedure de seleção de pessoa
- [X] Página de listagem de pessoas e salários
- [X] Rotina de criação de pessoa
- [X] Rotina de atualização de pessoa
- [X] Rotina de exclusão de pessoa
- [X] Rotina de Limpeza de campos
- [X] Pop up de confirmação de ação
- [X] rotina de calcular/recalcular salário

# Considerações sobre a arquitetura

Durante o desenvolvimento eu achei algumas coisas estranhas a respeito da arquitetura proposta. Principalmente em relação ao banco de dados.

É dito na descrição do teste que é para ser criado uma tabela chamada Pessoa_Salario que faria a ligação da tabela Pessoa com Cargo. Porém, a existência dessa tabela não é necessária. Pois a necessidade de criação de uma tabela intermediária só é necessária quando se existe uma relação de muitos para muitos entre as duas tabelas analisadas. O que não é o caso entre Pessoa e Cargo. Afinal uma pessoa ela só pode está em um cargo por vez e por isso existe um campo chamado Cargo_ID em Pessoa. E partindo disso, a licação de forma única com a tabela Cargo já existe e por consequência já é possível o acesso do cargo e do salário daquela pessoa, sem a necessidade de criação de uma tabela a parte para fazer isso.

Do jeito que está descrito no teste, existe um problema de duplicidade de dados no banco. O que além de ser errado arquiteturalmente, pois pode gerar inconsistência nesses dados em algum momento, também precisou ser feito um "correção" disso na aplicação que foi a criação do botão de recálculo de salários. Afinal se futuramente o valor do salario de um estagiário, por exemplo, mudasse, a tabela de Cargo iria ter o valor atualizado, porém a tabela de Pessoa_Salario estaria ainda com o valor antigo(problema de inconsistência de dados) e seria preciso ir manualmente na tela de funcionário e acionar a ação de recálculo de salários. O que não precisaria ser feito caso não existisse essa tabela de Pessoa_Salario, pois além de só ter esse dado em um único local, previnindo inconsistências, a consulta estaria pegando o valor corretamente. Tanto antes da modificação do valor do salário, quanto depois.

Uma prova disso é analisarmos as consultas que as duas arquiteturas geram.

Essa é a consulta para retornar todos os dados de pessoa, cargo e pessoa_salario utilizada na listagem pela arquitetura propostas:
```SQL
SELECT p.ID, p.Nome as Pessoa, Cidade, Email, CEP, Endereco, Pais, Usuario, Telefone, Data_Nascimento, c.Nome as Cargo, ps.Salario FROM Pessoa as p 
	INNER JOIN Pessoa_Salario as ps on p.ID = ps.Pessoa_ID
	INNER JOIN Cargo as c on p.Cargo_ID = c.ID
```

E essa tem a mesma função que a consulta acima, porém só envolve pessoa e cargo e retorna exatamente os mesmos dados de maneira mais simples e otimizada:
```SQL
SELECT p.ID, p.Nome as Pessoa, Cidade, Email, CEP, Endereco, Pais, Usuario, Telefone, Data_Nascimento, c.Nome as Cargo, c.Salario FROM Pessoa as p 
	INNER JOIN Cargo as c on p.Cargo_ID = c.ID
```

**OBS**: Minha propostas de solução foi desenvolvida utilizando a arquitetura proposta. Esse comentário foi apenas para mostrar a forma que eu achei mais interessante e otimizada de arquitetura.