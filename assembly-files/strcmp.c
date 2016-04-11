#include <stdio.h>
#include <string.h>

int main() {
	char *s1 = "ABC";
	char *s2 = "DEF";
	int result;

	result = strcmp(s1, s2);

	printf("%d\n", result);
	return 0;
};