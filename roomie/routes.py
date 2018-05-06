from flask import jsonify, request
from students import app
from students import Db as db
import json
from models import Student

@app.route('/students', methods=['POST'])
def parse_post_request():
	args = request.args
  	student = Student(args["name"],args["netid"],args["password"],args["cleanliness"],
  		args["sleeping_habits"],args["waking_up"],args["fun_fact"],args["noise_tolerance"],args["major"])
	db.insert(task.netid,task.name,task.password)
	return jsonify(task.to_dict())



@app.route('/students', methods=['GET'])
def parse_get_people():
	if "noise_tolerance" in request.args:
		return db.filter(request.args["noise_tolerance"],request.args["cleanliness"],
						request.args["sleeping_habits"],request.args["waking_up"])
	else:
		return db.get_all()

@app.route('/students', methods=['DELETE'])
def parse_delete_all_accounts():
	db.delete_task_table()
	return jsonify('{"success": "true"}')



