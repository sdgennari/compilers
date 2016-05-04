class Main inherits IO {
	main() : Object {
		let
			x : Int <- in_int(),
			y : Object <- in_int(),
			s : String <- "hello cool\n"
		in {
			out_int(x);
			out_string("\n");
			out_string(s.substr(0, 5));
			out_string("\n");
			out_int(s.length());
			out_string("\n");
			out_int(777.copy());
			out_string("\n");
		}
	};
};