class Main inherits IO {

	z : Object;

	main() : Object {
		let
			x : Int,
			y : Object
		in {
			x <- 1 + 2;
			y <- 0;
			z <- 777;

			-- Check that assignment still returns value of exp
			-- x <- (y <- 0);
			-- out_int(x);

			-- self;
			-- Check to make sure isvoid works properly
			-- if isvoid y then
			-- 	out_string("y is void\n")
			-- else
			-- 	out_string("y in NOT void\n")
			-- fi;
		}
	};
};