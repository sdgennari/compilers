#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char *coolstrconcat(char *s1, char *s2);

int main() {

	int len1, len2;
	char* s1 = "hel";
	char* s2 = "lo c";
	char* s3 = coolstrconcat(s1, s2);

	// s3 = strdup(s1);
	// strcat(s3, s2);

	// printf("len1: %d\n", len1);
	// printf("len2: %d\n", len2);
	// printf("len3: %d\n", (int) strlen(s3));

	// printf("s1: %s\n", s1);
	// printf("s2: %s\n", s2);
	// printf("s3: %s\n", s3);

	// printf("%s%s", s1, s2);
	// printf("%s", s3);

	return 0;
};

char* coolstrconcat(char *s1, char *s2) {
	char* s3;
	int len1, len2;

	// Get lengths of input strings
	len1 = strlen(s1);
	len2 = strlen(s2);

	// Include +1 to account for null char at end
	s3 = malloc((len1 + len2 + 1) * sizeof(char));
	strcpy(s3, s1);
	strcat(s3, s2);

	// Return pointer to new string
	return s3;
}