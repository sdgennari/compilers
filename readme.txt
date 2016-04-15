A.J. Varshneya (ajv4dg)
Spencer Gennari (sdg6vt)
CA4 - Compiler
4/11/16
readme.txt

### Design Decisions

To convert the .cl-type file into x86 assembly, we used a series of Python files to handle each stage of the compilation process. In general, the Python files can be separated into two main categories: objects and functions, with a little bit of gray area in between. There were three pure object files: ast_nodes.py, tac_objects.py, and asm_objects, which contained objects for AST, TAC, and ASM, respectively. Since CA4 involved a much broader variety of expressions, we had to expand the TAC instructions from before so that they could appropriately keep track of type information and handle new features like case expressions.

The other Python files dealt with converting between intermediate forms. The AST to TAC conversion was fairly simple, so it could be handled in a single file: ast_to_tac.py. However, converting TAC to ASM proved far more difficult. The register allocation done in CA3 was abstracted into allocate_registers.py and the tac_to_asm.py file was greatly expanded. Furthermore, main.py handles laying out the actual assembly in the file to ensure that components are processed in the appropriate order (ie. all expressions are parsed before the constant strings are created since there is no way to know what the constant strings are ahead of time). Having so many files did present the challenge of sharing information between files. Unfortunately, the original Python files had a lot of global variables which caused a large amount of confusing throughout the coding process (a major refactor is coming...).

### Testing

Since CA4 was a very large assignment with many different components, it was crucial to test each new feature as it was added. Thus, we tested each feature by first verifying that the TAC was properly generated and then by verifying that the TAC to ASM conversion worked. This process helped us figure out problems early since TAC provided a high-level abstraction of the code that was going to be generated. Once we were sure that the general structure of the program was correct, we moved on to outputting the specific assembly instructions. After working through basic examples, we created harder test cases to highlight some of the more difficult bugs. Files test1.cl - test4.cl represent some of the bugs that gave us the most trouble.

test1.cl - shadowing
This file deals with the different possible scenarios for variable shadowing. Specifically, it checks that let, case, method, and attributes all shadow one another when they are supposed to. test1.cl also makes sure that the scope of variables is appropriately managed.

test2.cl - copy
test2.cl focuses on the details of the internal copy method. Specifically, it makes sure that shallow copying is appropriately handled and that copied objects do not modify each other (so long as their attributes are shallow). Additionally, this test checks that deep object pointers are kept consistent even if an object is copied.

test3.cl - SELF_TYPE
This test contains chained dispatch expressions to test whether self, static, and dynamic dispatch are working correctly with emphasis on the use of SELF_TYPE. We test that functions returning SELF_TYPE in chains evaluate to objects of the correct type and that we can statically call inherited methods. The test also checks method overriding and self dispatch in nested let statements.

test4.cl - case
Depending on the order in which the case branches are encountered, we can verify that the correct branch is chosen. There is an attribute, let, and case variable which tests scoping on the case. The test also exposes a failure when there is no branch that matches the type type of the given expression.