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
> offset = 48

************~~~~~~~~~~~~*!!!!!!! Actually calculate******************[DC]

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

3.16 Using your answer to the last question, write a function
numberRoots : : Float -> Float -> Float -> Int
that given the coefficients of the quadratic, a, b and c, will return how many
roots the equation has. In the case that the equation has every number a root you
should return the result 3.

> numberRoots :: Float -> Float -> Float -> Int
> numberRoots a b c

--------------Notes--------------
ax^2 + bx + c = 0
a != 0 -> Non-degenerate
a == 0 -> Degenerate
     check bx + c = 0 by solving for x, and plugging it in to see if it is consistent
     If a = 0 and b = 0, c must be 0 or else no solution (ie. degenerate)

!!!!! Must illustrate both nondegenerate AND degenerate case !!!!!!!!!!
--------------/Notes-------------



3.17 The formula for the roots of a quadratic is
 (-b (+-) (B^2-4ac)^(1/2))/2a
Write definitions of the functions
smallerRoot, 1argerRoot :: Float -> Float -> Float -> Float
which return the smaller and larger real roots of the quadratic. In the case that
the equation has no real roots or has all values as roots you should return zero
as the result of each of the functions.

> smallerRoot


4.1 This question is about the function
maxFour :: Int -> Int -> Int -> Int -> Int
which returns the maximum of four integers. Give three definitions of this
function: the first should be modelled on that of maxThree, the second should
use the function max and the third should use the functions max and maxThree.
For your second and third solutions give diagrams to illustrate your answers.
Discuss the relative merits of the three solutions you have given.

> maxThree :: Int -> Int -> Int -> Int
> maxThree x y z = rnax (max x y) z

> maxFour1 :: Int -> Int -> Int -> Int -> Int
> maxFour1 a b c d = max (max (max a d) c) d

> maxFour2 :: Int -> Int -> Int -> Int -> Int
> maxFour2 a b c d = (a `max` b) `max` (c `max` d)

> maxFour3 :: Int -> Int -> Int -> Int -> Int
> maxFour3 a b c d = max (maxThree a b c) d

~~~~~~~~~~~~~DISCUSS~~~~~~~~~~~~~~~~[DC]

4.2 Give a definition of the function
between : : Int -> Int -> Int -> Bool
discussed in this section. The definition should be consistent with what we said
in explaining how middleNumber works. You also need to think carefully about
the different ways that one number can lie between two others. You might find
it useful to define a function
weakAscendingOrder :: Int -> Int -> Int -> Bool
so that weakAscendingOrder m n p is True exactly when m, n and p are in
weak ascending order, that is the sequence does not go down at any point. An
example of such a sequence is 2 3 3.

> between :: Int -> Int -> Int -> Bool
> betwen m n p = ((m >= n) && (m <= p))

> middleNumber :: Int -> Int -> Int -> Int
> middleNumber m n p
>       | (between m n p) || (between m p n) = m
>       | (between n m p) || (between n p m) = n
>       | otherwise = p

4.3 Give a definition of the function
howManyEqua1 : : Int -> Int -> Int -> Int
which returns how many of its three arguments are equal, so that

howManyEqual 34 25 36 = 0
howManyEqual 34 25 34 = 2
howManyEqual 34 34 34 = 3

Think about what functions you have already seen - perhaps in the exercises -
which you can use in the solution.

threeEqual and threeDiff are from previous exercises.

> threeEqual :: Int -> Int -> Int -> Bool
> threeEqual a b c = (a == b) && (b == c)

> threeDifferent :: Int -> Int -> Int -> Bool
> threeDifferent m n p = (m /= n) && (n /= p) && (m /= p)

We can use threeEqual and threeDiff as cases for howManyEqual.
The result of howManyEqual will always be 0, 2, or 3 (Cannot have only 1 number
equal).

> howManyEqual :: Int -> Int -> Int -> Int
> howManyEqual a b c
>     | threeDifferent a b c   = 0
>     | threeEqual a b c  = 3
>     | otherwise         = 2


4.4 Give a definition of the function
howManyOfFourEqua1 :: Int -> Int -> Int -> Int -> Int
which is the analogue of howManyEqua1 for four numbers. You may need to
think what if . . . ?.

Defining analogue functions for FourEquals:
fourEqual is taken from previous exercise (3.8)
fourDifferent is an extension of threeDifferent

> fourEqual :: Int -> Int -> Int -> Int -> Bool
> fourEqual a b c d = (threeEqual a b c) && (a == d)

> fourDifferent :: Int -> Int -> Int -> Int -> Bool
> fourDifferent m n o p = (m /= n) && (n /= p) && (n /= o) && (o /= p) && (m /= p) && (m /= o)

> howManyOfFourEqual :: Int -> Int -> Int -> Int
> howManyOfFourEqual a b c d
>       | fourDifferent a b c d = 0
>       | fourEqual a b c d = 4
>       | ((threeEqual a b c) || (threeEqual a c d) || (threeEqual b c d) || (threeEqual a b d)) = 3
>       | otherwise = 2

4.7 Using the addition function over the natural numbers, give a recursive definition
of multiplication of natural numbers.

The definition of multiplication means that you add a number a certain amount of times.

> mult :: Int -> Int -> Int
> mult a b
>   | (a == 0) || (b == 0) = 0
>   | otherwise = b + (mult (a-1) b)
