import sqlite3
from flask import Flask, request, session, g, redirect, url_for, abort, render_template, flash, jsonify
from contextlib import closing
import urllib2
from emotion_api import *
import json
import time

#configuration
DATABASE = '/tmp/sparky.db'
SECRET_KEY='development key'
DEBUG = True

_PATIENT_URL = "https://navhealth.herokuapp.com/api/fhir/Patient/{}/$everything"


# create app
app = Flask(__name__)
app.config.from_object(__name__)

def connect_db():
	return sqlite3.connect(app.config['DATABASE'])

# db functions

@app.before_request
def before_request():
	g.db = connect_db()

@app.teardown_request
def teardown_request(exception):
	db = getattr(g, 'db', None)
	if db is not None:
		db.close()

def init_db():
	with closing(connect_db()) as db:
		with app.open_resource('schema.sql', mode='r') as f:
			db.cursor().executescript(f.read())
		db.commit()

# apis

@app.route('/')
def show_entries():
	flash('test')
	return "hello world"
#	cur = g.db.execute('select title, text from entries order by id desc')
#	entries = [dict(title = row[0], text = row[1]) for row in cur.fetchall()]
#	return render_template('show_entries.html', entries=entries)

@app.route('/getstaff', methods=['POST','GET'])
def get_staff():
	cur = g.db.execute('SELECT s.firstname, s.lastname, s.title, s.speciality FROM patient \
	              INNER JOIN patientward as pw on pw.patientid = patient.id \
	              INNER JOIN wardstaff as ws ON ws.wardid = pw.wardid \
	              INNER JOIN staff as s ON s.id = ws.staffid \
	              WHERE patient.id = ?;',
	              [request.args.get('patientid')])
	return jsonify(json_list = cur.fetchall())


@app.route('/getpatientdata', methods=['POST','GET'])
def get_patient_data():
	url = _PATIENT_URL.format(request.args.get('fhirid'))
	return urllib2.urlopen(url).read()

@app.route('/emotion', methods=['POST','GET'])
def image_emotion():
	patientid = request.args.get("patientid")
	if patientid is None:
		return jsonify(status="Failed", error=-1, message="No patient id")
	resp = analyze_image_emotion(None)
	if resp:
		obj = json.loads(resp)[0]['scores']
		sadness = obj['sadness']
		fear = obj['fear']
		happiness = obj['happiness']
		anger = obj['anger']
		surprise = obj['surprise']
		timestamp = int(time.time())
		g.db.execute('INSERT into emotions (patientid, surprise, anger, fear, happiness, sadness, timestamp) \
						VALUES ({},{},{},{},{},{},{})'.format(patientid, surprise, anger, fear, happiness, sadness, timestamp))
		g.db.commit()
		return jsonify(status="Success", error=None)
	else:
		return jsonify(status="Failed", error=-1)

@app.route('getemotion', method=['POST', 'GET'])
def get_emotion_values():
	pass

@app.route('/login', methods=['POST', 'GET'])
def login():
	# implement oauth here maybe
	error = None
	username = request.args.get('username')
	cur = g.db.execute('SELECT id, fhirid FROM patient \
						WHERE username = ? LIMIT 1;', [username]).fetchall()

	if len(cur) == 0:
		error = -1
		return jsonify(status="Failed", message="Authentication Failure", error=error)
	else:
		userid = cur[0][0]
		fhirid = cur[0][1]
		session['logged_in'] = True
    	
	return jsonify(status="Success", message="Authentication Successful", error=error, fhirid=fhirid, id=userid)

@app.route('/logout')
def logout():
	pass

if __name__ == '__main__':
	init_db()
	app.run(debug=True)
