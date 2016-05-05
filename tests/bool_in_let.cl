class Main inherits IO {
	main() : Object {
		let
			x : Bool <- false,
			y : Bool <- true
		in {
			if x then out_string("true\n") else out_string("false\n") fi;
			if y then out_string("true\n") else out_string("false\n") fi;
		}
	};
};