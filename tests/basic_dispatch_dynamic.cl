class Main {
	main() : Object {
		let
			a : A
		in {
			a <- new A;
			a.some_method(777, 7 + 9001);
		}

	};
};

class A {
	some_method(a : Int, b : Int) : Object {
		123
	};
};