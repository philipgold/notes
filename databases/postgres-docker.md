# Build and run docker postgresSQL 

```
docker run --name cads-postgres -itd --restart always -p 5432:5432 -e POSTGRES_PASSWORD=bigdata  -v postgres-data:/var/lib/postgresql postgres:10.5
```

## Links

* [postgres docker offical repository](https://hub.docker.com/_/postgres/)
* [Running PostgreSQL in Docker (jun 2017)](http://tleyden.github.io/blog/2017/06/14/running-postgresql-in-docker/) 