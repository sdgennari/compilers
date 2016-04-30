#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *cool_io_in_str() {
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
			// Read the rest of the input until the next newline or EOF
			while (c != '\n' && c != EOF) {
				c = getchar();
			}
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

	return strndup(str, len);
}

int main() {
	char *str;

	str = cool_io_in_str();
	// printf("len: %d\n", len);
	printf("strlen: %lu\n", strlen(str));
	printf("str: \"%s\"\n", str);

	str = cool_io_in_str();
	// printf("len: %d\n", len);
	printf("strlen: %lu\n", strlen(str));
	printf("str: \"%s\"\n", str);
	return 0;
}