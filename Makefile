DBT_PROJECT_DIR = .
DBT_PROFILE = "duckdb"
DBT_TARGET = dev

install:
	@echo "Installing dbt dependencies..."
	dbt deps --project-dir $(DBT_PROJECT_DIR)

run:
	@echo "Running dbt models..."
	dbt run --project-dir $(DBT_PROJECT_DIR) --profile $(DBT_PROFILE) --target $(DBT_TARGET)

test:
	@echo "Testing dbt models..."
	dbt test --project-dir $(DBT_PROJECT_DIR) --profile $(DBT_PROFILE) --target $(DBT_TARGET)

generate:
	@echo "Generating dbt documentation..."
	dbt docs generate --project-dir $(DBT_PROJECT_DIR) --profile $(DBT_PROFILE) --target $(DBT_TARGET)

serve:
	@echo "Serving dbt documentation..."
	dbt docs serve --project-dir $(DBT_PROJECT_DIR) --profile $(DBT_PROFILE) --target $(DBT_TARGET)

run-test: run test

clean:
	@echo "Cleaning dbt project..."
	dbt clean

all: install run test generate serve
	@echo "Done. Serving docs..."

help:
	@echo "Available make commands:"
	@echo "  make install      - Install dbt dependencies"
	@echo "  make run          - Run all dbt models"
	@echo "  make test         - Run dbt tests"
	@echo "  make generate     - Generate dbt documentation"
	@echo "  make serve        - Serve dbt documentation"
	@echo "  make run-test     - Run dbt models and tests"
	@echo "  make clean        - Clean up the dbt project"
	@echo "  make all          - Install, run, test, generate and serve docs"
