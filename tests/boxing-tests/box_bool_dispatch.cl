class Main inherits IO {
	main() : Object {
		{
			-- test boxing of ro
			out_string(false.type_name()).out_string("\n");

			-- test autoboxing of params
			self.bool_method(false, true);

			-- test return type boxing
			if self.bool_method(false, true) then out_string("true\n") else out_string("false\n") fi;
			out_string("\n");
			out_string(self.obj_method().type_name());
			out_string("\n");

			-- test static and self dispatch
			if self@Main.bool_method(false, true) then out_string("true\n") else out_string("false\n") fi;
			out_string("\n");
			if bool_method(false, true) then out_string("true\n") else out_string("false\n") fi;
			out_string("\n");
		}
	};

	bool_method(x : Bool, y : Object) : Bool {
		{
			y.type_name();
			x;
		}
	};

	obj_method() : Object {
		true
	};

};