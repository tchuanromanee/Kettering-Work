*********       Tya Chuanromanee        **********
*********       Week 5 Programs         **********
*********     3.12 to 3.17, 4.7-4.20    **********

> module Week5Programs where
> import Data.Char

3.12 Define a function to convert small letters to capitals which returns unchanged
characters which are not small letters

(In the notes)

3.13 Define the function
charToNum :: Char -> Int
which converts a digit like '8' to its value, 8. The value of non-digits should be
taken to be 0.

First, define function isDigit for checking

> offset :: Int
> offset = 48 ************~~~~~~~~~~~~*!!!!!!! Actually calculate******************[DC]

> charToNum :: Char -> Int
> charToNum c
>       | isDigit(c) == False = 0
>       | otherwise = ord(c) - offset


3.14 Give a function to return the average of three integers
averageThree : : Int -> Int -> Int -> Float
Using this function define a function
howManyAboveAverage : : Int -> I n t -> I n t -> I n t
which returns how many of its inputs are larger than their average value.

(In the notes)

The remainder of the questions look at solutions to a quadratic equation
a*x^2 + b*x + c = 0.0

where a. b and c are real numbers. The equation has
two real roots, if b^2 > 4.0*a*c;
one real root, if b^2 == 4.0*a*c; and
no real roots, if b^2 < 4.0*a*c.
This assumes that a is non-zero - the case which we call non-degenerate. In
the degenerate case, there are three sub-cases:
one real root, if b /= 0.0;
no real roots, if b == 0.0 and c /= 0.0;
every real number a root, if b == 0.0 and c == 0.0.

3.15 Write a function
numberNDroots :: Float -> Float -> Float -> Int
that given the coefficients of the quadratic, a, b and c, will return how many
roots the equation has. You may assume that the equation is non-degenerate.

> numberNDroots :: Float -> Float -> Float -> Int
> numberNDroots a b c
>       | (b^2 > 4.0*a*c) = 2
>       | (b^2 == 4.0*a*c) = 1
>       | (b^2 < 4.0*a*c) = 0
[DC]

3.16 Using your answer to the last question, write a function
numberRoots : : Float -> Float -> Float -> Int
that given the coefficients of the quadratic, a, b and c, will return how inany
roots the equation has. In the case that the equation has every number a root you
should return the result 3.
