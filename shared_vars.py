# File containing global shared variables

# Map: (type_name, method_name) -> vtable index
vtable_offset_map = {}

# Map: (type_name, attr_ident) -> object layout index
attr_offset_map = {}

# Map: type_name -> type_tag int
type_tag_map = {}

# Define register to hold self ptr
SELF_REG = "%rbx"

# Note: explicitly exclude rax
caller_saved_registers = [
	"%rcx", "%rdx", "%rsi",
	"%rdi",	"%r8",	"%r9",
	"%r10",	"%r11",
]

# Note: explicitly exlcude ebx, ebp, esp
callee_saved_registers = [
	"%r12", "%r13", "%r14",
	"%r15", "%rbx"
]
