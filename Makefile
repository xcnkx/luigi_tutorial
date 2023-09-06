export LUIGI_CONFIG_PATH = app/conf/luigi.cfg
export PGPASSWORD = passw0rd

LUIGI_HOST := localhost

setup:
	poetry install

.PHONY: run/*
run/task:
	poetry run luigi --module app.task GenerateReport --scheduler-host $(LUIGI_HOST) --scheduler-port 8082

run/luigid:
	poetry run luigid

run/luigi-deps:
	poetry run luigi-deps --module app.task GenerateReport --scheduler-host $(LUIGI_HOST) --scheduler-port 8082

run/luigi-deps-tree:
	poetry run luigi-deps-tree --module app.task GenerateReport --scheduler-host $(LUIGI_HOST) --scheduler-port 8082

run/db:
	docker-compose up -d

.PHONY: down/*
down/db:
	docker-compose down

.PHONY: connnect/db
connect/db:
	psql -h localhost -U postgres

clean:
	rm -f outputs/*
	rm -f app/db/*.db
	rm -f app/luigi-state.pickle

