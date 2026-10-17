
USE tifosi;

-- =====================================================
-- REQUETE 1 : Afficher les focaccias par ordre alphabetique
-- Resultat attendu : 8 focaccias triees par nom
-- =====================================================
SELECT nom
FROM focaccia
ORDER BY nom ASC;


-- =====================================================
-- REQUETE 2 : Compter le nombre total d'ingredients
-- Resultat attendu : 25
-- =====================================================
SELECT COUNT(*) AS nombre_total_ingredients
FROM ingredient;


-- =====================================================
-- REQUETE 3 : Calculer le prix moyen des focaccias
-- Resultat attendu : 10.38 euros environ
-- =====================================================
SELECT ROUND(AVG(prix), 2) AS prix_moyen
FROM focaccia;


-- =====================================================
-- REQUETE 4 : Lister les boissons avec leur marque
-- Resultat attendu : 12 boissons avec leur marque
-- =====================================================
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;


-- =====================================================
-- REQUETE 5 : Afficher les ingredients de la Raclaccia
-- Resultat attendu : 7 ingredients
-- =====================================================
SELECT i.nom AS ingredient, c.quantite
FROM composer c
JOIN focaccia f ON c.id_focaccia = f.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE f.nom = 'Raclaccia'
ORDER BY i.nom ASC;


-- =====================================================
-- REQUETE 6 : Compter les ingredients de chaque focaccia
-- Resultat attendu : 8 focaccias avec leur nombre
-- =====================================================
SELECT f.nom, COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia f
LEFT JOIN composer c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY f.nom ASC;


-- =====================================================
-- REQUETE 7 : Trouver la focaccia avec le plus d'ingredients
-- Resultat attendu : Paysanne, 12 ingredients
-- =====================================================
SELECT f.nom, COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia f
JOIN composer c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
HAVING COUNT(c.id_ingredient) = (
    SELECT MAX(nombre)
    FROM (
        SELECT COUNT(*) AS nombre
        FROM composer
        GROUP BY id_focaccia
    ) AS comptes
);


-- =====================================================
-- REQUETE 8 : Lister les focaccias contenant de l'ail
-- Resultat attendu : 4 focaccias
-- =====================================================
SELECT f.nom
FROM focaccia f
JOIN composer c ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail'
ORDER BY f.nom ASC;


-- =====================================================
-- REQUETE 9 : Lister les ingredients inutilises
-- Resultat attendu : Salami et Tomate cerise
-- =====================================================
SELECT i.nom
FROM ingredient i
LEFT JOIN composer c ON i.id_ingredient = c.id_ingredient
WHERE c.id_ingredient IS NULL
ORDER BY i.nom ASC;


-- =====================================================
-- REQUETE 10 : Lister les focaccias sans champignons
-- Resultat attendu : Hawaienne et Americaine
-- =====================================================
SELECT f.nom
FROM focaccia f
WHERE NOT EXISTS (
    SELECT 1
    FROM composer c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE c.id_focaccia = f.id_focaccia
      AND i.nom = 'Champignon'
)
ORDER BY f.nom ASC;
