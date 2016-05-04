class Main inherits IO {
	main() : Object {
		let
			x : Int,
			y : Int
		in {
			-- check new Int
			out_int((new Int) + 777);
			out_string("\n");
			out_int(new Int + new Int);
			out_string("\n");
			
			-- check default int
			out_int(x + y + 888);
			out_string("\n");

			-- check isvoid
			if isvoid x then
				out_string("void x\n")
			else
				out_string("not void x\n")
			fi;

			if isvoid y then
				out_string("void y\n")
			else
				out_string("not void y\n")
			fi;

			if isvoid (new Int) then
				out_string("void (new Int)\n")
			else
				out_string("not void (new Int)\n")
			fi;
		}
	};
};