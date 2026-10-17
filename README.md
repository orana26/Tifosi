# Projet Tifosi — Base de données MySQL

## Présentation

Ce projet consiste à concevoir et alimenter une base de données MySQL pour une enseigne de restauration proposant des focaccias, des ingrédients, des boissons, des marques et des menus.

## Technologies utilisées

- MySQL
- phpMyAdmin
- Visual Studio Code

## Structure du projet

- `01_creation_schema.sql` : création de la base de données et des tables.
- `02_insertion_donnees.sql` : insertion des ingrédients, des focaccias, de leurs compositions, des marques et des boissons.
- `03_requetes_test.sql` : dix requêtes SQL permettant de tester et d'exploiter les données.

## Installation

1. Ouvrir phpMyAdmin et se connecter à MySQL.
2. Exécuter le script `01_creation_schema.sql` sur une base vierge.
3. Exécuter ensuite `02_insertion_donnees.sql` pour insérer les données.
4. Exécuter `03_requetes_test.sql` pour vérifier les résultats des requêtes.

**Attention :** les scripts de création et d'insertion sont prévus pour initialiser une base vierge. Ne pas les exécuter à nouveau sur une base déjà remplie sans la réinitialiser au préalable.

## Modèle de données

La base contient neuf tables :

- `ingredient`
- `focaccia`
- `marque`
- `boisson`
- `client`
- `menu`
- `composer`
- `contenir`
- `acheter`

Les clés primaires et étrangères permettent de relier les tables et de préserver la cohérence des données.

## Tests

Le fichier `03_requetes_test.sql` contient dix requêtes de test portant notamment sur les focaccias, les ingrédients, les boissons, les marques et les compositions.

Les résultats obtenus sont à comparer aux résultats attendus dans le cadre du devoir.
