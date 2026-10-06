-- TP Cassandra - Requetes metier
-- Aucune requete n'utilise ALLOW FILTERING.

USE velib_tp2;

-- REQ-01 : consulter une station par son identifiant
SELECT * FROM stations_by_id
WHERE station_id = '1117';

-- REQ-02 : rechercher une station par son nom
SELECT * FROM stations_by_name
WHERE name = 'Pont Neuf - Rivoli';

-- REQ-03 : consulter les stations ayant une capacite donnée
SELECT * FROM stations_by_capacity
WHERE capacity = 27;

-- REQ-04 : consulter les stations selon une categorie de capacite
SELECT * FROM stations_by_category
WHERE capacity_category = 'petite'
LIMIT 10;

-- REQ-05 : consulter les stations appartenant a une zone donnée
SELECT * FROM stations_by_zone
WHERE zone = '11'
LIMIT 10;
