from flask import Flask
application = app = Flask(__name__)

@app.route("/")
def test():
    return "Hello"

if __name__ == "__main__":
    app.run(debug=true)
