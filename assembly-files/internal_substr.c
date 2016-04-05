#include <stdio.h>
#include <string.h>

char *substr(char *str, int i, int l);

int main() {
	char *s1 = "hello c\n";
	int i;

	substr(s1, 2, 3);

	return 0;
}

char *substr(char *str, int i, int l) {
	char *p;
	p = strndup(str+i, l);
	printf("%s\n", p);
	return p;
}