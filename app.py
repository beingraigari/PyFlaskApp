from flask import Flask, render_template, request, flash


app = Flask(__name__)
app.secret_key = "beingraigari_0321"

@app.route("/")
def index():
	flash("Enter Your First Last Name")
	return render_template("index.html")


@app.route("/greet", methods=['POST', 'GET'])
def greeter():
	flash("Hello " + str(request.form['firstname_input']) + " " + str(request.form['secondname_input']))
	return render_template("index.html")
