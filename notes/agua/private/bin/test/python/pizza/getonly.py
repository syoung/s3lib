class C(object):

	def __init__(self, x):
		self._x = x

	@property
	def x(self):
		return self._x

c = C(1)
print c.x
print c.x = 2 #SyntaxError: invalid syntax