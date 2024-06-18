/* Lógico_1: */
use acessivel;

CREATE TABLE Solicitacao (
    titulo Varchar(100),
    descricao Text,
    localIZAÇÃO Varchar(255),
    id_solicitacao int PRIMARY KEY,
    status boolean,
    Tipo Varchar(255),
    Cronica boolean,
    URL_IMG int,
    Solicitacao_TIPO INT,
    fk_Queixante_ID int
);

CREATE TABLE Queixante (
    CadPcD Varchar(100),
    fk_id_endereco int,
    ID int PRIMARY KEY,
    Nome VARCHAR(100),
    Sobrenome Varchar(100),
    CPF Varchar(11),
    email Varchar(255),
    Senha Varchar(100),
    fk_Endereco_ID_ENDERECO int
);

CREATE TABLE Endereco (
    Numero Varchar(100),
    CEP Varchar(8),
    Logradouro Varchar(100),
    Cidade_UF Varchar(100),
    ID_ENDERECO int PRIMARY KEY
);
 
ALTER TABLE Solicitacao ADD CONSTRAINT FK_Solicitacao_2
    FOREIGN KEY (fk_Queixante_ID)
    REFERENCES Queixante (ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Queixante ADD CONSTRAINT FK_Queixante_2
    FOREIGN KEY (fk_Endereco_ID_ENDERECO)
    REFERENCES Endereco (ID_ENDERECO)
    ON DELETE CASCADE;