class Main inherits IO {
	main() : Object {
		let
			a : Int,
			b : Int,
			c : Int
		in {
			a <- 111;
			b <- 222;
			c <- 333;
			a <- b + c;
		}
	};
};