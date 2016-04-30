class Main inherits IO {
	main() : Object {
		let
			s1 : String <- in_string(),
			s2 : String <- in_string()
		in {
			out_string(s1);
			out_string("\n");

			out_string(s1.type_name());
			out_string("\n");

			out_string(s2);
			out_string("\n");

			out_string(s1.concat(s2));
			out_string("\n");
		}
	};
};