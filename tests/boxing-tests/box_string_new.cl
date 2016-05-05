class Main inherits IO {
	main() : Object {
		let
			x : String,
			y : String
		in {
			-- check new String
			out_string(new String);
			out_string("\n");
			out_string((new String).type_name());
			out_string("\n");
			
			-- check default String
			out_string(x);
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

			if isvoid (new String) then
				out_string("void (new Int)\n")
			else
				out_string("not void (new Int)\n")
			fi;
		}
	};
};