import os
from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

# Example 1: Command Injection
@app.route('/execute', methods=['POST'])
def execute_command():
    command = request.form.get('command')
    result = subprocess.check_output(command, shell=True)
    return jsonify({'result': result.decode('utf-8')})

# Example 2: SQL Injection
@app.route('/users', methods=['GET'])
def get_users():
    user_id = request.args.get('user_id')
    query = "SELECT * FROM users WHERE user_id = {}".format(user_id)
    # Execute the query to fetch user details (insecure, prone to SQL injection)
    # user_details = db.execute(query)
    return jsonify({'message': 'User details fetched successfully'})

# Example 3: Use of Weak Cryptographic Algorithm
def encrypt_password(password):
    # Insecure encryption method
    encrypted_password = password.encode('base64')
    return encrypted_password

# Example 4: Hardcoded Credentials
def connect_to_database():
    username = 'admin'
    password = 'admin@123'
    # Connect to the database using hardcoded credentials (insecure)
    # db.connect(username, password)
    return True

# Example 5: Insufficient Input Validation
def process_input(input_data):
    # Example of insufficient input validation (may lead to various vulnerabilities)
    if input_data.startswith('admin'):
        return "Admin access granted"
    else:
        return "Access denied"

# Example 6: Insecure Random Number Generation
import random
def generate_token():
    # Using insecure random number generator (e.g., predictable)
    token = random.randint(1, 1000)
    return token

# Example 7: Use of Deprecated or Unsafe Functions
def run_command(command):
    # Example of using deprecated or unsafe function (e.g., os.popen)
    output = os.popen(command).read()
    return output

if __name__ == '__main__':
    app.run(debug=True)
