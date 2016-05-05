#!/bin/bash

type_file_ext=".cl-type"
asm_file_ext=".s"
num_passed=0
num_tests=0

echo "Running..."
for input_file in "$@"
do
	echo $input_file
	filename_length=${#input_file}
	file_base=${input_file:0:(filename_length-3)}
	asm_file=$file_base$asm_file_ext
	type_file=$file_base$type_file_ext

	# Make .cl-type file
	cool --type $input_file

	# Generate assembly file
	python main.py $type_file

	# gcc the assembly file
	gcc -g $asm_file

	# Generate the Cool output
	cool $input_file > "ref.test"

	# Generate the compiler output
	./a.out > "out.test"

	# Diff the output file and the reference file
	if ! diff -b -B -E -w "ref.test" "out.test"  ; then
		echo "FAILED: $input_file"
	else
		echo "PASSED: $input_file"
		rm "ref.test"
		rm "out.test"
		rm "$type_file"
		rm "$asm_file"
		num_passed=$((num_passed+1))
	fi

	# Update number of tests
	num_tests=$((num_tests+1))
	echo

done
echo "Complete"
echo "Passed $num_passed/$num_tests"
