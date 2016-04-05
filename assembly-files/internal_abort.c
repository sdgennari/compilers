#include <stdlib.h>
#include <stdio.h>

void abort() {
	printf("abort\n");
	exit(0);
}

int main() {
	abort();
	printf("Reached here\n");
	return 0;
}