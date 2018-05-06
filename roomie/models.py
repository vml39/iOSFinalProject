from abc import ABCMeta


class Model(object):
  """
  Abstract base class for all models -
  all models should extend this class
  """
  __metaclass__ = ABCMeta

  def __init__(self):
    """
    Initializes the model with a Universal Unique
    Identifier as an id
    """
    pass

  def to_dict(self):
    """
    Dictionary representation of this Model
    """
    return vars(self)



class Students(Model):
	"""
		Class to represent a student
	"""
	def __init__(self,name,netid,password):
		super(Students, self).__init__()
		self.name = name
		self.id = netid
		self.password = password
		self.noise_tolerance = 5
		self.cleanliness = 5
		self.sleeping_habits = ""
		self.waking_up = ""
		self.fun_fact = ""
