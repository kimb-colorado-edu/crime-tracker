from pymongo import MongoClient
import os
from fetch_data import fetch_data_rest


def save_data(data):
    print("Now saving data to MongoDB...")
    client = None
    try:
        client = MongoClient(
            host=os.getenv("DB_HOST", "localhost"),
            port=int(os.getenv("DB_PORT", "27017")),
            username=os.getenv("DB_USER", "root"),
            password=os.getenv("DB_PASSWORD", "example")
        )
        db = client[os.getenv("DB_NAME", "mydatabase")]
        collection = db["posts"]

        # Insert the fetched data into the posts collection
        collection.insert_many(data)

    except Exception as error:
        print(f"Error: {error}")
    finally:
        if client is not None:
            client.close()


if __name__ == "__main__":
    data = fetch_data_rest()
    save_data(data)
