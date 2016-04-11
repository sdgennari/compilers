#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
	char *str, c;

	// Keep track of size of allocated memory
	int size = 20;

	// Track current lenght of string
	int len = 0;

	// Allocate initial room for the string
	str = (char *) malloc(size * sizeof(char));

	while ( 1 ) {
		// Get char from input
		c = getchar();

		// Exit from loop if newline or EOF
		if (c == '\n' || c == EOF) {
			// printf("done with loop\n");
			break;
		}

		// Add char to string
		str[len] = c;
		len++;

		// If null char, set str to empty string and break
		if (c == '\0') {
			// printf("null char in string\n");
			len = 0;
			break;
		}

		// Realloc string if needed
		if (len == size) {
			// Increase size of string by 20
			size = size + 20;

			// printf("reallocating str to size %d\n", size);

			// Realloc the string to the bigger size
			str = realloc(str, size * sizeof(char));
		}

		// printf("Adding %c to str\n", c);
	}

	str = strndup(str, len);

	// printf("len: %d\n", len);
	// printf("strlen: %lu\n", strlen(str));
	// printf("str: \"%s\"\n", str);
	return 0;
}