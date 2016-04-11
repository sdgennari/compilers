#include <stdio.h>

void raw_out_string(char *str) {
	// printf("checking: %s\n\n", str);

	int i = 0;
	char c, tmp;
	while (c = str[i]) {
		if (c == '\\') {
			tmp = str[i+1];
			if (tmp == 'n') {
				// Print newline
				c = '\n';
				i++;
			} else if (tmp == 't') {
				// Print tab
				c = '\t';
				i++;
			}
		}

		// Print the character in the string
		printf("%c", c);

		// Increment the position in the string
		i++;
	}

	// printf("\n");
	// printf("char: %c\n", c);
}

int main() {

	char *str = "hello\t\tc\\\\n";

	raw_out_string(str);

	return 0;
}