# Modélisation Cassandra - Vélib

## 1. Principe de modélisation

Le modèle Cassandra est construit à partir des besoins de lecture.
Chaque besoin métier possède une table dédiée afin d'éviter les requêtes avec
`ALLOW FILTERING`.

Les données sont dénormalisées dans plusieurs tables. Une même station peut donc
être présente dans plusieurs tables avec une clé de partition différente.

## 2. Tables et clés

| Besoin | Table | Partition key | Clustering key |
|---|---|---|---|
| REQ-01 : station par identifiant | stations_by_id | station_id | aucune |
| REQ-02 : station par nom | stations_by_name | name | station_id |
| REQ-03 : stations par capacité | stations_by_capacity | capacity | station_id |
| REQ-04 : stations par catégorie | stations_by_category | capacity_category | name, station_id |
| REQ-05 : stations par zone | stations_by_zone | zone | name, station_id |

## 3. REQ-01 - Consulter une station par son identifiant

La table `stations_by_id` utilise `station_id` comme clé de partition.

Cette modélisation permet de retrouver directement une station à partir de son
identifiant, sans filtrage supplémentaire.

```sql
SELECT * FROM stations_by_id
WHERE station_id = '1117';
