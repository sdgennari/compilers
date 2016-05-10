A.J. Varshneya (ajv4dg)
Spencer Gennari (sdg6vt)
CA5 - Optimized Compiler
5/10/16
readme.txt

### Design Decisions

For CA5, we modified our Python files from CA4. At the end of CA4 our code was in great need of refactoring, so first task we tackled in CA5 was reorganizing the code. To clean up our TAC to ASM code, we abstracted most of the hard-coded internal functions into a new file: internals.py. Furthermore, most of the global variables were eliminated and instead replaced with parameters in functions. This helped our code organization a lot since global variables were no longer shared between Python files, which made debugging much easier. That said, shared_variables.py still exists, but it only holds reference variables that are created once and never modified again (if we could do it all again, we would have made an object that stored this information and then passed the aforementioned object between functions).

In terms of actual Python files included in the submission, each stage of the compilation process and independent optimization was included in its own file. However, since some optimizations were best implemented during a stage in the compilation process, such as autoboxing during AST to TAC conversion, not every optimization was abstracted away into its own file. The three specific optimization files included are: 1) basic_blocks.py, which handles dead code elimination (we're still bad at naming, even after all this time...), 2) allocate_registers.py, which handles graph coloring for efficient register allocation, and 3) constant_folding.py, which iterates over a given CFG to find constants that can be folded. It is important to note that, although constant_folding.py is not actually used in the final implementation of the compiler since we could not get it to be fully semantics preserving, we still included it for reference.

### Testing

Throughout the development of CA5, we focused a lot on making sure that our optimizations were semantics preserving. Whenever we added a new optimization, we would implement a small part of it (such as autoboxing for Ints only) using a subset of tests that related specifically to the optimization. Once it reached a large enough checkpoint, we would then run it against all of our test cases from CA4 and CA5 to make sure they still worked properly. test1.cl - test4.cl are examples of the more intricate test cases we used to make sure our optimizations were reducing the number of cycles while still handling all the edge cases.

test1.cl - autoboxing (aka The Decepticon Test Case)
This file does everything possible to destroy autoboxing for Ints, Strings, and Bools. For each type, it makes sure that assigning a value to an Object automatically boxes it so that dispatch will work properly. Additionally, it checks that isvoid still works on boxed and unboxed values. Finally, it makes sure that params and return types for methods are boxed.

test2.cl - register allocation
test2.cl focuses on good register allocation. It makes 16 variables to use all possible x86 registers (assuming linear register allocation) and then prints them at the very end to keep them alive throughout the entire program. After making the variables, it then does a large nested arithmetic expression that causes 400 virtual registers to be live at the same time. This helps check that the register allocation algorithm in the compiler is fast.

test3.cl - dead code elimination
This test is designed to reward good dead code elimination by performing a large number of dead operations in a loop and then allocating a series of dead objects. A compiler that optimizes away dead code would not have to spend time performing the unnecessary arithmetic or allocating memory on the heap for the new object, so it will have much better performance.

test4.cl - constant folding
Although our compiler (at the time of submission) does not properly implement constant folding, we still made test4.cl about constant folding since we spent a fair amount of time trying to implement it. It first checks the basics of constant folding, as well as branching with separate assignments. The real trick that we didn't catch for a long time was integer overflow when folding constants, so the last section of test4.cl makes sure that overflow is handled correctly.
