class Main inherits IO {
	main() : Object {
		let
			x : Bool,
			y : Bool
		in {
			-- check new Bool
			if new Bool then out_string("true\n") else out_string("false\n") fi;
			out_string("\n");
			
			-- check default Bool
			if x then out_string("true\n") else out_string("false\n") fi;
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

			if isvoid (new Bool) then
				out_string("void (new Int)\n")
			else
				out_string("not void (new Int)\n")
			fi;
		}
	};
};