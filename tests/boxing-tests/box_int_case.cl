class Main inherits IO {
	main() : Object {
		{
			case (new Int) of
				x : String => 0;
				x : Int => out_int(x + 9001);
			esac;
			out_string("\n");

			case 777 of
				o : Object => o.type_name();
				x : Int => out_int(x + 9001);
			esac;
			out_string("\n");

			case 9001 of
				o : Object => o.type_name();
				x : Int => out_string(x.type_name());
			esac;
			out_string("\n");
		}
	};
};