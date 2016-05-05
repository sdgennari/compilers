class Main inherits IO {
	main() : Object {
		let
			x : String <- in_string(),
			y : Object <- in_string(),
			s : String <- "hello cool\n"
		in {
			out_string(x);
			out_string("\n");
			out_string(s.substr(0, 5));
			out_string("\n");
			out_string(x.concat(s));
			out_string("\n");
			out_string("777".copy());
			out_string("\n");
			out_string((new String).type_name());
			out_string("\n");
		}
	};
};