# MongoDB Data Fetch and Save App

This project demonstrates how to fetch data from an external source and save it into a MongoDB database running in a Docker container. The entire process is orchestrated using a Makefile.

## Prerequisites

Make sure you have the following installed on your machine:
- Docker
- Docker Compose
- Python 3.x
- `pip` (Python package installer)

## Setup Instructions

1. **Clone the Repository**

    ```sh
    git clone https://github.com/kimb-colorado-edu/crime-tracker.git
    cd crime-tracker
    ```

2. **Install Python Dependencies**

   Install the required Python packages:

    ```sh
    pip install requests pymongo
    ```
    ```sh
    pip install -r requirements.txt
    ```

## Running the Application

1. **Start the Docker container, wait for it to initialize, and run the Python script:**

    ```sh
    make build
    ```

   This command will:
   - Start the MongoDB container using Docker Compose.
   - Wait for the container to be ready.
   - Run the Python script to fetch data and save it into the MongoDB database.

2. **Clean up the Docker containers after you're done:**

    ```sh
    make down
    ```

   This command will stop and remove the MongoDB Docker container.

## Verifying the Data

You can verify that the data has been saved in the MongoDB database by connecting to the MongoDB container and querying the `posts` collection:

```sh
docker exec -it mongo mongo -u root -p example --authenticationDatabase admin
