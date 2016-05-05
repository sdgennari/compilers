class Main inherits IO {
	x : Bool <- true;
	y : Object <- false;

	main() : Object {
		{
			if x then out_string("true\n") else out_string("false\n") fi;
			out_string(y.type_name());
			out_string("\n");
		}
	};
};