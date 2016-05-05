class Main inherits IO {
	main() : Object {
		{
			-- case new String
			case (new String) of
				x : String => out_string(x);
				x : Int => 0;
			esac;
			out_string("\n");

			-- case raw value
			case "777" of
				o : Object => o.type_name();
				x : String => out_string(x);
			esac;
			out_string("\n");

			-- case boxed value
			case "9001" of
				o : Object => o.type_name();
				x : String => out_string(x.type_name());
			esac;
			out_string("\n");
		}
	};
};