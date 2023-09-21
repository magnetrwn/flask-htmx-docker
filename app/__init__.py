import logging
import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

env_db_path = os.getenv("SQLITE_DBFILE")
env_db_log_path = os.getenv("SQLITE_LOGFILE")

app.config["SQLALCHEMY_DATABASE_URI"] = f"sqlite://{env_db_path}"
app.config["SQLALCHEMY_ECHO"] = False
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db = SQLAlchemy()
db.init_app(app)

logging.basicConfig(
    filename=env_db_log_path,
    format="[%(asctime)s] %(levelname)s %(name)s:\n%(message)s",
)
logging.getLogger("sqlalchemy.engine").setLevel(logging.INFO)

# from app.views import *
# from app.models import *

with app.app_context():
    db.create_all()
