from flask import Flask, request, jsonify
from flask_cors import CORS
from pymongo import MongoClient
from bson.objectid import ObjectId
import config

app = Flask(__name__)
CORS(app)

# MongoDB Connection
client = MongoClient(config.MONGO_URI)
db = client[config.DATABASE]
collection = db[config.COLLECTION]


# ---------------- HOME ----------------

@app.route("/")
def home():
    return "Backend API Connected Successfully"


# ---------------- HEALTH ----------------

@app.route("/health")
def health():
    return jsonify({
        "status": "UP",
        "database": "MongoDB Connected"
    })


# ---------------- GET ALL STUDENTS ----------------

@app.route("/users")
def users():

    students = []

    for student in collection.find():

        student["_id"] = str(student["_id"])

        students.append(student)

    return jsonify(students)


# ---------------- CREATE STUDENT ----------------

@app.route("/submit", methods=["POST"])
def submit():

    name = request.form.get("name")
    email = request.form.get("email")

    if not name or not email:

        return jsonify({
            "status": "error",
            "message": "Name and Email required"
        }), 400

    collection.insert_one({
        "name": name,
        "email": email
    })

    return jsonify({
        "status": "success",
        "message": "Student Registered Successfully"
    })


# ---------------- DELETE STUDENT ----------------

@app.route("/delete/<email>", methods=["DELETE"])
def delete_student(email):

    result = collection.delete_one({
        "email": email
    })

    if result.deleted_count == 1:

        return jsonify({
            "status": "success",
            "message": "Student deleted successfully"
        })

    return jsonify({
        "status": "error",
        "message": "Student not found"
    }), 404


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
