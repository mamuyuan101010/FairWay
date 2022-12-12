# import the create app function 
# that lives in src/__init__.py
# import the Flask framework
from flask import Flask, jsonify
from flask import request
from flaskext.mysql import MySQL
from src import create_app
from src.customer_api.customers import customers_blueprint
from src.employee_api.employees import employees_blueprint
from src.manufacturer_api.manufacturers import manufacturers_blueprint

# create the app object
app = create_app()

# add db config variables to the app object
app.config['MYSQL_DATABASE_HOST'] = 'db'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_USER'] = 'CEO'
app.config['MYSQL_DATABASE_PASSWORD'] = 'abc123'
app.config['MYSQL_DATABASE_DB'] = ' FairWay'

# register
app.register_blueprint(customers_blueprint, url_prefix='/cust')
app.register_blueprint(managers_blueprint, url_prefix='/mgr')

if __name__ == '__main__':
    # we want to run in debug mode (for hot reloading) 
    # this app will be bound to port 4000. 
    # Take a look at the docker-compose.yml to see 
    # what port this might be mapped to... 
    app.run(debug = True, host = '0.0.0.0', port = 4000)