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

---

### Nombre d’enregistrements par table
L’analyse montre que la base contient :
- 122 clients
- 23 employés
- 7 bureaux

**Interprétation :**  
Le nombre élevé de clients par rapport au nombre d’employés et de bureaux
suggère une organisation commerciale centralisée avec un portefeuille client étendu.

---

### Répartition géographique des clients
Les clients sont répartis dans plusieurs pays, avec une forte concentration
aux États-Unis et en Europe.

**Interprétation :**  
L’activité commerciale est principalement orientée vers les marchés
nord-américains et européens, qui constituent les zones stratégiques de l’entreprise.

---

### Commandes par statut
La majorité des commandes possède le statut *Shipped*.

**Interprétation :**  
Cela indique un processus logistique globalement efficace et un bon taux
de finalisation des ventes.

---

### Chiffre d’affaires total
Le chiffre d’affaires total correspond à la somme des ventes réalisées
sur l’ensemble des commandes.

**Interprétation :**  
Cet indicateur permet d’évaluer la performance commerciale globale de l’entreprise.

---

### Panier moyen
Le panier moyen représente la valeur moyenne d’une commande.

**Interprétation :**  
Il permet d’analyser le comportement d’achat des clients et le niveau
de dépense moyen par transaction.

---

### Produits les plus vendus
Les produits les plus vendus en quantité constituent le cœur des ventes.

**Interprétation :**  
Ces produits sont stratégiques et doivent être suivis attentivement
en matière de gestion des stocks.

---

### Meilleurs clients
Une part importante du chiffre d’affaires est générée par un nombre
limité de clients.

**Interprétation :**  
Ces clients sont stratégiques et doivent être fidélisés.

---

### Performance des employés
Un employé se distingue par le chiffre d’affaires généré.

**Interprétation :**  
Cela permet d’identifier les meilleures performances commerciales.

---

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

## Partie 2 – Analyse avancée

Cette seconde partie prolonge l’analyse exploratoire (Partie 1) en approfondissant
la performance commerciale selon le temps, les clients, les produits et les employés.

### 1. Chiffre d’affaires par mois et par année

L’analyse temporelle met en évidence une évolution croissante du chiffre d’affaires
entre 2003 et 2004, avec un pic marqué en fin d’année (notamment en novembre).

**Interprétation :**  
L’activité commerciale présente une forte saisonnalité, avec une concentration
des ventes sur le dernier trimestre. Cela suggère une dépendance aux périodes de fêtes
et la nécessité d’anticiper les stocks et la logistique sur ces périodes clés.

---

### 2. Chiffre d’affaires par année

- 2003 : ~3,3 M  
- 2004 : ~4,5 M  
- 2005 : ~1,8 M (année incomplète)

**Interprétation :**  
L’année 2004 représente la meilleure performance commerciale.
La baisse observée en 2005 s’explique principalement par des données partielles.
La croissance entre 2003 et 2004 confirme une dynamique commerciale positive.

---

### 3. Top 10 des clients les plus rentables

Une part importante du chiffre d’affaires est générée par un nombre limité de clients,
notamment *Euro+ Shopping Channel* et *Mini Gifts Distributors Ltd.*

**Interprétation :**  
L’entreprise repose fortement sur quelques clients stratégiques.
Une politique de fidélisation ciblée est essentielle afin de sécuriser ces revenus.

---

### 4. Répartition des commandes par statut

La majorité des commandes sont au statut **Shipped**, avec très peu de commandes
annulées ou litigieuses.

**Interprétation :**  
Le processus opérationnel est globalement fiable et maîtrisé.
Le faible nombre de commandes annulées ou disputées reflète une bonne qualité de service.

---

### 5. Produits les plus vendus (en volume)

Les produits les plus vendus en quantité incluent notamment :
- *1992 Ferrari 360 Spider red*
- *1937 Lincoln Berline*
- *American Airlines: MD-11S*

**Interprétation :**  
Ces produits constituent des références à fort volume de vente.
Ils jouent un rôle clé dans la rotation des stocks.

---

### 6. Produits générant le plus de chiffre d’affaires

Les produits les plus rentables en valeur ne sont pas nécessairement
ceux vendus en plus grande quantité.

**Interprétation :**  
Certains produits à forte valeur unitaire contribuent fortement au chiffre d’affaires,
ce qui souligne l’importance de la stratégie de pricing.

---

### 7. Performance des employés (chiffre d’affaires)

Des écarts significatifs de performance sont observés entre les commerciaux,
avec certains employés générant une part importante des ventes.

**Interprétation :**  
Ces résultats permettent d’identifier les meilleurs commerciaux
et peuvent servir de base à des politiques de primes ou de formation.

---

### 8. Gamme de produits la plus rentable

La gamme **Classic Cars** génère le chiffre d’affaires le plus élevé.

**Interprétation :**  
Cette gamme constitue le pilier stratégique de l’entreprise.
Elle doit être priorisée en matière de marketing, d’approvisionnement et d’innovation.

---

## Conclusion générale

L’analyse avancée confirme les enseignements de la partie exploratoire :
l’activité repose sur une forte saisonnalité, des clients clés et une gamme
de produits dominante. Ces résultats constituent une base solide pour
des analyses prédictives ou stratégiques futures.
