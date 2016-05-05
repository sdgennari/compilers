class Main inherits IO {

	a : Bool <- false;
	b : Object <- true;

	main() : Object {
		let
			x : Bool <- false,
			y : Object <- true
		in {
			-- Check idents and assignment
			if x then out_string("true\n") else out_string("false\n") fi;
			out_string("\n");
			out_string(y.type_name());
			out_string("\n");

			-- Check that isvoid still works
			y <- false;
			if isvoid y then out_string("void\n") else out_string("not void\n") fi;
			x <- false;
			if isvoid x then out_string("void\n") else out_string("not void\n") fi;

			-- Check that assignment still returns value of exp
			x <- (y <- true);
			if x then out_string("true\n") else out_string("false\n") fi;

			-- -- Check comparison
			if false < true then out_string("false < true\n") else out_string("false !< true\n") fi;
			if b < y then out_string("b < y\n") else out_string("b !< y\n") fi;

			if false <= true then out_string("false <= true\n") else out_string("false !<= true\n") fi;
			if b <= y then out_string("b <= y\n") else out_string("b !<= y\n") fi;

			if false = true then out_string("false = true\n") else out_string("false != true\n") fi;
			if b = y then out_string("b = y\n") else out_string("b != y\n") fi;

			-- Check attrs
			if a then out_string("true\n") else out_string("false\n") fi;
			b.type_name();
			b <- true;
			b.type_name();

			-- Check dispatch
			false.type_name();
			(new Bool).type_name();
			false@Bool.type_name();
			false@Object.type_name();
		}
	};
};