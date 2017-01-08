FROM postgres:9.6.1

# Install cstore_fdw
RUN apt-get update \
    && apt-get install -y git gcc make postgresql-server-dev-9.6 libpq-dev python-psycopg2 protobuf-c-compiler libprotobuf-c0-dev \
    && git clone https://github.com/citusdata/cstore_fdw /opt/cstore \
    && cd /opt/cstore && make && make install

# Add cstore_fdw to default PostgreSQL config
RUN echo "shared_preload_libraries='cstore_fdw'" >> /usr/share/postgresql/postgresql.conf.sample

# Add scripts to run after initdb
RUN  echo 'CREATE EXTENSION cstore_fdw;' > /docker-entrypoint-initdb.d/create-cstore-extension.sql
