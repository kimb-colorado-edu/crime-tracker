# Define variables
DB_USER=root
DB_PASSWORD=example
DB_NAME=mydatabase
DB_HOST=localhost
DB_PORT=27017
FLASK_RUN_HOST=0.0.0.0
FLASK_RUN_PORT=9081

# Docker Compose up
.PHONY: up
up:
	@echo "Starting MongoDB container..."
	docker-compose up -d

# Wait for the database to be ready
.PHONY: wait
wait:
	@echo "Waiting for MongoDB container to be ready...5 secs"
	@sleep 5

# Run the Python script
.PHONY: fetch
fetch:
	@echo "Running  Python script to fetch RESTful data from external service..."
	DB_USER=$(DB_USER) \
	DB_PASSWORD=$(DB_PASSWORD) \
	DB_NAME=$(DB_NAME) \
	DB_HOST=$(DB_HOST) \
	DB_PORT=$(DB_PORT) \
	python3 src/save_data.py

.PHONY: run
run:
	@echo "Starting python app..."
	DB_USER=$(DB_USER) \
	DB_PASSWORD=$(DB_PASSWORD) \
	DB_NAME=$(DB_NAME) \
	DB_HOST=$(DB_HOST) \
	DB_PORT=$(DB_PORT) \
	FLASK_RUN_HOST=$(FLASK_RUN_HOST) \
    FLASK_RUN_PORT=$(FLASK_RUN_PORT) \
	python3 src/app.py

# Clean up
.PHONY: down
down:
	@echo "Stopping and removing containers..."
	docker-compose down

# Build all
.PHONY: build
build: up wait run fetch
