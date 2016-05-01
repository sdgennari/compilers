class Main inherits IO {
	main() : Object {
		let
			x : Object,
			y : Object
		in {
			x <- new Object;
			y <- x.copy();
			if x = y then
				out_string("true\n")
			else
				out_string("false\n")
			fi;
		}
	};
};