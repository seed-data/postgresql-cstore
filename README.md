# PostgreSQL with cstore_fdw

This docker image implements a columnar store for PostgreSQL. Columnar stores provide notable benefits for analytic use-cases where data is loaded in batches. If you have billions or trillions of rows a traditional SQL database can't handle this, so the ![cstore_fdw][cstore_fdw] has been added to implement a columnar store for PostgreSQL.

## Introduction
This docker image will startup a single server instance of PostgreSQL with cstore_fdw installed and enabled. It is designed and suitable for demo and evaluation of columnar stores in a PostgreSQL environment. For more information, see the ![cstore_fdw][cstore_fdw] github page.

The PostgreSQL image is based on [the official PostgreSQL image][docker-postgres] using standard configuration values. Please consult the [image][docker-postgres] for advanced configuration options (including non-default settings for e.g. `PGDATA` or `POSTGRES_USER`).

Just like the standard PostgreSQL image, this image exposes port `5432`. In other words, all containers on the same Docker network should be able to connect on this port, and exposing it externally will permit connections from external clients (`psql`, adapters, applications).

## Usage

### Docker Compose

The included `docker-compose.yml` and `Makefile` file provide an easy way to get started. Just clone the project into your local folder and run:

```bash
make up
# Runs:
# >>> docker build -t postgresql-cstore:latest .
# >>> docker-compose -p postgresql-cstore up
```

That’s it! As with the standalone mode, you’ll want to find you have access to the docker image by running `make psql` or `make exec`.

### Makefile

This project includes a Makefile with some helpful starter commands:
- build: Just build the docker image 'postgresql-cstore:latest'
- up: Start the docker-compose image
- down: Stop the docker-compose image
- psql: Open PSQL in the docker-compose image
- exec: Open a bash shell in the running docker-compose image

For convenience the Makefile included with this project assumes we are using the default values:
- Port 5432
- User postgres
- Data Volume: /var/lib/postgresql/data


## License

The following license information (and associated [LICENSE][license] file) apply _only to the files within **this** repository_. Please consult cstore_fdw and Postgres repositories for information regarding their licensing.

Copyright © 2017 Glenn Nagel

Licensed under the MIT license.

[license]: LICENSE
[docker-postgres]: https://hub.docker.com/_/postgres/
[compose-config]: docker-compose.yml
[cstore_fdw]: https://github.com/citusdata/cstore_fdw
