class Main inherits IO {
	main() : Object {
		{
			case (new Bool) of
				x : Bool => out_string("Bool\n");
				x : Int => out_int(x + 9001);
			esac;
			out_string("\n");

			case true of
				o : Object => o.type_name();
				x : Bool => if x then out_string("true\n") else out_string("false\n") fi;
			esac;
			out_string("\n");

			case false of
				o : Object => o.type_name();
				x : Bool => out_string("Bool\n");
			esac;
			out_string("\n");
		}
	};
};