CREATE SCHEMA biblioteca;

USE biblioteca;

-- Tabela Livro
CREATE TABLE livro(
    s_isbn_livro VARCHAR(20) PRIMARY KEY,
    s_titulo_livro VARCHAR(50) NOT NULL,
    s_editora_livro VARCHAR(50) NOT NULL,
    dt_ano_publicacao_livro DATETIME
);

-- Tabela Autor
CREATE TABLE autor(
    i_id_autor INT AUTO_INCREMENT PRIMARY KEY,
    s_nome_autor VARCHAR(30) NOT NULL,
    dt_data_nascimento_autor DATE
);

-- Tabela Intermediária
CREATE TABLE livro_autor(
    s_isbn_livro_autor VARCHAR(20),
    i_id_livro_autor INT,
    PRIMARY KEY (s_isbn_livro_autor, i_id_livro_autor), -- chave primária composta
    CONSTRAINT fk_livro FOREIGN KEY (s_isbn_livro_autor) REFERENCES livro(s_isbn_livro),
    CONSTRAINT fk_autor FOREIGN KEY (i_id_livro_autor) REFERENCES autor(i_id_autor)
);

-- Tabela Usuário
CREATE TABLE usuario(
    i_id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    s_nome_usuario VARCHAR(30) NOT NULL,
    s_email_usuario VARCHAR(30) NOT NULL
);

-- Tabela Emprestimo
CREATE TABLE emprestimo(
    i_id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    i_id_usuario_emprestimo INT,
    s_isbn_livro_emprestimo VARCHAR(20),
    dt_data_emprestimo_emprestimo DATETIME NOT NULL,
    dt_data_devolucao_emprestimo DATETIME NOT NULL,
    CONSTRAINT fk_emprestimo_usuario FOREIGN KEY (i_id_usuario_emprestimo) REFERENCES usuario(i_id_usuario),
    CONSTRAINT fk_emprestimo_livro FOREIGN KEY (s_isbn_livro_emprestimo) REFERENCES livro(s_isbn_livro)
);
