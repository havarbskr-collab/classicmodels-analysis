# ClassicModels – Analyse SQL

## Contexte du projet
Ce projet a pour objectif d’analyser la base de données **ClassicModels**
à l’aide de requêtes SQL, puis d’interpréter les résultats d’un point de vue métier.

La base représente l’activité commerciale d’une entreprise spécialisée
dans la vente de modèles réduits (clients, employés, produits, commandes, paiements).

---

## Partie 1 – Analyse exploratoire

### Structure générale de la base
La base ClassicModels contient plusieurs tables principales :
clients, employés, bureaux, produits, commandes et paiements.
Cette structure permet d’analyser l’ensemble du cycle de vente.

### Nombre d’enregistrements par table
L’analyse montre que la base contient :
- 122 clients
- 23 employés
- 7 bureaux

**Interprétation :**  
Le nombre élevé de clients par rapport au nombre d’employés et de bureaux
suggère une organisation commerciale centralisée avec un portefeuille client étendu.


### Répartition géographique des clients
Les clients sont répartis dans plusieurs pays, avec une forte concentration
aux États-Unis et en Europe.

**Interprétation :**  
L’activité commerciale est principalement orientée vers les marchés
nord-américains et européens, qui constituent les zones stratégiques de l’entreprise.


### Commandes par statut
La majorité des commandes possède le statut *Shipped*.

**Interprétation :**  
Cela indique un processus logistique globalement efficace et un bon taux
de finalisation des ventes.


### Chiffre d’affaires total
Le chiffre d’affaires total correspond à la somme des ventes réalisées
sur l’ensemble des commandes.

**Interprétation :**  
Cet indicateur permet d’évaluer la performance commerciale globale de l’entreprise.


### Panier moyen
Le panier moyen représente la valeur moyenne d’une commande.

**Interprétation :**  
Il permet d’analyser le comportement d’achat des clients et le niveau
de dépense moyen par transaction.


### Produits les plus vendus
Les produits les plus vendus en quantité constituent le cœur des ventes.

**Interprétation :**  
Ces produits sont stratégiques et doivent être suivis attentivement
en matière de gestion des stocks.


### Meilleurs clients
Une part importante du chiffre d’affaires est générée par un nombre
limité de clients.

**Interprétation :**  
Ces clients sont stratégiques et doivent être fidélisés.


### Performance des employés
Un employé se distingue par le chiffre d’affaires généré.

**Interprétation :**  
Cela permet d’identifier les meilleures performances commerciales.


### Gamme de produits la plus rentable
La gamme **Classic Cars** génère le chiffre d’affaires le plus élevé.

**Interprétation :**  
Cette gamme constitue l’axe stratégique principal de l’entreprise.

---

## Conclusion
Cette analyse exploratoire met en évidence les principaux leviers
de performance commerciale de l’entreprise et constitue une base solide
pour des analyses plus avancées.

-------------------------------------------------

## Partie 2 – Requêtes SQL avancées

Cette partie vise à répondre à des problématiques métier avancées à l’aide de requêtes SQL complexes (fonctions analytiques, CTE récursifs, sous-requêtes corrélées et rapports de type pivot).


### 1. Analyse des ventes avec WINDOW FUNCTIONS

**Objectif :**  
Analyser l’évolution mensuelle du chiffre d’affaires et lisser les variations à l’aide d’une moyenne mobile sur 3 mois.

**Résultat clé :**  
La moyenne mobile met en évidence :
- une forte croissance fin 2003 et fin 2004,
- une saisonnalité marquée avec des pics en fin d’année,
- une stabilisation progressive du chiffre d’affaires en 2005.

**Intérêt métier :**  
Cette analyse permet d’anticiper les périodes fortes et faibles pour mieux planifier les stocks et les actions commerciales.


### 2. Hiérarchie organisationnelle avec CTE récursif

**Objectif :**  
Reconstituer la hiérarchie des employés à partir des relations manager → subordonné.

**Résultat clé :**  
- La structure organisationnelle est clairement hiérarchisée sur plusieurs niveaux.
- Certains managers supervisent un nombre important d’employés, indiquant des rôles clés dans l’entreprise.

**Intérêt métier :**  
Cette requête facilite l’analyse des responsabilités managériales et peut servir pour l’évaluation de la performance ou la réorganisation interne.


### 3. Segmentation des clients VIP

**Objectif :**  
Segmenter les clients en fonction de leur chiffre d’affaires total.

**Méthode :**
- Clients **VIP** : chiffre d’affaires élevé
- Clients **Standard** : chiffre d’affaires plus modéré

**Résultat clé :**  
- Une minorité de clients génère une part significative du chiffre d’affaires.
- La majorité des clients appartient au segment Standard.

