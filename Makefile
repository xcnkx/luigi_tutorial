export LUIGI_CONFIG_PATH = app/conf/luigi.cfg

setup:
	poetry install

run/task:
	poetry run luigi --module app.task GenerateReport --scheduler-host luigid-bg-test.ada.zucksdevelopers.vg --scheduler-port 80

run/luigid:
	poetry run luigid

clean:
	rm -f outputs/*
	rm -f app/db/*.db
	rm -f app/luigi-state.pickle

run/luigi-deps:
	poetry run luigi-deps --module app.task GenerateReport --scheduler-host localhost --scheduler-port 8082

run/luigi-deps-tree:
	poetry run luigi-deps-tree --module app.task GenerateReport --scheduler-host localhost --scheduler-port 8082