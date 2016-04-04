#include <stdlib.h>

int main() {
	// Simulate a boxed int
	int obj_size, vtable, type_tag, val;
	int *mem_ptr;

	// Set size of obj
	obj_size = 4;

	// Add placeholder values for remaining fields
	vtable = 0x7777;
	type_tag = 1;
	val = 777;

	// Allocate obj_size spaces, each of size 8
	mem_ptr = (int*) calloc(obj_size, 8);

	mem_ptr[0] = type_tag;
	mem_ptr[1] = obj_size;
	mem_ptr[2] = vtable;
	mem_ptr[3] = val;

	return 0;
}