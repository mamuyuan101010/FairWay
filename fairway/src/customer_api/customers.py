from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

customers = Blueprint('customers', __name__)

@customers.route('/customers', methods=['POST'])
def customer_order():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    customerID = request.form['custID']
    productID = request.form['prodID']
    quantity = request.form['quant']
    query = f'INSERT INTO Invoice(Country, State, Street, City, Customer_ID)\
    VALUES((select Country, State, Street, City from Customer where Customer.CustID \
    = {customerID}), \"{customerID}\")'
    query2 = f'INSERT INTO InvoiceLine(Quantity, UnitPrice, Receipt_ID, Product_ID) \
    VALUES(\"{quantity}\", (select Price from Product where Product.ProductId \
    = {productID}), (select max(Invoice_LineID) from InvoiceLine), \"{productID}\")'
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

@customers.route('/customers/shopping')
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
