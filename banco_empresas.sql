CREATE TABLE escritorio (
id_escritorio INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
endereco VARCHAR(200),
cidade VARCHAR(100),
estado CHAR(2),
telefone VARCHAR(20)
);

CREATE TABLE departamento (
id_departamento INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
descricao VARCHAR(100),
id_escritorio INT,
FOREIGN KEY (id_escritorio) REFERENCES escritorio(id_escritorio)
);

CREATE TABLE funcionario (
id_funcionario INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(11) UNIQUE,
data_nascimento DATE,
cargo VARCHAR(100),
salario DECIMAL(10,2) NOT NULL,
email VARCHAR(100) UNIQUE,
telefone VARCHAR(15),
supervisionado_por INT,
FOREIGN KEY (supervisionado_por) REFERENCES funcionario(id_funcionario)
);

INSERT INTO escritorio 
(id_escritorio, nome, endereco, cidade, estado, telefone)
VALUES
(1, 'Escritório Central', 'Av. Rio Branco, 100', 'Rio de Janeiro', 'RJ', '212222-1001'),
(2, 'Escritório Paulista', 'Av. Paulista, 500', 'São Paulo', 'SP', '113333-2002'),
(3, 'Escritório Minas', 'Av. Afonso Pena, 300', 'Belo Horizonte', 'MG', '313333-3003'),
(4, 'Escritório Curitiba', 'Rua XV de Novembro, 200', 'Curitiba', 'PR', '413333-4004'),
(5, 'Escritório Sul', 'Av. Borges de Medeiros, 400', 'Porto Alegre', 'RS', '513333-5005'),
(6, 'Escritório Brasília', 'SCS Quadra 2, 100', 'Brasília', 'DF', '613333-6006'),
(7, 'Escritório Bahia', 'Av. Tancredo Neves, 600', 'Salvador', 'BA', '713333-7007'),
(8, 'Escritório Recife', 'Av. Boa Viagem, 700', 'Recife', 'PE', '813333-8008'),
(9, 'Escritório Floripa', 'Av. Beira-Mar, 800', 'Florianópolis', 'SC', '483333-9009'),
(10, 'Escritório Campinas', 'Av. Norte-Sul, 900', 'Campinas', 'SP', '193333-1010');


INSERT INTO departamento
(id_departamento, nome, descricao, id_escritorio)
VALUES
(1, 'Tecnologia da Informacao', 'Desenvolvimento e suporte de sistemas', 1),
(2, 'Recursos Humanos', 'Gestao de pessoas e colaboradores', 2),
(3, 'Financeiro', 'Controle financeiro e contabil', 3),
(4, 'Marketing', 'Publicidade e comunicacao da empresa', 4),
(5, 'Comercial', 'Vendas e relacionamento com clientes', 5),
(6, 'Juridico', 'Assuntos legais e contratos', 6),
(7, 'Operacoes', 'Gerenciamento das operacoes da empresa', 7),
(8, 'Logistica', 'Controle de transporte e distribuicao', 8),
(9, 'Compras', 'Aquisicao de produtos e servicos', 9),
(10, 'Projetos', 'Planejamento e gerenciamento de projetos', 10);


INSERT INTO funcionario VALUES 
(1, 'Carlos Silva', '11111111111', '1985-03-15', 'Gerente de TI', 9500.00, 'carlos.silva@email.com', '21999990001', NULL, 1),
(2, 'Joao Santos', '22222222222', '1990-07-20', 'Desenvolvedor', 6500.00, 'joao.santos@email.com', '11999990002', 1, 1),
(3, 'Maria Oliveira', '33333333333', '1988-11-10', 'Analista de RH', 5500.00, 'maria.oliveira@email.com', '31999990003', NULL, 2),
(4, 'Pedro Costa', '44444444444', '1995-01-25', 'Analista Financeiro', 4800.00, 'pedro.costa@email.com', '41999990004', NULL, 3),
(5, 'Ana Souza', '55555555555', '1992-06-18', 'Analista de Marketing', 5200.00, 'ana.souza@email.com', '51999990005', NULL, 4),
(6, 'Lucas Pereira', '66666666666', '1987-09-12', 'Gerente Comercial', 8000.00, 'lucas.pereira@email.com', '61999990006', NULL, 5),
(7, 'Julia Almeida', '77777777777', '1996-04-30', 'Advogada', 7000.00, 'julia.almeida@email.com', '71999990007', NULL, 6),
(8, 'Rafael Martins', '88888888888', '1991-12-05', 'Analista de Operacoes', 5800.00, 'rafael.martins@email.com', '81999990008', NULL, 7),
(9, 'Beatriz Lima', '99999999999', '1994-08-22', 'Analista de Logistica', 4500.00, 'beatriz.lima@email.com', '48999990009', NULL, 8),
(10, 'Felipe Rocha', '10101010101', '1993-02-14', 'Analista de Projetos', 6000.00, 'felipe.rocha@email.com', '19999990010', NULL, 10);

SELECT * FROM funcionario;
SELECT nome, cargo, salario FROM funcionario;
SELECT * FROM funcionario WHERE salario > 5000;
SELECT * FROM funcionario WHERE salario BETWEEN 3000 AND 8000;
SELECT * FROM funcionario WHERE nome LIKE 'A%';
SELECT * FROM funcionario ORDER BY salario DESC;
SELECT * FROM funcionario ORDER BY salario LIKE 10;
SELECT funcionario.nome AS funcionario, funcionario.cargo,  funcionario.salario, departamento.nome AS departamento FROM funcionario
INNER JOIN departamento
ON funcionario.id_departamento = departamento.id_departamento;