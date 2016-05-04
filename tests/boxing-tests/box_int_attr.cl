class Main inherits IO {
	x : Int <- 777;
	y : Object <- 9001;

	main() : Object {
		{
			out_int(x);
			out_string("\n");
			out_string(y.type_name());
			out_string("\n");
		}
	};
};