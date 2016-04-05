// http://www.cplusplus.com/reference/cstring/memcpy/
#include <stdio.h>
#include <string.h>

struct {
	char name[40];
	int age;
} person, person_copy;

int main() {
	char *name = "Name here";
	memcpy(person.name, name, strlen(name)+1);
	person.age = 77;

	// Size in memcopy is total size in BYTEs
	// In Cool, this will be 8 * (num_attrs + 3)
	memcpy(&person_copy, &person, sizeof(person));
	person.age = 88;

	printf("%ld\n", sizeof(person));
	printf("%s %d\n", person.name, person.age);
	printf("%s %d\n", person_copy.name, person_copy.age);
	return 0;
}