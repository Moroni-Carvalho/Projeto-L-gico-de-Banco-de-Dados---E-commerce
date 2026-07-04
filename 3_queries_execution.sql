USE ecommerce_refinement;

-- ==========================================================================
-- PERGUNTA 1: Quanto cada cliente gastou apenas em produtos? 
-- Exibir o ID, o nome (seja PF ou PJ), o tipo e o valor total, ordenado do maior para o menor.
-- (Garante o uso de: SELECT, INNER/LEFT JOIN, GROUP BY, ORDER BY e Atributo Derivado)
-- ==========================================================================

SELECT 
    c.idClient,
    COALESCE(pf.First_Name, pj.Fantasy_Name) AS Client_Name,
    c.Client_Type,
    SUM(p.Price * po.Quantity) AS Total_Spent_On_Products -- Atributo Derivado (Cálculo)
FROM Client c
LEFT JOIN Physical_Person pf ON c.idClient = pf.idPhysical_Person
LEFT JOIN Legal_Person pj ON c.idClient = pj.idLegal_Person
INNER JOIN Orders o ON c.idClient = o.idClient
INNER JOIN Product_Order po ON o.idOrder = po.idPOorder
INNER JOIN Product p ON po.idPOproduct = p.idProduct
GROUP BY c.idClient, Client_Name, c.Client_Type
ORDER BY Total_Spent_On_Products DESC;


-- ==========================================================================
-- PERGUNTA 2: Quais clientes gastaram mais de R$ 1.000,00 no total de suas compras 
-- considerando também o valor do frete?
-- (Garante o uso de: GROUP BY com HAVING para filtrar o grupo)
-- ==========================================================================

SELECT 
    c.idClient,
    COALESCE(pf.First_Name, pj.Fantasy_Name) AS Client_Name,
    SUM(p.Price * po.Quantity) + o.Shipping_Cost AS Grand_Total -- Atributo Derivado
FROM Client c
LEFT JOIN Physical_Person pf ON c.idClient = pf.idPhysical_Person
LEFT JOIN Legal_Person pj ON c.idClient = pj.idLegal_Person
INNER JOIN Orders o ON c.idClient = o.idClient
INNER JOIN Product_Order po ON o.idOrder = po.idPOorder
INNER JOIN Product p ON po.idPOproduct = p.idProduct
GROUP BY c.idClient, Client_Name, o.Shipping_Cost
HAVING Grand_Total > 1000.00;


-- ==========================================================================
-- PERGUNTA 3: Quais produtos da categoria 'Eletrônicos' ainda não foram entregues, 
-- quem é o fornecedor deles e qual o código de rastreio?
-- (Garante o uso de: WHERE com múltiplos filtros e Junções Complexas)
-- ==========================================================================

SELECT 
    p.Pname AS Product_Name,
    p.Category,
    s.Corporate_Name AS Supplier_Name,
    o.idOrder,
    d.Tracking_Code,
    d.Delivery_Status
FROM Product p
INNER JOIN Product_Supplier ps ON p.idProduct = ps.idPSproduct
INNER JOIN Supplier s ON ps.idPSsupplier = s.idSupplier
INNER JOIN Product_Order po ON p.idProduct = po.idPOproduct
INNER JOIN Orders o ON po.idPOorder = o.idOrder
INNER JOIN Delivery d ON o.idOrder = d.idOrder
WHERE p.Category = 'Eletrônicos' 
  AND d.Delivery_Status != 'Delivered';


-- ==========================================================================
-- PERGUNTA 4: Relação de Clientes, seus Pedidos e a forma de pagamento utilizada.
-- (Garante o uso de: Recuperação simples com filtros e validação de relacionamentos)
-- ==========================================================================

SELECT 
    o.idOrder,
    COALESCE(pf.First_Name, pj.Fantasy_Name) AS Client_Name,
    o.Order_Status,
    pm.Type AS Payment_Method_Used,
    pm.Provider
FROM Orders o
INNER JOIN Client c ON o.idClient = c.idClient
LEFT JOIN Physical_Person pf ON c.idClient = pf.idPhysical_Person
LEFT JOIN Legal_Person pj ON c.idClient = pj.idLegal_Person
INNER JOIN Payment_Method pm ON c.idClient = pm.idClient
GROUP BY o.idOrder, Client_Name, o.Order_Status, pm.Type, pm.Provider;
