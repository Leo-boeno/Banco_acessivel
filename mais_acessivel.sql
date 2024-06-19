CREATE TABLE endereco (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100),
    numero INT,
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(100),
    cep VARCHAR(8)
);

CREATE TABLE usuario (
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    cpf VARCHAR(11),
    email VARCHAR(255),
    senha VARCHAR(100),
    dataNascimento DATE,
    id_usuario INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE queixante (
    id_queixante INT PRIMARY KEY AUTO_INCREMENT,
    CadPCD VARCHAR(100),
    fk_id_endereco INT
);

CREATE TABLE governo (
    id_governo INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(10)
);

CREATE TABLE solicitacao (
    id_solicitacao INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    descricao VARCHAR(500),
    localizacao VARCHAR(100),
    status BOOLEAN,
    fk_id_queixante INT
);

CREATE TABLE queixa (
    imagem_link VARCHAR(500),
    id_imagem INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_solicitacao INT
);

CREATE TABLE necessidade (
    tipo VARCHAR(100),
    cronica BOOLEAN,
    id_necessidade INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_solicitacao INT
);

CREATE TABLE possui (
    fk_id_usuario INT,
    fk_id_queixante INT
);

CREATE TABLE possui_governo (
    fk_id_governo INT,
    fk_id_usuario INT
);
 
ALTER TABLE queixante ADD CONSTRAINT FK_queixante_2
    FOREIGN KEY (fk_id_endereco)
    REFERENCES endereco (id_endereco)
    ON DELETE RESTRICT;
 
ALTER TABLE solicitacao ADD CONSTRAINT FK_solicitacao_2
    FOREIGN KEY (fk_id_queixante)
    REFERENCES queixante (id_queixante)
    ON DELETE CASCADE;
 
ALTER TABLE queixa ADD CONSTRAINT FK_queixa_2
    FOREIGN KEY (fk_id_solicitacao)
    REFERENCES solicitacao (id_solicitacao)
    ON DELETE CASCADE;
 
ALTER TABLE necessidade ADD CONSTRAINT FK_necessidade_2
    FOREIGN KEY (fk_id_solicitacao)
    REFERENCES solicitacao (id_solicitacao)
    ON DELETE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE SET NULL;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_id_queixante)
    REFERENCES queixante (id_queixante)
    ON DELETE SET NULL;
 
ALTER TABLE possui_governo ADD CONSTRAINT FK_possui_governo_1
    FOREIGN KEY (fk_id_governo)
    REFERENCES governo (id_governo)
    ON DELETE SET NULL;
 
ALTER TABLE possui_governo ADD CONSTRAINT FK_possui_governo_2
    FOREIGN KEY (fk_id_usuario)
    REFERENCES usuario (id_usuario)
    ON DELETE SET NULL;
