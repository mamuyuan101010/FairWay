from sre_parse import State
from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

customers = Blueprint('customers', __name__)

@customers.route('/customers', methods=['POST'])
def customer_order():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    price = request.form['price']
    customerID = request.form['custID']
    productID = request.form['prodID']
    quantity = request.form['quant']
    country = request.form['country']
    city = request.form['city']
    State = request.form['state']
    street = request.form['street']
    query = f'INSERT INTO Invoice(Country, State, Street, City, Customer_ID) VALUES (\"{country}\", \"{State}\", \"{street}\", \"{city}\", \"{customerID}\")'
    query2 = f'INSERT INTO InvoiceLine(Quantity, UnitPrice, Receipt_ID, Product_ID) VALUES (\"{quantity}\", \"{price}\",  (Select max(InvoiceID) from Invoice), \"{productID}\")'
    cursor.execute(query)
    cursor.execute(query2)
    db.get_db().commit()
    return "Success!"

#could use to get an invoice for a particular invoice number
# Get customer detail for customer with particular userID
@customers.route('/customers/<userID>', methods=['GET'])
def get_customer(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Customer where CustID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@customers.route('/customers/shopping', methods=['GET'])
def show_product():
   cursor = db.get_db().cursor()
   cursor.execute('select * from Product')
   row_headers = [x[0] for x in cursor.description]
   json_data = []
   theData = cursor.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@customers.route('/customers_registration', methods=['POST'])
def customer_registration():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    email = request.form['email']
    phoneNum = request.form['phoneNum']
    firstN = request.form['firstName']
    lastN = request.form['lastName']
    BirthMonth = request.form['BirthMonth']
    BirthDate = request.form['BirthDate']
    BirthYear = request.form['BirthYear']
    StreetAdd = request.form['StreetAddress']
    city = request.form['city']
    state = request.form['state']
    country = request.form['country']
    zipcode = request.form['zipcode']
    query = f'INSERT INTO Customer(Email, Phone_Number, First_Name, Last_Name, Birth_Month, \
    Day_Of_Birth, Year_Of_Birth, Street, Country, City, Zip_Code, State) VALUES(\"{email}\", \"{phoneNum}\" \
    , \"{firstN}\", \"{lastN}\", \"{BirthMonth}\", \"{BirthDate}\", \"{BirthYear}\", \"{StreetAdd}\", \
    \"{city}\", \"{state}\", \"{country}\", \"{zipcode}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success!"


@customers.route('/customers_help', methods=['POST'])
def customer_help():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor
    customerID = request.form['customerID']
    requestSum = request.form['requestSum']
    WhotoHelp = request.form['assiID']
    orderID = request.form['orderID']
    query = f'INSERT INTO Help_Request(requestSum, Customer_ID, Customer_Service_ID, Order_ID) VALUES \
    (\"{requestSum}\, \"{customerID}\", \"{WhotoHelp}\", \"{orderID}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success!"