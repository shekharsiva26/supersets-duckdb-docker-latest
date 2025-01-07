# Create admin user.
docker exec -it supersets-duckdb-docker superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@superset.com \
    --password admin

# Upgrade database to latest.
docker exec -it supersets-duckdb-docker superset db upgrade

# Setup roles.
docker exec -it supersets-duckdb-docker superset init

# Create database connection for DuckDB.
docker exec -it supersets-duckdb-docker superset set_database_uri \
    -d DuckDB-persist \
    -u duckdb:////data/test.duckdb
