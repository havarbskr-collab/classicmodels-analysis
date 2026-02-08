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
