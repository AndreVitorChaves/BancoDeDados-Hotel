CREATE TABLE hospedes (
    
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE

);

CREATE TYPE quarto_tipo_enum AS ENUM ('Solteiro', 'Casal', 'Familia');

CREATE TABLE quartos(

    quarto_id SERIAL PRIMARY KEY,
    tipo quarto_tipo_enum,
    andar INT NOT NULL CHECK(andar > 0),
    valor_diaria DECIMAL(10,2) NOT NULL,
    disponivel BOOLEAN DEFAULT TRUE

);

CREATE TABLE produtos(
    produtos_id SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL CHECK (valor_unitario > 0)

);

CREATE TYPE categoria_servico_enum AS ENUM ('Zeladoria', 'Roupas', 'Estacionamento', 'Alimentação');

CREATE TABLE servicos(

servicos_id SERIAL PRIMARY KEY,
categoria categoria_servico_enum,
descricao VARCHAR(100) NOT NULL UNIQUE,
valor DECIMAL(10,2) NOT NULL

);

CREATE TABLE colaboradores (

    rf SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL

);

CREATE TABLE servicos_colaboradores (

    servico_colaborador_id SERIAL PRIMARY KEY,
    servicos_id INT NOT NULL,
    rf_colaborador INT NOT NULL,
    FOREIGN KEY (servicos_id) REFERENCES servicos(servicos_id),
    FOREIGN KEY (rf_colaborador) REFERENCES colaboradores(rf)

);

CREATE TABLE consumos_produtos(

    consumo_produtos_id SERIAL PRIMARY KEY,
    produtos_id INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    total DECIMAL(10,2) NOT NULL,
    data TIMESTAMP DEFAULT now(),
    FOREIGN KEY (produtos_id) REFERENCES produtos(produtos_id)

);

CREATE TABLE consumos_servicos(

    consumo_servicos_id SERIAL PRIMARY KEY,
    quantidade INT NOT NULL CHECK (quantidade > 0 ),
    total DECIMAL(10,2) NOT NULL,
    data TIMESTAMP DEFAULT now(),
    servico_colaborador_id INT NOT NULL,
    FOREIGN KEY (servico_colaborador_id) REFERENCES servicos_colaboradores(servico_colaborador_id)

);

CREATE TYPE forma_pagamento_enum AS ENUM ('Pix', 'Cartão de Crédito');

CREATE TYPE status_pagamento_enum AS ENUM ('Pendente', 'Finalizado');

CREATE TABLE reservas(

    reservas_id SERIAL PRIMARY KEY,
    data_checkin DATE NOT NULL,
    data_checkout DATE NOT NULL,
    total_consumos DECIMAL(10,2) NOT NULL
        DEFAULT 0.0 CHECK (total_consumos > 0),
    total_servicos DECIMAL(10,2) NOT NULL
        DEFAULT 0.0 CHECK (total_servicos > 0),
    percentual_descontos DECIMAL(10,2) NOT NULL
        DEFAULT 0.0 CHECK (percentual_descontos < 100),
    total_reserva DECIMAL(10,2) NOT NULL
        DEFAULT 0.0 CHECK (total_reserva > 0),
    forma_pagamento forma_pagamento_enum,
    status status_pagamento_enum,
    avaliacao VARCHAR(220),
    cpf_hospede VARCHAR(11) NOT NULL,
    quarto_id INT NOT NULL,
    FOREIGN KEY (quarto_id) REFERENCES quartos(quarto_id),
    FOREIGN KEY (cpf_hospede) REFERENCES hospedes(cpf)

);

CREATE TABLE reservas_consumos(

    reservas_consumos_id SERIAL PRIMARY KEY,
    reserva_id INT NOT NULL,
    consumos_produtos_id INT NOT NULL,
    consumos_servicos_id INT NOT NULL,
    FOREIGN KEY (reserva_id) REFERENCES reservas(reservas_id),
    FOREIGN KEY (consumos_produtos_id) REFERENCES consumos_produtos(consumo_produtos_id),
    FOREIGN KEY (consumos_servicos_id) REFERENCES consumos_servicos(consumo_servicos_id)

);