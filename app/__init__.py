import logging
import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

env_db_path = os.getenv("SQLITE_DBFILE")
env_db_log_path = os.getenv("SQLITE_LOGFILE")

# Careful: must use an absolute path
app.config["SQLALCHEMY_DATABASE_URI"] = f"sqlite://{env_db_path}"
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

logging.basicConfig(
    filename=env_db_log_path,
    format="[%(asctime)s] %(levelname)s %(name)s:\n%(message)s",
)
logging.getLogger("sqlalchemy.engine").setLevel(logging.INFO)
