class Main inherits IO {
	main() : Object {
		{
			-- test boxing of ro
			out_string("7".type_name()).out_string("\n");

			-- test autoboxing of params
			self.string_method("777", "9001");

			-- test return type boxing
			out_string(self.string_method("1", "2"));
			out_string("\n");
			out_string(self.obj_method().type_name());
			out_string("\n");

			-- test static and self dispatch
			out_string(self@Main.string_method("1", "2"));
			out_string("\n");
			out_string(string_method("1", "2"));
			out_string("\n");
		}
	};

	string_method(x : String, y : Object) : String {
		{
			y.type_name();
			x;
		}
	};

	obj_method() : Object {
		"test string\n"
	};

};