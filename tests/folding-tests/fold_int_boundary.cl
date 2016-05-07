class Main inherits IO {
	main() : Object {
		let
			x : Int,
			y : Int
		in {
			x <- 100000;
			y <- 999999;
			out_int(x * y);
			out_int(2147483647 + 2);
			out_string("\n");
			out_int(~2147483647 - 10);
			out_string("\n");
		}
	};
};