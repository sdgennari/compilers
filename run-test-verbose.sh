#!/bin/bash

type_file_ext=".cl-type"
asm_file_ext=".s"
ref_file_ext="_ref"

echo "Running..."
for input_file in "$@"
do
	echo $input_file
	filename_length=${#input_file}
	file_base=${input_file:0:(filename_length-3)}
	asm_file=$file_base$asm_file_ext
	type_file=$file_base$type_file_ext
	ref_file=$file_base$ref_file_ext

	# Make .cl-type file
	cool --type $input_file

	# Generate assembly file
	python main.py $type_file

	# gcc the assembly file
	gcc -g $asm_file

	echo "Cool:"
	cool $input_file

	echo
	echo
	echo "Assembly:"
	./a.out

	echo
	echo 

done
echo "Complete"