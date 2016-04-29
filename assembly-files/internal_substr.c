#include <stdio.h>
#include <string.h>

char *cool_str_substr(char *str, int i, int l);

int main() {
	char *s1 = "hello c\n";
	char *result;
	int i;

	result = cool_str_substr(s1, 2, 3);
	printf("%s\n", result);

	return 0;
}

char *cool_str_substr(char *str, int i, int l) {
	// Bounds check i and l
	if (i < 0 || (i + l) > strlen(str)) {
		return "xyz";
	}

	return strndup(str+i, l);
}