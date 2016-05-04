class Main inherits IO {
	main() : Object {
		{
			-- test boxing of ro
			out_string(7.type_name()).out_string("\n");

			-- test autoboxing of params
			self.int_method(777, 9001);

			-- test return type boxing
			out_int(self.int_method(1, 2) + 777);
			out_string("\n");
			out_string(self.obj_method().type_name());
			out_string("\n");

			-- test static and self dispatch
			out_int(self@Main.int_method(1, 2) + 777);
			out_string("\n");
			out_int(int_method(1, 2) + 777);
			out_string("\n");
		}
	};

	int_method(x : Int, y : Object) : Int {
		{
			y.type_name();
			x + 7;
		}
	};

	obj_method() : Object {
		9001
	};

};