from flask import Flask, render_template
from pymongo import MongoClient
import os

app = Flask(__name__)


def get_db():
    client = MongoClient(
        host=os.getenv("DB_HOST", "localhost"),
        port=int(os.getenv("DB_PORT", "27017")),
        username=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", "example")
    )
    db = client[os.getenv("DB_NAME", "mydatabase")]
    return db


@app.route('/')
def index():
    db = get_db()
    posts = db.posts.find()
    return render_template('index.html', posts=posts)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=9081)
