import requests
import json


def fetch_data_rest():
    url = "https://jsonplaceholder.typicode.com/posts"
    response = requests.get(url)
    response.raise_for_status()
    print("returned results from ", url)
    return response.json()


if __name__ == "__main__":
    data = fetch_data_rest()
    #print(data)
