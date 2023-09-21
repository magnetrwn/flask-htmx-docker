import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

db_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "../db/sqlite.db")

app.config["SQLALCHEMY_DATABASE_URI"] = f"sqlite:///{db_path}"
app.config["SQLALCHEMY_ECHO"] = False
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db = SQLAlchemy()
db.init_app(app)

# Once the app is initialized, import the views and models
from app.views import *
from app.models import *

# Create the database tables only after the app is initialized
with app.app_context():
    db.create_all()
