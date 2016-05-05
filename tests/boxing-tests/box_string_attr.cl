class Main inherits IO {
	x : String <- "hello cool\n";
	y : Object <- "object string\n";

	main() : Object {
		{
			out_string(x);
			out_string(y.type_name());
			out_string("\n");
		}
	};
};