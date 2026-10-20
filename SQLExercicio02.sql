CREATE DATABASE Maternidade
GO
USE Maternidade

CREATE TABLE Mae(
ID_Mae					INT				NOT NULL	IDENTITY(1001, 1),
Nome					VARCHAR(60)		NOT NULL,
Logradouro_Endereco		VARCHAR(100)	NOT NULL,
Numero_Endereco			INT				NOT NULL	CHECK(Numero_Endereco >= 0),
CEP_Endereco			CHAR(8)			NOT NULL	CHECK(LEN(CEP_Endereco) = 8),
Complemento_Endereco	VARCHAR(200)	NOT NULL,
Telefone				CHAR(10)		NOT NULL	CHECK(LEN(Telefone) = 10),
Data_Nasc				DATE			NOT NULL

PRIMARY KEY(ID_Mae)
)

CREATE TABLE Bebe(
ID_Bebe		INT				NOT NULL	IDENTITY(1, 1),
Nome		VARCHAR(60)		NOT NULL,
Data_Nasc	DATE			NOT NULL	DEFAULT(GETDATE()),
Altura		DECIMAL(7, 2)	NOT NULL	CHECK(Altura > 0),
Peso		DECIMAL(4, 3)	NOT NULL	CHECK(Peso > 0),
MaeID_Mae	INT				NOT NULL

PRIMARY KEY(ID_Bebe)
FOREIGN KEY(MaeID_Mae) REFERENCES Mae(ID_Mae)
)

CREATE TABLE Medico(
CRM_Numero			INT				NOT NULL,
CRM_UF				CHAR(2)			NOT NULL,
Nome				VARCHAR(60)		NOT NULL,
Telefone_Celular	CHAR(11)		NOT NULL	UNIQUE	
												CHECK(LEN(Telefone_Celular) = 11),
Especialidade		VARCHAR(30)		NOT NULL

PRIMARY KEY(CRM_Numero, CRM_UF)
)

CREATE TABLE Bebe_Medico(
BebeID_Bebe			INT			NOT NULL,
MedicoCRM_Numero	INT			NOT NULL,
MedicoCRM_UF		CHAR(2)		NOT NULL

PRIMARY KEY(BebeID_Bebe, MedicoCRM_Numero, MedicoCRM_UF)
)