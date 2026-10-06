-- TP Cassandra - Verification des donnees

USE velib_tp2;

-- Verification du nombre de stations
SELECT COUNT(*) FROM stations_by_id;

-- Verification de quelques stations
SELECT * FROM stations_by_id LIMIT 10;

-- Verification par nom
SELECT * FROM stations_by_name
WHERE name = 'Pont Neuf - Rivoli';

-- Verification par capacit�
SELECT * FROM stations_by_capacity
WHERE capacity = 27;

-- Verification par cat�gorie
SELECT * FROM stations_by_category
WHERE capacity_category = 'petite'
LIMIT 10;

-- Verification par zone
SELECT * FROM stations_by_zone
WHERE zone = '11'
LIMIT 10;
