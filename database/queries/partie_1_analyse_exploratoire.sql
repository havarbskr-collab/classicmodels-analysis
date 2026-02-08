-- ============================================================
-- PARTIE 1 : ANALYSE EXPLORATOIRE DE LA BASE CLASSICMODELS
-- Master 1 BIDABI – Université Sorbonne Paris Nord
-- ============================================================

USE classicmodels;

-- ============================================================
-- 1. Nombre d'enregistrements par table
-- ============================================================

SELECT 'customers' AS table_name, COUNT(*) AS total FROM customers
UNION ALL
SELECT 'employees', COUNT(*) FROM employees
UNION ALL
SELECT 'offices', COUNT(*) FROM offices
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'orderdetails', COUNT(*) FROM orderdetails
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'productlines', COUNT(*) FROM productlines
UNION ALL
SELECT 'payments', COUNT(*) FROM payments;

-- ============================================================
-- 2. Répartition géographique des clients (par pays)
-- ============================================================

SELECT 
    country,
    COUNT(*) AS nombre_clients
FROM customers
GROUP BY country
ORDER BY nombre_clients DESC;

-- ============================================================
-- 3. Nombre de commandes par statut
-- ============================================================

SELECT 
    status,
    COUNT(*) AS nombre_commandes
FROM orders
GROUP BY status;

-- ============================================================
-- 4. Chiffre d'affaires total
-- ============================================================

SELECT 
    ROUND(SUM(quantityOrdered * priceEach), 2) AS chiffre_affaires_total
FROM orderdetails;

-- ============================================================
-- 5. Panier moyen par commande
-- ============================================================

SELECT 
    ROUND(
        SUM(od.quantityOrdered * od.priceEach) 
        / COUNT(DISTINCT o.orderNumber),
        2
    ) AS panier_moyen
FROM orders o
JOIN orderdetails od 
    ON o.orderNumber = od.orderNumber;

-- ============================================================
-- 6. Top 10 des produits les plus vendus (en quantité)
-- ============================================================

SELECT 
    p.productName,
    SUM(od.quantityOrdered) AS quantite_vendue
FROM orderdetails od
JOIN products p 
    ON od.productCode = p.productCode
GROUP BY p.productName
ORDER BY quantite_vendue DESC
LIMIT 10;

-- ============================================================
-- 7. Top 5 des meilleurs clients (par chiffre d'affaires)
-- ============================================================

SELECT 
    c.customerName,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS chiffre_affaires
FROM customers c
JOIN orders o 
    ON c.customerNumber = o.customerNumber
JOIN orderdetails od 
    ON o.orderNumber = od.orderNumber
GROUP BY c.customerName
ORDER BY chiffre_affaires DESC
LIMIT 5;

-- ============================================================
-- 8. Employé ayant généré le plus de chiffre d'affaires
-- ============================================================

SELECT 
    e.firstName,
    e.lastName,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS chiffre_affaires
FROM employees e
JOIN customers c 
    ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o 
    ON c.customerNumber = o.customerNumber
JOIN orderdetails od 
    ON o.orderNumber = od.orderNumber
GROUP BY e.employeeNumber
ORDER BY chiffre_affaires DESC
LIMIT 1;

-- ============================================================
-- 9. Gamme de produits la plus rentable
-- ============================================================

SELECT 
    pl.productLine,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS chiffre_affaires
FROM productlines pl
JOIN products p 
    ON pl.productLine = p.productLine
JOIN orderdetails od 
    ON p.productCode = od.productCode
GROUP BY pl.productLine
ORDER BY chiffre_affaires DESC
LIMIT 1;
