class Main inherits IO {
	main() : Object {
		{
			if 1 < 2 then out_string("true\n") else out_string("false\n") fi;
			if 1 < 1 then out_string("true\n") else out_string("false\n") fi;

			if false < true then out_string("true\n") else out_string("false\n") fi;
			if true < true then out_string("true\n") else out_string("false\n") fi;

			if "1" < "2" then out_string("true\n") else out_string("false\n") fi;
			if "1" < "1" then out_string("true\n") else out_string("false\n") fi;

			if 1 <= 2 then out_string("true\n") else out_string("false\n") fi;
			if 1 <= 1 then out_string("true\n") else out_string("false\n") fi;

			if false <= true then out_string("true\n") else out_string("false\n") fi;
			if true <= true then out_string("true\n") else out_string("false\n") fi;

			if "1" <= "2" then out_string("true\n") else out_string("false\n") fi;
			if "1" <= "1" then out_string("true\n") else out_string("false\n") fi;

			if 1 = 2 then out_string("true\n") else out_string("false\n") fi;
			if 1 = 1 then out_string("true\n") else out_string("false\n") fi;

			if false = true then out_string("true\n") else out_string("false\n") fi;
			if true = true then out_string("true\n") else out_string("false\n") fi;

			if "1" = "2" then out_string("true\n") else out_string("false\n") fi;
			if "1" = "1" then out_string("true\n") else out_string("false\n") fi;
		}
	};
};