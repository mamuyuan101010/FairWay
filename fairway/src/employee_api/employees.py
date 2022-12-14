from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

# Create a new blueprint for employee
employees = Blueprint('employees', __name__)

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

@employees.route('/employees/orderdetail', methods=['GET'])
def get_order_detail():
   cursor = db.get_db().cursor()
   query = f'select InvoiceID, Purchase_Date, Invoice.Country, Invoice.State, Invoice.City, Customer_ID, First_Name, Last_Name, Product_ID, Name, Quantity, UnitPrice, (UnitPrice * InvoiceLine.Quantity) as total from Invoice inner join Customer on Invoice.Customer_ID = Customer.CustID inner join InvoiceLine on Invoice.InvoiceID = InvoiceLine.Receipt_ID inner join Product on InvoiceLine.Product_ID = Product.ProductId order by InvoiceID'
   cursor.execute(query)
   row_headers = [x[0] for x in cursor.description]
   json_data = []
   theData = cursor.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@employees.route('/employees/customers', methods=['GET'])
def get_customer_detail():
   cursor = db.get_db().cursor()
   query = f'select First_Name, Last_Name, CustID from Customer ORDER BY First_Name'
   cursor.execute(query)
   row_headers = [x[0] for x in cursor.description]
   json_data = []
   theData = cursor.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@employees.route('/employees_del', methods=['POST'])
def delete_order():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    orderID = request.form['odID']
    query = f'delete from Invoice where Invoice.InvoiceID = {orderID}'
    query2 = f'delete from InvoiceLine where InvoiceLine.Receipt_ID = {orderID}'
    cursor.execute(query)
    cursor.execute(query2)
    db.get_db().commit()
    return "Success!"

@employees.route('/employees/employeedetail', methods=['GET'])
def show_employee():
   cursor = db.get_db().cursor()
   query = f'select * from Employee'
   cursor.execute(query)
   row_headers = [x[0] for x in cursor.description]
   json_data = []
   theData = cursor.fetchall()
   for row in theData:
        json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@employees.route('/employees/updateemployee')
def update_employee():
    return "<h1>Delete a employee or add a new employee</h1>"

@employees.route('/employees/updateemployee/add', methods=['POST'])
def add_employee():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    firstName = request.form['fname']
    lastName = request.form['lname']
    dateEmployed = request.form['dateemp']
    email = request.form['email_add']
    supervisorID = request.form['supvsrID']
    query = f'INSERT INTO Employee(Date_Been_Employed, Email_Address, First_Name, Last_Name, Supervisor_id) VALUES(\"{dateEmployed}\", \"{email}\", \"{firstName}\", \"{lastName}\", \"{supervisorID}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success!"

@employees.route('/employees/updateemployee/delete', methods=['POST'])
def delete_employee():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    employeeID = request.form['emplyeID']
    query = f'delete from Employee where Employee.employee_id = {employeeID}'
    query2 = f'delete from Help_Request where Help_Request.Customer_Service_ID = {employeeID}'
    cursor.execute(query)
    cursor.execute(query2)
    db.get_db().commit()
    return "Success!"