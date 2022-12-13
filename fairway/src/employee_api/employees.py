from flask import Blueprint

# Create a new blueprint for employee
employees = Blueprint('employees_blueprint', __name__)

# add a route to this blueprint
@employees.route('/employees')
def get_all_employees():
    return f'<h1>Getting all the employees.</h1>'
