*********       Tya Chuanromanee        **********
*********       Week 5 Programs         **********
*********     3.12 to 3.17, 4.7-4.20    **********

> module Week5Programs where
> import Data.Char

3.12 Define a function to convert small letters to capitals which returns unchanged
characters which are not small letters

> toUpper :: Char -> Char
> toUpper letter
>   | isLower(letter) = chr(ord(letter) - (ord('a') - ord('A')))
>   | otherwise = letter

3.13 Define the function
charToNum :: Char -> Int
which converts a digit like '8' to its value, 8. The value of non-digits should be
taken to be 0.

First, define function isDigit for checking

> offset :: Int
> offset = ord('0')

> charToNum :: Char -> Int
> charToNum c
>       | isDigit(c) == False = 0
>       | otherwise = ord(c) - offset


3.14 Give a function to return the average of three integers
averageThree : : Int -> Int -> Int -> Float
Using this function define a function
howManyAboveAverage : : Int -> Int -> Int -> Int
which returns how many of its inputs are larger than their average value.

> averageThree :: Int -> Int -> Int -> Float
> averageThree a b c = fromIntegral(a + b + c) / 3


The remainder of the questions look at solutions to a quadratic equation
a*x^2 + b*x + c = 0.0 where a. b and c are real numbers. The equation has
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
>       | b^2 > (4.0 * a * c) = 2
>       | (b^2) == (4.0 * a * c) = 1
>       | otherwise = 0

3.16 Using your answer to the last question, write a function
numberRoots : : Float -> Float -> Float -> Int
that given the coefficients of the quadratic, a, b and c, will return how many
roots the equation has. In the case that the equation has every number a root you
should return the result 3.

> numberRoots :: Float -> Float -> Float -> Int
> numberRoots a b c
>       | a == 0 && b == 0.0 && c == 0.0 = 3
>       | a == 0 && b == 0 && c /= 0.0 = 0
>       | a == 0 && b /= 0 = 1
>       | otherwise = numberNDroots a b c


3.17 The formula for the roots of a quadratic is
 (-b (+-) (b^2-4ac)^(1/2)) / 2a
Write definitions of the functions
smallerRoot, 1argerRoot :: Float -> Float -> Float -> Float
which return the smaller and larger real roots of the quadratic. In the case that
the equation has no real roots or has all values as roots you should return zero
as the result of each of the functions.

> smallerRoot :: Float -> Float -> Float -> Float
> smallerRoot a b c
>       | (4.0 * a * c) > (b^2) = 0.0
>       | a == 0 = 0.0
>       | numberRoots a b c == 0 = 0
>       | otherwise = ((-b) - sqrt( (b^2) - (4 * a * c) )) / (2 * a)

> largerRoot :: Float -> Float -> Float -> Float
> largerRoot a b c
>       | (4 * a * c) > (b^2) = 0.0
>       | a == 0 = 0.0
>       | numberRoots a b c == 0 = 0
>       | otherwise = ((-b) + sqrt((b^2) - (4 * a * c) )) / (2 * a)


4.1 This question is about the function
maxFour :: Int -> Int -> Int -> Int -> Int
which returns the maximum of four integers. Give three definitions of this
function: the first should be modelled on that of maxThree, the second should
use the function max and the third should use the functions max and maxThree.
For your second and third solutions give diagrams to illustrate your answers.
Discuss the relative merits of the three solutions you have given

> maxThree :: Int -> Int -> Int -> Int
> maxThree x y z = max (max x y) z

> maxFour1 :: Int -> Int -> Int -> Int -> Int
> maxFour1 a b c d
>       | a > maxThree b c d = a
>       | otherwise = maxThree b c d

> maxFour2 :: Int -> Int -> Int -> Int -> Int
> maxFour2 a b c d = (a `max` b) `max` (c `max` d)

> maxFour3 :: Int -> Int -> Int -> Int -> Int
> maxFour3 a b c d = max (maxThree a b c) d

maxFour3 is the best function to use.
maxFour1 needs guards and may need to invoke maxThree twice.
maxFour2 invokes `max` three times, causing it to be inefficient.
maxFour3 is the best function because it is the simplest and invokes only two functions,
max and maxThree.



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

> weakAscending :: Int -> Int -> Int -> Bool
> weakAscending m n p = ((m <= n) && (n <= p))

> between :: Int -> Int -> Int -> Bool
> between m n p
>       | (weakAscending m n p) || (weakAscending p n m) = True
>       | otherwise = False

4.3 Give a definition of the function
howManyEqual : : Int -> Int -> Int -> Int
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
think what if...?

Defining analogue functions for FourEquals:
fourEqual is taken from previous exercise (3.8)
fourDifferent is an extension of threeDifferent

> fourEqual :: Int -> Int -> Int -> Int -> Bool
> fourEqual a b c d = (threeEqual a b c) && (a == d)

> fourDifferent :: Int -> Int -> Int -> Int -> Bool
> fourDifferent m n o p = (m /= n) && (n /= p) && (n /= o) && (o /= p) && (m /= p) && (m /= o)

> howManyOfFourEqual :: Int -> Int -> Int -> Int -> Int
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


4.8 The integer square root of a positive integer n is the largest integer whose square
is less than or equal to n. For instance, the integer square roots of 15 and 16 are
3 and 4, respectively. Give a primitive recursive definition of this function.

> largestRootHelper :: Int -> Int -> Int
> largestRootHelper n m
>       | (m * m) > n = m - 1
>       | otherwise = largestRootHelper n (m + 1)

> largestRoot :: Int -> Int
> largestRoot n = largestRootHelper n 1


