USE classicmodels;

-- =========================================================
-- PARTIE 2 : REQUÊTES SQL AVANCÉES
-- =========================================================


-- 1. Analyse des ventes avec WINDOW FUNCTIONS
-- Chiffre d'affaires mensuel + moyenne mobile sur 3 mois

SELECT
    YEAR(o.orderDate) AS annee,
    MONTH(o.orderDate) AS mois,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS chiffre_affaires,
    ROUND(
        AVG(SUM(od.quantityOrdered * od.priceEach))
        OVER (
            ORDER BY YEAR(o.orderDate), MONTH(o.orderDate)
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moyenne_mobile_3_mois
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY annee, mois
ORDER BY annee, mois;


-- =========================================================

-- 2. Hiérarchie organisationnelle avec CTE récursif
-- Structure hiérarchique des employés (manager → subordonnés)

WITH RECURSIVE hierarchie AS (
    SELECT
        employeeNumber,
        firstName,
        lastName,
        reportsTo,
        1 AS niveau
    FROM employees
    WHERE reportsTo IS NULL

    UNION ALL

    SELECT
        e.employeeNumber,
        e.firstName,
        e.lastName,
        e.reportsTo,
        h.niveau + 1
    FROM employees e
    JOIN hierarchie h ON e.reportsTo = h.employeeNumber
)
SELECT *
FROM hierarchie
ORDER BY niveau, reportsTo;


-- =========================================================

-- 3. Segmentation clients VIP (jointures multiples – 5 tables)
-- Clients classés selon leur chiffre d'affaires total

SELECT
    c.customerName,
    ROUND(SUM(od.quantityOrdered * od.priceEach), 2) AS chiffre_affaires,
    CASE
        WHEN SUM(od.quantityOrdered * od.priceEach) >= 500000 THEN 'VIP'
        WHEN SUM(od.quantityOrdered * od.priceEach) >= 200000 THEN 'Régulier'
        ELSE 'Standard'
    END AS segment_client
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
JOIN productlines pl ON p.productLine = pl.productLine
GROUP BY c.customerNumber
ORDER BY chiffre_affaires DESC;


-- =========================================================

-- 4. Analyse temporelle avec sous-requêtes corrélées
-- Nouveaux clients par année (première commande)

SELECT
    YEAR(o.orderDate) AS annee,
    COUNT(DISTINCT o.customerNumber) AS nouveaux_clients
FROM orders o
WHERE o.orderDate = (
    SELECT MIN(o2.orderDate)
    FROM orders o2
    WHERE o2.customerNumber = o.customerNumber
)
GROUP BY annee
ORDER BY annee;


-- =========================================================

-- 5. Rapport PIVOT : ventes par gamme de produits et trimestre

SELECT
    pl.productLine,
    SUM(CASE WHEN QUARTER(o.orderDate) = 1 THEN od.quantityOrdered * od.priceEach ELSE 0 END) AS T1,
    SUM(CASE WHEN QUARTER(o.orderDate) = 2 THEN od.quantityOrdered * od.priceEach ELSE 0 END) AS T2,
    SUM(CASE WHEN QUARTER(o.orderDate) = 3 THEN od.quantityOrdered * od.priceEach ELSE 0 END) AS T3,
    SUM(CASE WHEN QUARTER(o.orderDate) = 4 THEN od.quantityOrdered * od.priceEach ELSE 0 END) AS T4
FROM productlines pl
JOIN products p ON pl.productLine = p.productLine
JOIN orderdetails od ON p.productCode = od.productCode
JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY pl.productLine
ORDER BY pl.productLine;
