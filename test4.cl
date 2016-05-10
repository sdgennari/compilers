(* Constant Folding Test Case *)
class Main inherits IO {
	main() : Object {
		let
			x : Int,
			y : Int
		in {
			-- Base constant folding
			x <- 0 +  1 +  2 +  3 +  4 +  5 +  6 +  7 +  8 +  9 +
				10 + 11 + 12 + 13 + 14 + 15 + 16 + 17 + 18 + 19 +
				20 + 21 + 22 + 23 + 24 + 25 + 26 + 27 + 28 + 29 +
				30 + 31 + 32 + 33 + 34 + 35 + 36 + 37 + 38 + 39;
			y <- 0 -  1 -  2 -  3 -  4 -  5 -  6 -  7 -  8 -  9 -
				10 - 11 - 12 - 13 - 14 - 15 - 16 - 17 - 18 - 19 -
				20 - 21 - 22 - 23 - 24 - 25 - 26 - 27 - 28 - 29 -
				30 - 31 - 32 - 33 - 34 - 35 - 36 - 37 - 38 - 39;
			out_int(x);
			out_string("\n");
			out_int(y);
			out_string("\n");

			-- Branches
			if in_int() < 10 then {
				x <- 5;
				y <- 777;
			} else {
				x <- 5;
				y <- 9001;
			}
			fi;
			out_int(x);
			out_string("\n");
			out_int(y);
			out_string("\n");

			-- Overflow
			x <- 2147483647 + 9001;
			out_int(x);
			out_string("\n");
			y <- 9001 * 777777;
			out_int(y);
			out_string("\n");
		}
	};
};