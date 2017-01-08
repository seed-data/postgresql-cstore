.PHONY: clean build up down run exec

clean:
	docker rmi -f postgresql-cstore_fdw:latest || true

build: clean
	docker build -t 'postgresql-cstore_fdw:latest' .

up: build
	mkdir -p .data .tmp
	docker-compose -p postgresql-cstore up

down:
	docker-compose -p postgresql-cstoredown

exec:
	docker-compose -p postgresql-cstore exec db bash

run:
	docker-compose -p postgresql-cstore run db bash

psql:
	docker-compose -p postgresql-cstore run db psql -h db -p 5432 -U postgres
