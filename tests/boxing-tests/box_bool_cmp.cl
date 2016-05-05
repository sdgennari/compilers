class Main inherits IO {
	main() : Object {
		let
			x : Bool,
			y : Bool
		in {
			x <- false;
			y <- true;

			if false < true then out_string("lt\n") else out_string("not lt\n") fi;
			if true < false then out_string("lt\n") else out_string("not lt\n") fi;
			if (new Bool) < false then out_string("lt\n") else out_string("not lt\n") fi;
			if x < y then out_string("lt\n") else out_string("not lt\n") fi;

			if false <= true then out_string("le\n") else out_string("not le\n") fi;
			if true <= false then out_string("le\n") else out_string("not le\n") fi;
			if (new Bool) <= false then out_string("le\n") else out_string("not le\n") fi;
			if x <= y then out_string("le\n") else out_string("not le\n") fi;

			if false = true then out_string("eq\n") else out_string("not eq\n") fi;
			if true = false then out_string("eq\n") else out_string("not eq\n") fi;
			if (new Bool) = false then out_string("eq\n") else out_string("not eq\n") fi;
			if x = y then out_string("eq\n") else out_string("not eq\n") fi;
		}
	};
};