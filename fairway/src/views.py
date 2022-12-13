from flask import Blueprint, jsonify
import json
from src import db

views = Blueprint('views', __name__)

# This is a base route
# we simply return a string.  
@views.route('/')
def home():
    return ('<h1>Welcome to Fairway, a way for fair trading</h1>')

# This is a sample route for the /test URI.  
# as above, it just returns a simple string. 
@views.route('/aboutus')
def tester():
    return "<h1>we are a online trading platform. Over there you can buy or sell product</h1>"
