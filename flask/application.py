from flask import Flask, jsonify, request
from flask_cors import CORS
from flask_restful import Resource, Api
from flaskext.mysql import MySQL

app = Flask(__name__)
api = Api(app)

#Enable CORS
cors = CORS(app, resources={r"/api/*": {"origins": "*"}})

#Initialize MySQL
#mysql = MySQL()
#app.config['MYSQL_DATABASE_USER'] = 'cs4430'
#app.config['MYSQL_DATABASE_PASSWORD'] = 'cs4430'
#app.config['MYSQL_DATABASE_DB'] = 'computer'
#app.config['MYSQL_DATABASE_HOST'] = 'localhost'
#mysql.init_app(app)
#conn = mysql.connect()


def get_route(city1, city2):
    if (city1 == "A" and city2 == "B"):
        return {
            "distance" : 1000,
            "car" : { "price" : 30, "speed" : 40},
            "bus" : { "price" : 60, "speed" : 50},
            "train" : { "price" : 70, "speed" : 140},
            "airplane" : {"price" : 210, "speed" : 520}
        }
    elif (city1 == "B" and city2 == "C"):
         return {
            "distance" : 2500,
            "car" : { "price" : 30, "speed" : 40},
            "bus" : { "price" : 60, "speed" : 50},
            "train" : { "price" : 70, "speed" : 140},
            "airplane" : {"price" : 210, "speed" : 520}
        }
    elif (city1 == "D" and city2 == "A"):
         return {
            "distance" : 200,
            "car" : { "price" : 30, "speed" : 40},
            "bus" : { "price" : 60, "speed" : 50},
            "train" : { "price" : 70, "speed" : 140}
        }

def get_cities():
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM product LIMIT 10")
    data = cursor.fetchall()
    print(data)
    return data


class GetInfo(Resource):
    def get(self):
        return { "cities" : ["A", "B", "C", "D", "E"] }
        #return get_cities()

    def post(self):
        json_data = request.get_json(force=True)
        city1 = json_data['city1']
        city2 = json_data['city2']

        return jsonify(get_route(city1, city2))


api.add_resource(GetInfo, '/api')

if __name__ == "__main__":
    app.run(debug=True)
