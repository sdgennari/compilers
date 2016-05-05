class Main inherits IO {
	main() : Object {
		let
			x : Object,
			y : Object
		in {
			x <- "123";
			y <- "456";

			if "777" < "9001" then out_string("lt\n") else out_string("not lt\n") fi;
			if "9001" < "777" then out_string("lt\n") else out_string("not lt\n") fi;
			if (new String) < "" then out_string("lt\n") else out_string("not lt\n") fi;
			if x < y then out_string("lt\n") else out_string("not lt\n") fi;

			if "777" <= "9001" then out_string("le\n") else out_string("not le\n") fi;
			if "9001" <= "777" then out_string("le\n") else out_string("not le\n") fi;
			if (new String) <= "" then out_string("le\n") else out_string("not le\n") fi;
			if x <= y then out_string("le\n") else out_string("not le\n") fi;

			if "777" = "9001" then out_string("eq\n") else out_string("not eq\n") fi;
			if "9001" = "777" then out_string("eq\n") else out_string("not eq\n") fi;
			if (new String) = "" then out_string("eq\n") else out_string("not eq\n") fi;
			if x = y then out_string("eq\n") else out_string("not eq\n") fi;
		}
	};
};