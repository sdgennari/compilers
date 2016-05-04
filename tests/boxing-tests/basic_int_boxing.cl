class Main inherits IO {

	a : Int <- 123;
	b : Object <- 777;

	main() : Object {
		let
			x : Int <- 777,
			y : Object <- 9001
		in {
			-- Check idents and assignment
			out_int(x);
			out_string("\n");
			out_string(y.type_name());
			out_string("\n");
			x <- 1 + 2;
			y <- 3;
			out_int(x);

			-- Check that isvoid still works
			y <- 0;
			if isvoid y then out_string("void\n") else out_string("not void\n") fi;
			x <- 0;
			if isvoid x then out_string("void\n") else out_string("not void\n") fi;

			-- Check that assignment still returns value of exp
			x <- (y <- 0);
			out_int(x);

			-- Check comparison
			if 1 < 2 then out_string("1 < 2\n") else out_string("1 !< 2\n") fi;
			if b < y then out_string("b < y\n") else out_string("b !< y\n") fi;

			if 1 <= 2 then out_string("1 <= 2\n") else out_string("1 !<= 2\n") fi;
			if b <= y then out_string("b <= y\n") else out_string("b !<= y\n") fi;

			if 1 = 2 then out_string("1 = 2\n") else out_string("1 != 2\n") fi;
			if b = y then out_string("b = y\n") else out_string("b != y\n") fi;

			-- Check attrs
			out_int(a);
			b.type_name();
			b <- 555;
			b.type_name();

			-- Check dispatch
			7.type_name();
			(new Int).type_name();
			7@Object.type_name();
			7@Object.type_name();
		}
	};
};