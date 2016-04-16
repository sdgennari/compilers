#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
	// long int i;

	// fgets(str_input, 100, stdin);

	// i = atol(str_input);
	// // scanf("%ld", &i);

	// // Clamp value between -2^31 and 2^31-1
	// if (i > 2147483647) {
	// 	i = 0;
	// } else if (i < -2147483648) {
	// 	i = 0;
	// }

	// printf("%ld\n", i);

	long int i;
	char *str, c;

	// Keep track of size of allocated memory
	int size = 32;

	// Track current length of string
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

			// Realloc the string to the bigger size
			str = realloc(str, size * sizeof(char));
		}

		// printf("Adding %c to str\n", c);
	}

	// Convert the string to and int
	i = atol(str);

	// Clamp value between -2^31 and 2^31-1
	if (i > 2147483647) {
		i = 0;
	} else if (i < -2147483648) {
		i = 0;
	}

	printf("%ld\n", i);

	return 0;
}