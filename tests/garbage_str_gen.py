result = ""

# for i in range(0, 256):
# 	if chr(i) != '\0' and chr(i) != '\n':
# 		result += chr(i)

# result = "hello " + "\\0" + " cool\\n\\nhere"

# print result

# two null strings
print "hello " + '\0' + "cool\\n\n"
print "another string " + '\0' + "\n"