4.9 Given a function f of type Int -> Int, give a recursive definition of a function
of type Int -> Int which on input n returns the maximum of the values f 0,
f I, . . . , f n. You might find the max function defined in Section 3.4 useful.
To test this function, add to your script a definition of some values of f thus:

f 0 = 0
f 1 = 44
f 2 = 17
f _ = 0

and so on, then test your function at various values.

> testFunc :: Int -> Int
> testFunc n
>   | n == 0 = 0
>   | n == 1 = 44
>   | n == 2 = 17
>   | otherwise = 0

> maxOff :: (Int -> Int) -> Int -> Int
> maxOff f n
>   | n <= 0 = f n
>   | otherwise = max (f n) (maxOff f (n-1))


4.10 Given a function f of type Int -> Int give a recursive definition of a function
of type Int -> Bool which on input n returns True if one or more of the values
f 0, f I, . . . , f n is zero and False otherwise.

> zeroInFunc :: (Int -> Int) -> Int -> Bool
> zeroInFunc f n
>   | f n == 0 = True
>   | n == 0 = False
>   | otherwise = zeroInFunc f (n-1)

Define another function to use for testing:

> testFunc2 :: Int -> Int
> testFunc2 n
>   | n == 0 = 100
>   | n == 1 = 44
>   | n == 2 = -17
>   | otherwise = 0

4.11 Can you give a definition of regions which instead of being recursive uses the
function sumFun?

> sumFun :: (Int -> Int) -> Int -> Int
> sumFun f n
>   | n == 0 = f 0
>   | n > 0 = sumFun f (n-1) + n

> regions :: Int -> Int
> regions n
>   | n == 0 = 1
>   | n == 1 = 2
>   | otherwise = n + sumFun regions (n-1)

4.12 [Harder] Find out the maximum number of pieces we can get by making a given
number of flat (that is planar) cuts through a solid block. It is not the same
answer as we calculated for straight-line cuts of a flat piece of paper.

Max number of pieces is 2^n where n is the number of cuts.
After cutting once, stack pieces and cut the stack in half.

> numCuts :: Int -> Int
> numCuts n
>   | n == 1 = 2
>   | n == 0 = 0
>   | otherwise =  2 * numCuts(n-1)

4.13 Give a recursive definition of a function to find the highest common factor of
two positive integers.

> highestCF :: Int -> Int -> Int
> highestCF a b
>       | (a == 0) || (b == 0) = (a + b)
>       | a > b = highestCF (a-b) b
>       | otherwise = highestCF (b-a) a


4.14 Suppose we have to raise 2 to the power n. If n is even, 2*m say, then
2^n = 2^(2*m) = (2^m)^2
Tf n is odd, 2*m+l say, then
2^n = 2^(2*m+1) = ((2^m)^2)*2
Give a recursive function to compute 2^n which uses these insights.

> powOfNEven :: Int -> Int
> powOfNEven m = powOfN(m) * powOfN(m)

> powOfNOdd :: Int -> Int
> powOfNOdd m = 2 * powOfN(m) * powOfN(m)

> powOfN :: Int -> Int
> powOfN n
>       | n == 0 = 1
>       | n == 1 = 2
>       | n `mod` 2 == 0 = powOfNEven (n `div` 2)
>       | n `mod` 2 /= 0 = powOfNOdd ((n-1) `div` 2)


4.15 Devise test data for a function
allEqual :: Int -> Int -> Int -> Bool
intended to test whether its three integer inputs are equal.

According to Black box testing, we need to test:
    -When all are equal (3 3 3)
    -When 2 are equal (2 2 3) (2 3 2) (3 3 2)
    -When none are equal (1 2 3)

4.16 Use the test data from the previous question to test the function
solution m n p = ((m+n+p)==3*p)
Discuss your results.


According to Black Box testing, we need to test:
    -Result should be False because sum of first 2 inputs is equal to third input  (1 2 3)
    -When the result should be True (1 1 1) (2 4 3) (4 2 3)
    -Positional differences that should result in False (3 2 4)

The third input p should be equal to (m+n)/2 in order for the function to evaluate as two.


4.17 The function
allDifferent :: Int -> Int -> Int -> Bool
should return True only if all its inputs are different. Devise black box test data
for this function.

Test Cases:
    - All the same (3 3 3)
    - All different (1 2 3)
    - 2 the same (2 2 3) (3 2 2) (2 3 2)


4.18 Test the following function
attempt m n p = (m/=n) && (n/=p)
using the test data written in the previous question. What do you conclude on
the basis of your results?

> attempt :: Int -> Int -> Int -> Bool
> attempt m n p = (m /= n) && (n /= p)


Test results:
Week5Programs> attempt 3 3 3
False
Week5Programs> attempt 1 2 3
True
Week5Programs> attempt 2 2 3
False
Week5Programs> attempt 3 2 2
False
Week5Programs> attempt 2 3 2
True

Conclusion: The function returns true if all are different or if the second number is unique (first
and last can be the same number). If I did not know what was inside of the function I would
conclude that it tried to check if the middle number of a sequence of 3 numbers is unique.

4.19 Devise test data for a function
howManyAboveAverage :: Int -> Int -> Int -> Int
which returns how many of its three integer inputs are larger than their average
value.

Two above average:
    1 40 41
    40 1 41
    40 41 1
One above average:
    3 1 2
    1 2 3
    1 3 2
None above average: 1 1 1


4.20 Devise test data for a function to raise two to a positive integer power.

Since the function is designed so that the power of 2 is positive, there is no need to
test it on negative numbers.
Test on positive even number, positive odd number, and zero.
Test on a number greater than 10 also to see if it has a limit.
a: Test n = 0
b: Test n = 1
c: Test n = 2
d: Test n = 4
e: Test n = 5
e. Test n = 11
