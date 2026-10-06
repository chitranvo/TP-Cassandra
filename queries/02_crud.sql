-- TP Cassandra - CRUD
-- Station de test : 99999

USE velib_tp2;

-- INSERT
INSERT INTO stations_by_id
(station_id, name, capacity, latitude, longitude, opening_hours)
VALUES
('99999', 'Station Test Cassandra', 25, 48.85000, 2.35000, '24/7');

INSERT INTO stations_by_name
(name, station_id, capacity, latitude, longitude, opening_hours)
VALUES
('Station Test Cassandra', '99999', 25, 48.85000, 2.35000, '24/7');

INSERT INTO stations_by_capacity
(capacity, station_id, name, latitude, longitude, opening_hours)
VALUES
(25, '99999', 'Station Test Cassandra', 48.85000, 2.35000, '24/7');

INSERT INTO stations_by_category
(capacity_category, name, station_id, capacity, latitude, longitude, opening_hours)
VALUES
('petite', 'Station Test Cassandra', '99999', 25, 48.85000, 2.35000, '24/7');

INSERT INTO stations_by_zone
(zone, name, station_id, capacity, latitude, longitude, opening_hours)
VALUES
('99', 'Station Test Cassandra', '99999', 25, 48.85000, 2.35000, '24/7');

-- UPDATE
UPDATE stations_by_id
SET capacity = 30
WHERE station_id = '99999';

-- DELETE
DELETE FROM stations_by_id
WHERE station_id = '99999';

DELETE FROM stations_by_name
WHERE name = 'Station Test Cassandra'
  AND station_id = '99999';

DELETE FROM stations_by_capacity
WHERE capacity = 25
  AND station_id = '99999';

DELETE FROM stations_by_category
WHERE capacity_category = 'petite'
  AND name = 'Station Test Cassandra'
  AND station_id = '99999';

DELETE FROM stations_by_zone
WHERE zone = '99'
  AND name = 'Station Test Cassandra'
  AND station_id = '99999';
