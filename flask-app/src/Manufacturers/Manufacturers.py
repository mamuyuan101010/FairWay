from flask import Blueprint, request, jsonify, make_response
import json
from src import db


manufacturers = Blueprint('manufacturers', __name__)

# Add a manufacturer to the DB
@manufacturers.route('/manufacturers', methods=['POST'])
def add_manufacturer():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    manufacturerID = request.form['manufacturerID'] 
    phoneNumber = request.form['phoneNumber'] 
    email = request.form['email'] 
    fname = request.form['firstName'] 
    lname = request.form['lastName']
    query = f'INSERT INTO manufacturers(manufacturerID, phoneNumber, email, fname, lname) VALUES(\"{manufacturerID}", \"{phoneNumber}", \"{email}", \"{firstName}", \"{lastName}" )' 
    cursor.execute(query)
    db.get_db().commit()
    return "Success!"

# Get all manufacturers from the DB
@manufacturers.route('/manufacturers', methods=['GET'])
def get_manufacturers():
    cursor = db.get_db().cursor()
    cursor.execute('select manufacturerID, phoneNumber, email, fname, \
        lname from manufacturers')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get manufacturer detail for manufacturer with particular userID
@manufacturers.route('/manufacturers/<manufacturerID>', methods=['GET'])
def get_manufacturer(manufacturerID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from manufacturers where manufacturerID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response