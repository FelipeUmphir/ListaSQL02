CREATE DATABASE Mecânica
GO
USE Mecânica

CREATE TABLE Cliente(
ID				INT				NOT NULL	IDENTITY(3401, 15),
Nome			VARCHAR(100)	NOT NULL,
Logradouro		VARCHAR(200)	NOT NULL,
Numero			INT				NOT NULL	CHECK(Numero >= 0),
CEP				CHAR(8)			NOT NULL	CHECK(LEN(CEP) = 8),
Complemento		VARCHAR(255)	NOT NULL

PRIMARY KEY(ID)
)
GO
CREATE TABLE Telefone_Cliente(
ClienteID	INT				NOT NULL,
Telefone	VARCHAR(11)		NOT NULL	CHECK(LEN(Telefone) = 11
											OR LEN(Telefone) = 10)

PRIMARY KEY(ClienteID, Telefone)
FOREIGN KEY(ClienteID) REFERENCES Cliente(ID)
)
CREATE TABLE Veiculo(
Placa			CHAR(7)			NOT NULL	CHECK(LEN(Placa) = 7),
Marca			VARCHAR(30)		NOT NULL,
Modelo			VARCHAR(30)		NOT NULL,
Cor				VARCHAR(15)		NOT NULL,
Ano_Fabricacao	INT				NOT NULL	CHECK(Ano_Fabricacao > 1997),
Ano_Modelo		INT				NOT NULL	CHECK(Ano_Modelo >= 1997),
Data_Aquisicao	DATE			NOT NULL,
ClienteID		INT				NOT NULL

PRIMARY KEY(Placa)
FOREIGN KEY(ClienteID) REFERENCES Cliente(ID)
)
CREATE TABLE Peca(
ID			INT				NOT NULL	IDENTITY(3411, 7),
Nome		VARCHAR(30)		NOT NULL	UNIQUE,
Preco		DECIMAL(4, 2)	NOT NULL	CHECK(Preco > 0),
Estoque		INT				NOT NULL	CHECK(Estoque >= 10)

PRIMARY KEY(ID)
)
CREATE TABLE Categoria(
ID            INT               NOT NULL    IDENTITY(1, 1),
Categoria    VARCHAR(30)        NOT NULL    CHECK(Categoria = 'Estagiário'
												OR Categoria = 'Nível 1'
												OR Categoria = 'Nível 2'
												OR Categoria = 'Nível 3'),
Valor_Hora    DECIMAL(4, 2)     NOT NULL    CHECK(Valor_Hora = 15.00
												OR Valor_Hora = 25.00
												OR Valor_Hora = 35.00
												OR Valor_Hora = 50.00)

PRIMARY KEY(ID)
)
GO
CREATE TABLE Funcionario(
ID						INT				NOT NULL	IDENTITY(101, 1),
Nome					VARCHAR(100)	NOT NULL,
Logradouro				VARCHAR(200)	NOT NULL,
Numero					INT				NOT NULL	CHECK(Numero >= 0),
Telefone				CHAR(11)		NOT NULL	CHECK(LEN(Telefone) = 11
														OR LEN(Telefone) = 10),
Categoria_Habilitacao	VARCHAR(2)		NOT NULL	CHECK(Categoria_Habilitacao = 'A'
														OR Categoria_Habilitacao = 'B'
														OR Categoria_Habilitacao = 'C'
														OR Categoria_Habilitacao = 'D'
														OR Categoria_Habilitacao = 'E'),
CategoriaID				INT				NOT NULL

PRIMARY KEY(ID)
FOREIGN KEY(CategoriaID) REFERENCES	Categoria(ID)
)
CREATE TABLE Reparo(
VeiculoPlaca	CHAR(7)			NOT NULL,
FuncionarioID	INT				NOT NULL,
PecaID			INT				NOT NULL,
Data_Reparo		DATE			NOT NULL	DEFAULT(GETDATE()),
Custo_Total		DECIMAL(4, 2)	NOT NULL	CHECK(Custo_Total > 0),
Tempo			INT				NOT NULL	CHECK(Tempo > 0)

PRIMARY KEY(VeiculoPlaca, FuncionarioID, PecaID, Data_Reparo)
FOREIGN KEY(VeiculoPlaca) REFERENCES Veiculo(Placa),
FOREIGN KEY(FuncionarioID) REFERENCES Funcionario(ID),
FOREIGN KEY(PecaID) REFERENCES Peca(ID)
)