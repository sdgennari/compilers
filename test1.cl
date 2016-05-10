(* Decepticon Test Case
 * Trys to destroy all types of autobox
 * ───────────▄▄▄▄▄▄▄▄▄───────────
 * ────────▄█████████████▄────────
 * █████──█████████████████──█████
 * ▐████▌─▀███▄───────▄███▀─▐████▌
 * ─█████▄──▀███▄───▄███▀──▄█████─
 * ─▐██▀███▄──▀███▄███▀──▄███▀██▌─
 * ──███▄▀███▄──▀███▀──▄███▀▄███──
 * ──▐█▄▀█▄▀███─▄─▀─▄─███▀▄█▀▄█▌──
 * ───███▄▀█▄██─██▄██─██▄█▀▄███───
 * ────▀███▄▀██─█████─██▀▄███▀────
 * ───█▄─▀█████─█████─█████▀─▄█───
 * ───███────────███────────███───
 * ───███▄────▄█─███─█▄────▄███───
 * ───█████─▄███─███─███▄─█████───
 * ───█████─████─███─████─█████───
 * ───█████─████─███─████─█████───
 * ───█████─████─███─████─█████───
 * ───█████─████▄▄▄▄▄████─█████───
 * ────▀███─█████████████─███▀────
 * ──────▀█─███─▄▄▄▄▄─███─█▀──────
 * ─────────▀█▌▐█████▌▐█▀─────────
 * ────────────███████────────────
 *)

class Main inherits IO {
	attr_bool_b : Bool;
	attr_bool_obj : Object <- new Bool;
	attr_int_i : Int;
	attr_int_obj : Object <- 777;
	attr_string_s : String;
	attr_string_obj : Object <- "hello cool\n";

	main() : Object {
		let
			bool_x : Bool <- false,
			bool_y : Object <- true,
			string_x : String <- "cool\n",
			string_y : Object <- "test\n",
			int_x : Int <- 1,
			int_y : Object <- 2
		in {
			-- Check idents and assignment
			out_int(int_x);
			out_string("\n");
			out_string(string_x);

			-- Check isvoid
			bool_x <- false;
			bool_y <- false;
			string_x <- "";
			string_y <- "";
			int_x <- 0;
			int_y <- 0;
			if isvoid bool_x then out_string("void\n") else out_string("not void\n") fi;
			if isvoid bool_y then out_string("void\n") else out_string("not void\n") fi;
			if isvoid string_x then out_string("void\n") else out_string("not void\n") fi;
			if isvoid string_y then out_string("void\n") else out_string("not void\n") fi;
			if isvoid int_x then out_string("void\n") else out_string("not void\n") fi;
			if isvoid int_y then out_string("void\n") else out_string("not void\n") fi;

			-- Check comparison
			if false < true then out_string("false < true\n") else out_string("false !< true\n") fi;
			if "abc" < "def" then out_string("a < b\n") else out_string("a !< b\n") fi;	
			if 1 < 2 then out_string("1 < 2\n") else out_string("1 !< 2\n") fi;

			if true <= bool_x then out_string("true <= x\n") else out_string("true !<= x\n") fi;
			if 0 <= int_x then out_string("0 <= x\n") else out_string("0 !<= x\n") fi;
			if "abc" < string_x then out_string("abc <= x") else out_string("abc !<= x") fi;

			-- Check attrs
			out_string(attr_bool_b.type_name()).out_string("\n");
			out_string(attr_bool_obj.type_name()).out_string("\n");
			out_string(attr_int_i.type_name()).out_string("\n");
			out_string(attr_int_obj.type_name()).out_string("\n");
			out_string(attr_string_s.type_name()).out_string("\n");
			out_string(attr_string_obj.type_name()).out_string("\n");

			-- Check dispatch params and return types
			-- Bools
			-- test boxing of ro
			out_string(false.type_name()).out_string("\n");

			-- test autoboxing of params
			self.bool_method(false, true);

			-- test return type boxing
			if self.bool_method(false, true) then out_string("true\n") else out_string("false\n") fi;
			out_string("\n");
			out_string(self.bool_obj_method().type_name());
			out_string("\n");

			-- Ints
			-- test boxing of ro
			out_string(7.type_name()).out_string("\n");

			-- test autoboxing of params
			self.int_method(777, 9001);

			-- test return type boxing
			out_int(self.int_method(1, 2) + 777);
			out_string("\n");
			out_string(self.int_obj_method().type_name());
			out_string("\n");

			-- Strings
			-- test boxing of ro
			out_string("7".type_name()).out_string("\n");

			-- test autoboxing of params
			self.string_method("777", "9001");

			-- test return type boxing
			out_string(self.string_method("1", "2"));
			out_string("\n");
			out_string(self.string_obj_method().type_name());
			out_string("\n");

		}
	};

	string_method(x : String, y : Object) : String {
		{
			y.type_name();
			x;
		}
	};

	string_obj_method() : Object {
		"test string\n"
	};

	int_method(x : Int, y : Object) : Int {
		{
			y.type_name();
			x + 7;
		}
	};

	int_obj_method() : Object {
		9001
	};

	bool_method(x : Bool, y : Object) : Bool {
		{
			y.type_name();
			x;
		}
	};

	bool_obj_method() : Object {
		true
	};
};