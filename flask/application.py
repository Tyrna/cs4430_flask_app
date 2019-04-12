from flask import Flask, jsonify, request
from flask_cors import CORS
from flask_restful import Resource, Api
from flaskext.mysql import MySQL

app = Flask(__name__)
api = Api(app)

#Enable CORS
cors = CORS(app, resources={r"/api/*": {"origins": "*"}})

#Initialize MySQL
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'cs4430'
app.config['MYSQL_DATABASE_PASSWORD'] = 'cs4430'
app.config['MYSQL_DATABASE_DB'] = 'transportation'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
conn = mysql.connect()


def get_route(city1, city2):
    vehicles = {}
    cursor = conn.cursor()

    sql = "SELECT routeID, distance FROM routes WHERE cityFrom = %s AND cityTo = %s"
    val = (city1, city2)
    cursor.execute(sql, val)

    result = cursor.fetchall()
    routeid = result[0][0]
    vehicles["distance"] = result[0][1]


    sql = "SELECT type, speed, price FROM vehicles WHERE vehicleID IN (SELECT vehicleID FROM connection WHERE routeID = %s)"
    val = (routeid, )
    cursor.execute(sql, val)

    result = cursor.fetchall()

    for vehicle in result:
        vehicles[vehicle[0]] = { "price" : vehicle[2], "speed" : vehicle[1] }


    return vehicles;


def get_cities():
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM cities")
    data = cursor.fetchall()
    return data


class GetInfo(Resource):
    def get(self):
        return jsonify(get_cities())

    def post(self):
        json_data = request.get_json(force=True)
        city1 = json_data['city1']
        city2 = json_data['city2']

        return jsonify(get_route(city1, city2))


api.add_resource(GetInfo, '/api')

if __name__ == "__main__":
    app.run(debug=True)
