class Main inherits IO {

	a : String <- "attr a\n";
	b : Object <- "attr b\n";

	main() : Object {
		let
			x : String <- "cool\n",
			y : Object <- "test\n"
		in {
			-- Check idents and assignment
			out_string(x);
			-- out_string(y.type_name());
			out_string("\n");
			out_string(new String);
			x <- "testing 1, 2, 3...\n";
			y <- "stuff\n";
			out_string(x);

			-- Check that isvoid still works
			y <- "";
			if isvoid y then out_string("void\n") else out_string("not void\n") fi;
			x <- "";
			if isvoid x then out_string("void\n") else out_string("not void\n") fi;

			-- Check that assignment still returns value of exp
			x <- (y <- "test here\n");
			out_string(x);

			-- Check comparison
			if "abc" < "def" then out_string("a < b\n") else out_string("a !< b\n") fi;
			if b < y then out_string("b < y\n") else out_string("b !< y\n") fi;

			if "abc" <= "def" then out_string("a <= b\n") else out_string("a !<= b\n") fi;
			if b <= y then out_string("b <= y\n") else out_string("b !<= y\n") fi;

			if "abc" = "def" then out_string("a = b\n") else out_string("a != b\n") fi;
			if b = y then out_string("b = y\n") else out_string("b != y\n") fi;

			-- Check attrs
			out_string(a);
			b.type_name();
			b <- "555";
			b.type_name();

			-- Check dispatch
			"str".type_name();
			(new String).type_name();
			"7"@String.type_name();
			"7"@Object.type_name();
		}
	};
};