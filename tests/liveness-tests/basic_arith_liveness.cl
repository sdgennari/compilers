class Main inherits IO {
	main() : Object {
		let
			x : Int,
			y : Int,
			z : Int
		in {
			x <- 1;
			x <- 2;
			x <- 3;
			y <- 7;
			z <- x + y;
			out_int(z);
		}
	};
};