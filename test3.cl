(* Dead Code Elimination *)
class Main inherits IO {
	main() : Object {
		let
			dead_x : Int,
			dead_y : Int,
			dead_beef : Int <- 2147483647 + 1588444912,
			dead_c0de : Int <- 2147483647 + 1588445405,
			i : Int,
			dead_obj : Object
		in {
			while i < 1000000 loop {
				dead_beef <- 1 + 2 + 3 + 4 + 5;
				dead_x <- 10 / 5 / 2;
				dead_y <- 1 * 2 * 3 * 4 * 5;
				i <- i + 1;
			} pool;

			dead_c0de <- 1 * 2 / 4 * 5 * 6 * 7 * 8 * 9;

			-- Allocate a bunch of dead objects
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;
			dead_obj <- new Object;

			out_int(i);
			out_string("\n");
			abort();
		}
	};
};