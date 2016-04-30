result = ""
# for i in range(0, 100):
# 	if chr(i) != '\0' and chr(i) != '\n':
# 		result += chr(i)
result = "hello " + "\\0" + " cool\\n\\nhere"
print result