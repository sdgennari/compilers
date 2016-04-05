#include <stdio.h>
#include <string.h>

int main() {

	char* s1 = "hello ";
	char* s2 = "c\n";
	char* s3;

	s3 = strdup(s1);
	strcat(s3, s2);


	printf("%s%s", s1, s2);
	printf("%s", s3);


	return 0;
};