# TP — Exploitation des données avec Apache Cassandra

## M2 Big Data & IA — Données distribuées

### 1. Objectif

Ce projet consiste à exploiter des données issues de l'API Vélib' et à les intégrer dans Apache Cassandra.

Les objectifs sont :

* intégrer les données de l'API dans Cassandra ;
* définir un modèle de données adapté à Cassandra ;
* identifier les clés de partition et les clés de clustering ;
* réaliser des opérations CQL de consultation, insertion, modification et suppression ;
* répondre à au moins 5 besoins métier avec des requêtes CQL ;
* documenter les choix de modélisation ;
* versionner le projet avec Git.

### 2. Technologies

* Apache Cassandra
* CQL
* Python
* API Open Data Vélib'
* Git / GitHub ou GitLab

### 3. Source des données

Les données utilisées proviennent de l'API Open Data Vélib' de Paris.

API utilisée :

https://opendata.paris.fr/api/explore/v2.1/catalog/datasets/velib-emplacement-des-stations/records

### 4. Organisation du projet

```text
TP-Cassandra/

├── README.md

├── queries/
│   ├── 01_verification.sql
│   ├── 02_crud.sql
│   └── 03_requetes_metier.sql

├── documentation/
│   └── modelisation.md

└── data/
```
