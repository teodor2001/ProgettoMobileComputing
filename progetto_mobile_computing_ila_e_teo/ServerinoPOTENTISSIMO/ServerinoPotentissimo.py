from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///utenti.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
CORS(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    email = db.Column(db.String(100), unique=True)
    password = db.Column(db.String(100))

# Crea il database
with app.app_context():
    db.create_all()

@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    name = data.get('name')
    email = data.get('email')
    password = data.get('password')

    if not name or not email or not password:
        return jsonify({'error': 'Inserire nome, email e password'}), 400

    new_user = User(name=name, email=email, password=password)
    db.session.add(new_user)
    db.session.commit()

    return jsonify({'message': 'Registrazione avvenuta con successo'}), 201

@app.route('/login', methods=['GET'])
def login():
    email = request.args.get('email')
    password = request.args.get('password')

    if not email or not password:
        return jsonify({'error': 'Inserire sia email che password'}), 404

    user = User.query.filter_by(email=email, password=password).first()
    if user:
        return jsonify({'email': user.email, 'password': user.password}), 200
    else:
        return jsonify({'error': 'Credenziali non valide'}), 404

if __name__ == '__main__':
    print("*" * 50)
    message = "Ciao sono un serverino POTENTISSIMO"
    print("*" + message.center(48) + "*")
    print("*" * 50)
    app.run(host='0.0.0.0', debug=True)
