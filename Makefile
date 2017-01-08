.phony: clean build up down run exec

clean:
	docker rmi -f postgresql-cstore_fdw:latest

build: clean
	docker build -t 'postgresql-cstore_fdw:latest' .

up: build
	docker-compose up

down:
	docker-compose down

exec:
	docker-compose exec db bash

run:
	docker-compose run db bash

psql:
	docker-compose run db psql -h db -p 5432 -U postgres
