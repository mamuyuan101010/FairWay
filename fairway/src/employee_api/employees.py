from flask import Blueprint, request, jsonify, make_response
import json
from src import db

# Create a new blueprint for employee
employees = Blueprint('employees_blueprint', __name__)

# add a route to this blueprint
@employees.route('/employees')
def employee_login():
    return "<h1>Customer's satisfaction is our first priority</h1>"

@employees.route('/employees/<userID>', methods=['GET'])
def get_customer(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Help_Request where Customer_Service_ID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@employees.route('/employees/orderdetail')
def get_order_detail():
   cursor = db.get_db().cursor()
   query = f'select InvoiceID, Purchase_Date, invoice.Country, invoice.State, invoice.City, Customer_ID, First_Name, Last_Name, Product_ID, Name, Quantity, UnitPrice, (UnitPrice * InvoiceLine.Quantity) as total from invoice inner join Customer on Invoice.Customer_ID = Customer.CustID inner join InvoiceLine on Invoice.InvoiceID = InvoiceLine.Receipt_ID inner join Product on InvoiceLine.Product_ID = Product.ProductId order by InvoiceID;'
   cursor.execute(query)
   row_headers = [x[0] for x in cursor.description]
   json_data = []
   theData = cursor.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)
