class A (object):
	def __init__(self, b_item):
		self.b_list = []
		self.b_item = b_item

	def __str__(self):
		result = ""
		for item in self.b_list:
			result += str(item) + ", "
		return result + "\n" + str(self.b_item)

class B (object):
	def __init__(self, val):
		self.val = val

	def __str__(self):
		return str(self.val)

def change_val(item):
	item.val = 7

if __name__ == "__main__":
	# b1 = B(1)
	# b2 = B(2)
	# a = A(b1)
	# print a
	# change_val(b1)
	# print a

	# a.b_list.append(b1)
	# a.b_list.append(b2)

	# a.b_list[1].val = 3
	# print a
	# print b2

	# b1.val = 9001
	# b2.val = 1337
	# print a

	b1_list = [B(1), B(2), B(3)]
	b2_list = [B(4), B(5), B(6)]

	tuple_list = zip(b1_list, b2_list)

	for tup in tuple_list:
		print "(", tup[0], ",", tup[1],")"

	change_val(b1_list[0])
	b1_list[1].val = "X"

	for tup in tuple_list:
		print "(", tup[0], ",", tup[1],")"
