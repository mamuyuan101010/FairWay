# import the create app function 
# that lives in src/__init__.py
# import the Flask framework
from flask import Flask, jsonify
from flaskext.mysql import MySQL
from src.customer_api.customers import customers_blueprint
from src.employee_api.employees import employees_blueprint
from src.manufacturer_api.manufacturers import manufacturers_blueprint

# create a flask object
app = Flask(__name__)

# add db config variables to the app object
app.config['MYSQL_DATABASE_HOST'] = 'db'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_USER'] = 'CEO'
app.config['MYSQL_DATABASE_PASSWORD'] = 'abc123'
app.config['MYSQL_DATABASE_DB'] = ' FairWay'

# create the MySQL object and connect it to the 
# Flask app object
db_connection = MySQL()
db_connection.init_app(app)

# register
app.register_blueprint(customers_blueprint, url_prefix='/cust')
app.register_blueprint(employees_blueprint, url_prefix='/emp')
app.register_blueprint(manufacturers_blueprint, url_prefix='/mft')

@app.route("/")
def main_webpage():
    return f'<h1>Welcome to Fairway, a way for fair trading</h1>'

@app.route('/shopping')
def db_testing():
   cur = db_connection.get_db().cursor()
   cur.execute('select * from Product')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

if __name__ == '__main__':
    # we want to run in debug mode (for hot reloading) 
    # this app will be bound to port 4000. 
    # Take a look at the docker-compose.yml to see 
    # what port this might be mapped to... 
    app.run(debug = True, host = '0.0.0.0', port = 4000)