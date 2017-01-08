.PHONY: clean build up down run exec

clean:
	docker-compose rm -f || true
	docker rmi -f postgresql-cstore_fdw:latest || true

build: clean
	docker build -t postgresql-cstore_fdw .

up:
	mkdir -p .data .tmp
	docker-compose up

down:
	docker-compose down

exec:
	docker-compose exec db bash

run:
	docker-compose run db bash

psql:
	psql -h localhost -p 5432 -U postgres
