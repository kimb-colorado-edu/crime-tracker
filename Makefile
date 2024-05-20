# Define variables
DB_USER=root
DB_PASSWORD=example
DB_NAME=mydatabase
DB_HOST=localhost
DB_PORT=27017

# Docker Compose up
.PHONY: up
up:
	@echo "Starting MongoDB container..."
	docker-compose up -d

# Wait for the database to be ready
.PHONY: wait
wait:
	@echo "Waiting for MongoDB container to ready...5 secs"
	@sleep 5

# Run the Python script
.PHONY: run
run:
	@echo "Running  Python script to fetch RESTful data from external service..."
	DB_USER=$(DB_USER) \
	DB_PASSWORD=$(DB_PASSWORD) \
	DB_NAME=$(DB_NAME) \
	DB_HOST=$(DB_HOST) \
	DB_PORT=$(DB_PORT) \
	python3 src/save_data.py

# Wait for the database to be ready
.PHONY: wait
wait:
	@echo "waiting for fetched data to be saved and propagated...3 secs"
	@sleep 3

# Run the Python script
.PHONY: run
run:
	@echo "starting python app containing results from Database..."
	python3 src/app.py

# Clean up
.PHONY: down
down:
	@echo "Stopping and removing containers..."
	docker-compose down

# Build all
.PHONY: build
build: up wait run
