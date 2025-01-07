# Apache Superset – DuckDB

# Custom Docker image
Execute the steps below to setup a local Apache Superset instance—with DuckDB support—using Docker.

First create a .duckdb file using the latest version of the duckdb cli. Create a table called Users and insert 3 records in it.


## Build the image
```Shell
docker build -t supersets-duckdb-docker
```
The host path of the mount will be used in the source setting below
## Run the container
```Shell
sudo docker run -d -p 8080:8088     -e "SUPERSET_SECRET_KEY=jQYaBun0kb3qfFnklbwB3n9WzmyK65LbFsmzu+guRcpdUo/5xV5w8Whb"     --mount type=bind,source=/home/shekharsiva/testdir,target=/data     --name supersets-duckdb-docker     supersets-duckdb-docker

> Note: the local `/data` folder is mounted to make the data files accessible from within the container.
## Setup Superset
```Shell
./docker/setup.sh
```
This includes creating an admin user and configuring a DuckDB database connection.

## Navigate to UI
Go to http://localhost:8080/login/ and login with `username=admin` and `password=admin`.

## Check database connection
Go to _Database Connections_ (http://localhost:8080/databaseview/list/) to validate the database connection has been created:

Click the _Edit_ button to see the connection details:


```
```

Click `TEST CONNECTION` and make sure you see this popup message:


# Querying files from Superset using DuckDB
Go to _SQL Lab_ (http://localhost:8080/sqllab/) to query using below queries. 

```sql
SHOW TABLES

SELECT *
FROM '/data/json_table/*.json'
