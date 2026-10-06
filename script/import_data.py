import requests
from cassandra.cluster import Cluster

API_URL = (
    "https://opendata.paris.fr/api/explore/v2.1/catalog/datasets/"
    "velib-emplacement-des-stations/records?limit=20"
)

# Connexion à Cassandra
cluster = Cluster(["127.0.0.1"], port=9042)
session = cluster.connect("velib_tp2")

# Récupération des données API
response = requests.get(API_URL, timeout=30)
response.raise_for_status()
data = response.json()

stations = data.get("results", [])

print(f"{len(stations)} stations récupérées.")

def get_capacity_category(capacity):
    if capacity < 30:
        return "petite"
    elif capacity < 60:
        return "moyenne"
    else:
        return "grande"

def get_zone(station_id):
    # Zone dérivée à partir de l'identifiant de station.
    # Pour les identifiants numériques, on utilise les deux premiers chiffres.
    digits = "".join(ch for ch in str(station_id) if ch.isdigit())

    if len(digits) >= 2:
        return digits[:2]

    return "inconnue"


for station in stations:
    station_id = str(
        station.get("stationcode")
        or station.get("station_id")
        or station.get("id")
    )

    name = station.get("name") or "Inconnu"
    capacity = int(station.get("capacity") or 0)
    latitude = float(station.get("coordonnees_geo", {}).get("lat") or 0)
    longitude = float(station.get("coordonnees_geo", {}).get("lon") or 0)

    opening_hours = station.get("opening_hours")

    capacity_category = get_capacity_category(capacity)
    zone = get_zone(station_id)

    # REQ-01
    session.execute(
        """
        INSERT INTO stations_by_id
        (station_id, name, capacity, latitude, longitude, opening_hours)
        VALUES (%s, %s, %s, %s, %s, %s)
        """,
        (
            station_id,
            name,
            capacity,
            latitude,
            longitude,
            opening_hours,
        ),
    )

    # REQ-02
    session.execute(
        """
        INSERT INTO stations_by_name
        (name, station_id, capacity, latitude, longitude, opening_hours)
        VALUES (%s, %s, %s, %s, %s, %s)
        """,
        (
            name,
            station_id,
            capacity,
            latitude,
            longitude,
            opening_hours,
        ),
    )

    # REQ-03
    session.execute(
        """
        INSERT INTO stations_by_capacity
        (capacity, station_id, name, latitude, longitude, opening_hours)
        VALUES (%s, %s, %s, %s, %s, %s)
        """,
        (
            capacity,
            station_id,
            name,
            latitude,
            longitude,
            opening_hours,
        ),
    )

    # REQ-04
    session.execute(
        """
        INSERT INTO stations_by_category
        (capacity_category, name, station_id, capacity,
         latitude, longitude, opening_hours)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """,
        (
            capacity_category,
            name,
            station_id,
            capacity,
            latitude,
            longitude,
            opening_hours,
        ),
    )

    # REQ-05
    session.execute(
        """
        INSERT INTO stations_by_zone
        (zone, name, station_id, capacity,
         latitude, longitude, opening_hours)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """,
        (
            zone,
            name,
            station_id,
            capacity,
            latitude,
            longitude,
            opening_hours,
        ),
    )

    print(f"Importée : {station_id} - {name}")

cluster.shutdown()

print("Import terminé.")