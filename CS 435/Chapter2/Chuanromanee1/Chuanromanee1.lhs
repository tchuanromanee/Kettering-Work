***************		Tya Chuanromanee		***************
***************			Demo Homework		***************
***************		Task1 to Task4			***************

###########################################################

  FirstLiterate.lhs

  Simon Thompson, June 1998

  The purpose of this script is
    - to illustrate some simple definitions
      over integers (Int);
    - to give a first example of a literate script.

###########################################################


The value size is an integer (Int), defined to be the sum of
twelve and thirteen.

> size :: Int
> size = 12+13

The function to square an integer.

> square :: Int -> Int
> square n = n*n

The function to double an integer.

> double :: Int -> Int
> double n = 2*n

An example using double, square and size.

> example :: Int
> example = double (size - square (2+2))

Task 1: Load the file FirstLiterate.lhs into Hugs, and evaluate the following expre\sion\
Main> square size
625
Main> square
ERROR - Cannot find "show" function for:
*** Expression : square
*** Of type    : Int -> Int

Main> double (square 2)
8
Main> $$
ERROR - Syntax error in expression (unexpected symbol "$$")
Main> square (double 2)
16
Main> 23 - double (3+1)
15
Main> 23 - double 3+1
18
Main> $$ + 34
ERROR - Syntax error in expression (unexpected symbol "$$")
Main> 13 `div` 5
2
Main> 13 `mod` 5
3

'$$' does not do anything.


Task 2: Use the Hugs command :type to tell you the type of each of these, apart from $$.
Main> :type square size
square size :: Int
Main> :type square
square :: Int -> Int
Main> :type double (square 2)
double (square 2) :: Int
Main> :type square (double 2)
square (double 2) :: Int
Main> :type 23 - double (3+1)
23 - double (3 + 1) :: Int
Main> :type 23 - double 3+1
23 - double 3 + 1 :: Int
Main> :type 13 `div` 5
13 `div` 5 :: Integral a => a
Main> :type 13 `mod` 5
13 `mod` 5 :: Integral a => a



Task 3: What is the effect of typing each of the following?
double square 2
double
Try to give an explanation of the results that you obtain.

Double square 2 will give an error because both “square” and “2” are passed in to the function “double”
Typing “Double” will also give an error because there are no arguments to the function.

Main> double square
ERROR - Type error in application
*** Expression     : double square
*** Term           : square
*** Type           : Int -> Int
*** Does not match : Int

Main> 2 double
ERROR - Cannot infer instance
*** Instance   : Num ((Int -> Int) -> a)
*** Expression : fromInt 2 double


Task 4: Edit the file FirstLiterate.lhs to include definitions of functions from integers to integers which behave as follows.
The function should double its input and square the result of that.
The function should square its input and double the result of that.
Your solution should include declarations of the types of the functions.

The function to double the input and square its result.

> doubleSquare :: Int -> Int
> doubleSquare n = (2*n)*(2*n)

The function should square its input and double the result of that.

> squareDouble :: Int -> Int
> squareDouble n = 2*(n*n)
