from flask import Blueprint, request, jsonify, make_response
import json
from src import db

manufacturer = Blueprint('manufacturer_blueprint', __name__)

# Add a manufacturer to the DB
@manufacturer.route('/manufacturer/add', methods=['POST'])
def add_manufacturer():
    cursor = db.get_db().cursor()
    manufacturerID = request.form['manufacturerID'] 
    phoneNumber = request.form['phoneNumber'] 
    email = request.form['email'] 
    firstName = request.form['firstName'] 
    lastName = request.form['lastName']
    query = f'INSERT INTO manufacturer(manufacturerID, phoneNumber, email, fname, lname) VALUES(\"{manufacturerID}", \"{phoneNumber}", \"{email}", \"{firstName}", \"{lastName}" )' 
    cursor.execute(query)
    db.get_db().commit()
    return "Success!"

# Get all manufacturer from the DB
@manufacturer.route('/manufacturer', methods=['GET'])
def get_manufacturer():
    cursor = db.get_db().cursor()
    cursor.execute('select manufacturerID, phoneNumber, email, fname, \
        lname from manufacturer')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get manufacturer detail for manufacturer with particular manufacturerID
@manufacturer.route('/manufacturer/<manufacturerID>', methods=['GET'])
def get_manufacturer(manufacturerID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from manufacturer where manufacturerID = {0}'.format(manufacturerID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response