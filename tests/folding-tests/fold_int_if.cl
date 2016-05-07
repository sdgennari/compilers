class Main inherits IO {
	main() : Object {
		let
			x : Int <- 1,
			y : Int <- 2,
			z : Int
		in {
			if true then {
				x <- y + z;
			} else {
				y <- 5;
				x <- y - z;
				z <- 6;
			} fi;

			x <- y + z;

			out_int(x);
			out_string("\n");
			out_int(y);
			out_string("\n");
			out_int(z);
			out_string("\n");
		}
	};
};