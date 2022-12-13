from flask import Blueprint, request, jsonify, make_response
import json
from src import db

manufacturers = Blueprint('manufacturers', __name__)


# Add a manufacturer to the DB
@manufacturers.route('/manufacturers/add', methods=['POST'])
def add_manufacturer():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    country = request.form['country']
    state = request.form['state']
    email = request.form['email'] 
    phoneNumber = request.form['phoneNumber'] 
    firstname = request.form['firstName'] 
    lastname = request.form['lastName']
    query = f'INSERT INTO Manufacturer(Country, State_Or_Territory, Email, PhoneNum, First_Name, Last_Name) VALUES(\"{country}\", \"{state}\", \"{email}\", \"{phoneNumber}\", \"{firstname}\", \"{lastname}\")' 
    cursor.execute(query)
    db.get_db().commit()
    return "Success!"

# Get all manufacturers from the DB
@manufacturers.route('/manufacturers', methods=['GET'])
def get_manufacturers():
    cursor = db.get_db().cursor()
    cursor.execute('select ManufacturerID, PhoneNum, Email, First_Name, Last_Name from Manufacturer')
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
@manufacturers.route('/manufacturers/<userID>', methods=['GET'])
def get_manufacturer(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Manufacturer where ManufacturerID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response