**Intérêt métier :**  
Cette segmentation permet de cibler des actions marketing spécifiques pour les clients VIP (fidélisation, offres personnalisées).


### 4. Analyse temporelle – nouveaux clients par année

**Objectif :**  
Identifier le nombre de nouveaux clients par année, basé sur la date de leur première commande.

**Résultat clé :**
- Forte acquisition de nouveaux clients en 2003.
- Baisse notable des nouveaux clients en 2004.

**Interprétation métier :**  
La diminution des nouveaux clients peut indiquer :
- un ralentissement de la prospection,
- ou un marché arrivé à maturité.

Cela souligne l’importance de stratégies d’acquisition ou de réactivation client.


### 5. Rapport PIVOT – ventes par gamme de produits et trimestre

**Objectif :**  
Analyser la répartition des ventes par gamme de produits et par trimestre.

**Résultat clé :**
- La gamme **Classic Cars** domine largement les ventes sur tous les trimestres.
- Les ventes sont généralement plus élevées au T4, confirmant une saisonnalité forte.
- Certaines gammes (Trains, Ships) ont un poids plus faible mais stable.

**Intérêt métier :**  
Ce rapport aide à :
- identifier les gammes stratégiques,
- ajuster les stocks selon les périodes,
- prioriser les investissements commerciaux.

---

### Conclusion – Partie 2

Les requêtes SQL avancées ont permis d’aller au-delà de l’analyse descriptive en apportant :
- une vision temporelle,
- une segmentation client,
- une analyse organisationnelle,
- et une compréhension fine des performances par produit.

Ces analyses constituent une base solide pour les visualisations Python et les analyses prédictives des parties suivantes.

-------------------------------------------------

### Partie 3 - Visualisation python

Cette partie exploite la base *classicmodels* via des requêtes SQL exécutées en Python (pandas), puis visualisées avec matplotlib / seaborn.

---

### Évolution mensuelle du chiffre d’affaires

**Objectif :** analyser la dynamique des ventes dans le temps.

Résultats observés :

- Le chiffre d’affaires varie entre **~100 000 et ~1 000 000**.
- Deux pics majeurs apparaissent :
  - Fin 2003 (~1 000 000)
  - Fin 2004 (~1 000 000)
- Les périodes creuses tournent autour de **200 000 – 300 000**.
- On observe une saisonnalité avec de fortes hausses en fin d’année.

L’activité commerciale est cyclique avec des pics importants en fin d’année.

---

### Répartition du chiffre d’affaires par pays

**Objectif :** identifier les marchés les plus rentables.

Résultats observés :

- USA : ~3 200 000 (marché dominant)
- Espagne : ~1 100 000
- France : ~1 000 000
- Australie : ~600 000
- Les autres pays sont en dessous de 500 000

Le marché américain représente à lui seul une part très significative du chiffre d’affaires.

---

### Ventes par gamme de produits

**Objectif :** identifier les catégories les plus performantes.

Résultats observés :

- Classic Cars : ~3 900 000
- Vintage Cars : ~1 800 000
- Motorcycles : ~1 100 000
- Trucks and Buses : ~1 000 000
- Trains : catégorie la moins performante

Les Classic Cars dominent largement les ventes.

---

### Top 10 des produits les plus vendus

**Objectif :** identifier les produits les plus populaires.

Produit le plus vendu :

- 1992 Ferrari 360 Spider red (~1 800 unités)

Autres produits performants :

- 1937 Lincoln Berline
- American Airlines MD-11S
- 1941 Chevrolet Special Deluxe Cabriolet
- 1930 Buick Marquette Phaeton

Les véhicules de collection dominent le classement.

---

### Analyse de l’état des stocks

**Objectif :** identifier les produits en rupture ou en stock faible.

Résultats :

- Stock suffisant : ~104 produits
- Stock faible : ~5 produits
- Aucune rupture détectée

Exemples de produits en stock faible :

- 1960 BSA Gold Star DBD34 (15 unités)
- 1968 Ford Mustang (68 unités)
- 1928 Ford Phaeton Deluxe (136 unités)

Globalement, la gestion des stocks est saine, mais certains produits nécessitent un réapprovisionnement rapide.

---

### Top 10 clients (chiffre d’affaires)

**Objectif :** identifier les clients les plus rentables.

Résultats :

- Euro+ Shopping Channel : ~800 000
- Mini Gifts Distributors Ltd. : ~600 000
- Australian Collectors Co. : ~200 000
- Les autres clients sont entre 100 000 et 200 000

Les 2 premiers clients représentent une part très importante du chiffre d’affaires total.

