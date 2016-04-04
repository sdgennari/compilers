class Main inherits IO {
	some_attr : Int <- 777 + 888;

	main() : Object {
		{
			9001 + some_attr;
			some_attr <- 123;
		}
	};
};