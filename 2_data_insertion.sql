USE ecommerce_refinement;

-- ==========================================================================
-- 1. INSERÇÃO DE CLIENTES BASE (Tabela Pai)
-- ==========================================================================
INSERT INTO Client (Address, Client_Type) VALUES 
('Rua das Flores, 123 - Centro, Araras-SP', 'PF'),
('Av. Paulista, 1500 - São Paulo-SP', 'PJ'),
('Rua Tiradentes, 45 - Bairro Alto, Rio Claro-SP', 'PF');

-- ==========================================================================
-- 2. INSERÇÃO DE CLIENTES PESSOA FÍSICA (PF) - Relacionamento 1:1
-- ==========================================================================
-- O idPhysical_Person deve bater exatamente com o idClient gerado acima
INSERT INTO Physical_Person (idPhysical_Person, First_Name, Last_Name, CPF, Birth_Date) VALUES 
(1, 'Carlos', 'Eduardo', '12345678901', '1990-05-15'),
(3, 'Ana', 'Beatriz', '98765432100', '1995-11-22');

-- ==========================================================================
-- 3. INSERÇÃO DE CLIENTES PESSOA JURÍDICA (PJ) - Relacionamento 1:1
-- ==========================================================================
-- O idLegal_Person deve bater exatamente com o idClient de tipo 'PJ'
INSERT INTO Legal_Person (idLegal_Person, Corporate_Name, Fantasy_Name, CNPJ, State_Registration) VALUES 
(2, 'Tech Solutions Ltda', 'TechStore', '12345678000199', '111222333');

-- ==========================================================================
-- 4. INSERÇÃO DE MÉTODOS DE PAGAMENTO DOS CLIENTES
-- ==========================================================================
INSERT INTO Payment_Method (idClient, Type, Provider) VALUES 
(1, 'Credit Card', 'Visa'),
(1, 'Pix', 'Banco Central'),
(2, 'Boleto', 'Itaú'),
(3, 'Credit Card', 'Mastercard');

-- ==========================================================================
-- 5. INSERÇÃO DE PRODUTOS
-- ==========================================================================
INSERT INTO Product (Pname, Category, Price, Product_Description) VALUES 
('Smartphone 5G', 'Eletrônicos', 2500.00, '128GB, Tela 6.1, Câmera Tripla'),
('Notebook Pro', 'Eletrônicos', 5500.00, 'Intel i7, 16GB RAM, 512GB SSD'),
('Cadeira Ergonômica', 'Móveis', 850.00, 'Ajuste de braço, lombar e encosto mesh'),
('Mouse Sem Fio', 'Eletrônicos', 150.00, 'Conexão 2.4GHz, Bateria Recarregável');

-- ==========================================================================
-- 6. INSERÇÃO DE PEDIDOS
-- ==========================================================================
INSERT INTO Orders (idClient, Order_Status, Description, Shipping_Cost) VALUES 
(1, 'Approved', 'Compra de Smartphone e acessório', 25.00),
(2, 'Processing', 'Lote de Notebooks para escritório', 150.00),
(3, 'Approved', 'Renovação do setup de Home Office', 40.00);

-- ==========================================================================
-- 7. VINCULAÇÃO DE PRODUTOS AOS PEDIDOS (Tabela N:M Product_Order)
-- ==========================================================================
INSERT INTO Product_Order (idPOproduct, idPOorder, Quantity) VALUES 
(1, 1, 1), -- 1 Smartphone no pedido 1
(4, 1, 2), -- 2 Mouses no pedido 1
(2, 2, 5), -- 5 Notebooks no pedido 2
(3, 3, 1); -- 1 Cadeira no pedido 3

-- ==========================================================================
-- 8. INSERÇÃO DE ENTREGAS (Refinamento solicitado no desafio)
-- ==========================================================================
INSERT INTO Delivery (idOrder, Tracking_Code, Delivery_Status, Estimated_Delivery_Date) VALUES 
(1, 'TRK123456BR', 'In Transit', '2026-07-15'),
(2, 'TRK789101BR', 'Shedules', '2026-07-20'),
(3, 'TRK112131BR', 'Delivered', '2026-07-03');

-- ==========================================================================
-- 9. INSERÇÃO DE FORNECEDORES
-- ==========================================================================
INSERT INTO Supplier (Corporate_Name, CNPJ, Contact) VALUES 
('Distribuidora Eletrônica S.A.', '11222333000144', 'comercial@disteletr.com'),
('Móveis do Brasil Indústria', '44555666000177', 'vendas@moveisbr.com');

-- ==========================================================================
-- 10. VINCULAÇÃO DE PRODUTOS AOS SEUS FORNECEDORES (Tabela N:M)
-- ==========================================================================
INSERT INTO Product_Supplier (idPSsupplier, idPSproduct) VALUES 
(1, 1), -- Distribuidora fornece Smartphone
(1, 2), -- Distribuidora fornece Notebook
(1, 4), -- Distribuidora fornece Mouse
(2, 3); -- Móveis do Brasil fornece Cadeira
