# Principles of Compilers
> The assignments of COMP0076 "Principles of Compilers" by Professor Wang Gang.
1. Assignment 1
  
   Learn about your compiler--gcc/g++
   
2. Assignment 2

   x86 asm 

   - Fibonacci
   - Factorial
   
   Compiler Design by CFG
   
3. Assignment 3

   Be familiar with Parser Generator2 —— using yacc

   1. Use yacc to lexing & Calculate value of expr
   2. Enhance 1. to ignore blank character ——"\n\t\\f\\v" 
   3. Accomplish infix→postfix

4. Assignment 4

   Lexical Analysis —— using lex

5. Assignment 5

   Parser Analysis —— Build a parser tree

6. Assignment 6

   Type check —— Based on Assignment 5

7. Assignment 7 —— Project

   Simple & Irregular & Naive Compiler\_(:з」∠)_

   - [x] Basic Features
     - [x] Support output a const value && `cout<<endl;` (You don't need this statement under normal circumstance for every output has 'endl' automatically)
   - [ ] Additonal Features
     - [ ] Function
       - [x] Defination
       - [x] Call
       - [x] Arguments
       - [x] Return value(Besides, you can not assign a var with a function)
       - [ ] Type Check(ID check ,type check, return check,otherst are same as block)
     - [ ] Array & Pointer
       - [x] Array asm
    - [x] Array typechek(Simple & Maybe missing sth. important)
     - [ ] Struct 
   
   >  Data type：int , char
   >
   > Declaration：Can not assign an initial value, Can not declare a variable during (means you must declare them first)
   >
   > Operation：+, -, *, /, %, ++, --, =, !, &&, ||, &, |, ^, ~, <<, >>, ==, !=, >=, >, <=, <(Casting is not support)  
   >
   > Statement：If, While, For
   >
   > I/O：eg: `cin>>a; cout<<a;` (Autocomplete '\n')