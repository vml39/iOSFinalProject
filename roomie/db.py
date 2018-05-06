import os
import json
import sqlite3
from models import Students

# From: https://goo.gl/YzypOI
def singleton(cls):
  instances = {}
  def getinstance():
    if cls not in instances:
      instances[cls] = cls()
    return instances[cls]
  return getinstance

class DB(object):
  """
  DB driver for the Roomie app - deals with writing entities
  to the DB and reading entities from the DB
  """

  def __init__(self):
    self.conn = sqlite3.connect("students.db", check_same_thread=False)
    self.create_student_table()

  def create_student_table(self):
    # create student table
    try:
      self.conn.execute("""
        CREATE TABLE students
        (NETID TEXT PRIMARY KEY NOT NULL,
        NAME TEXT NOT NULL,
        PASSWORD TEXT NOT NULL,
        CLEANLINESS TEXT NOT NULL,
        SLEEPING_HABITS TEXT NOT NULL,
        WAKING_UP TEXT NOT NULL,
        FUN_FACT TEXT NOT NULL,
        NOISE_TOLERANCE TEXT NOT NULL,
        MAJOR TEXT NOT NULL);
      """)
    except Exception as e: print e

  def delete_task_table(self):
    # delete student table
    try:
      self.conn.execute("""
        DELETE FROM students;
        """)
    except Exception as e: print e 



  def insert(self,netid,name,password,cleanliness,sleeping_habits,waking_up,fun_fact,noise_tolerance,major):
    # insert a new student into table 
    data = [netid,name,password,cleanliness,sleeping_habits,waking_up,fun_fact,noise_tolerance,major]
    query = """
      INSERT INTO students(NETID,NAME,PASSWORD,CLEANLINESS,SLEEPING_HABITS,WAKING_UP,FUN_FACT,NOISE_TOLERANCE,MAJOR)
      VALUES (?,?,?,?,?,?);
    """
    self.conn.execute(query,data)
    self.conn.commit()

  def get_all(self):
    """ gets all students from database"""
    cursor = self.conn.execute("""
      SELECT * FROM students;
    """)
    result = []
    for row in cursor:
      student = {}
      student["netid"] = row[0]
      student["name"] = row[1]
      student["password"] = row[2]
      student["cleanliness"] = row[3]
      student["sleeping_habits"] = row[4]
      student["waking_up"] = row[5]
      student["fun_fact"] = row[6]
      student["noise_tolerance"] = row[7]
      student["major"] = row[8]
      string = json.dumps(student)

      result.append(json.loads(string))

    return json.dumps(result)


  def filter(self,noise_tolerance,cleanliness,sleeping_habits,waking_up):
    query = self.conn.execute("""
      SELECT * FROM students
      WHERE NOISE_TOLERANCE = (?)
      AND CLEANLINESS = (?)
      AND SLEEPING_HABITS = (?)
      AND WAKING_UP = (?)
      ;
    """)
    cursor = self.conn.execute(query,[noise_tolerance,cleanliness,sleeping_habits,waking_up])
    result = []
    for row in cursor:
      student = {}
      student["netid"] = row[0]
      student["name"] = row[1]
      student["password"] = row[2]
      student["cleanliness"] = row[3]
      student["sleeping_habits"] = row[4]
      student["waking_up"] = row[5]
      student["fun_fact"] = row[6]
      student["noise_tolerance"] = row[7]
      student["major"] = row[8]
      string = json.dumps(student)

      result.append(json.loads(string))

    return json.dumps(result)








# Only <=1 instance of the DB driver
# exists within the app at all times
DB = singleton(DB)
