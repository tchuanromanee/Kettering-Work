ADD HEADER HERE
3.4 DIAGRAM

3.1 Give another version of the definition of 'exclusive or' which works informally
thus: 'exclusive or of x and y will be True if either x is True and y is False. or
vice versa'.

> exOr ::  Bool -> Bool -> Bool
> exOr a b = (a && not b) || (b && not a)

3.3 Using literals on the left-hand side we can make the truth table for a function
into its Haskell definition. Complete the following definition of exOr in this
style.
exOr True True = . . .
exOr True False = . . .
...

exOr True True = False
exOr True False = True
exOr False True = True
exOr False False = False


3.4 Give two different definitions of the nAnd function
nAnd :: Bool -> Bool -> Bool
which returns the result True except when both its arguments are True. Give a
diagram illustrating one of your definitions.

> nAnd1 :: Bool -> Bool -> Bool
> nAnd1 a b = not (a && b)

> nAnd2 :: Bool -> Bool -> Bool
> nAnd2 a b = (not a) || (not b)


3.5 Give line-by-line calculations of
nAnd True True
nAnd True False
for each of your definitions of nAnd in the previous exercise

~ nAnd1 True True
~ not (True && True)
~ not True
~ False

~ nAnd1 True False
~ not (True && False)
~ not False
~ True

~ nAnd2 True True
~ (not True) || (not True)
~ False || (not True)
~ False || False
~ False

~ nAnd2 True False
~ (not True) || (not False)
~ False || (not False)
~ False || True
~ True


3.6 Explain the effect of the function defined here:
mystery :: Int -> Int -> Int -> Bool
mystery m n p = not ((m==n) && (n==p))
Hint: if you find it difficult to answer this question directly, try to see what the
function does on some example inputs.

The function determines if the sequence contains no more than 2 equal numbers
Or, to word it differently, the sequence does not contain all the same numbers.
For example:

~ mystery 1 3 1
~ not ((1==3) && (3==1))
~ not (False && (3==1))
~ not (False && False)
~ not False
~ True

~ mystery 1 2 3
~ not ((1==2) && (2==3))
~ not (False && False))
~ not False
~ True

~ mystery 3 3 3
~ not ((3==3) && (3==3))
~ not (True && (3==3))
~ not (True && True)
~ not True
~ False

3.7 Define a function
threeDifferent :: Int -> Int -> Int -> Bool
so that the result of threeDif f erent m n p is True only if all three of the
numbers m, n and p are different.
What is your answer for threeDifferent 3 4 3? Explain why you get the
answer that you do.

> threeDifferent :: Int -> Int -> Int -> Bool
> threeDifferent m n p = (m /= n) && (n /= p) && (m /= p)

The result is false.
~ threeDifferent 3 4 3
~ (3 /= 4) && (4 /= 3) && (3 /= 3)
~ True && (4 /= 3) && (3 /= 3)
~ True && True && (3 /= 3)
~ True && True && False
~ True && False
~ False


3.8 This question is about the function
fourEqual : : Int -> Int -> Int -> Int -> Bool
which returns the value True only if all four of its arguments are equal.
Give a definition of fourEqua1 modelled on the definition of threeEqua1
above. Now give a definition off fourEqual which uses the function threeEqual
in its definition. Compare your two answers.

> threeEqual :: Int -> Int -> Int -> Bool
> threeEqual a b c = (a == b) && (b == c)

> fourEqual :: Int -> Int -> Int -> Int -> Bool
> fourEqual a b c d = (a == b) && (b == c) && (c == d)

> fourEqualDerived :: Int -> Int -> Int -> Int -> Bool
> fourEqualDerived a b c d = (threeEqual a b c) && (a == d)


3.9 Give line-by-line calculations of
threeEqua1 (2+3) 5 (11 'div' 2)
mystery (2+4) 5 (11 'div' 2)
threeDifferent (2+4) 5 (I1 'div' 2)
fourEqual (2+3) 5 (11 'div' 2) (21 'mod' 11)

threeEqual (2+3) 5 (11 'div' 2)
~ ((2+3) == 5) && (5 == (11 'div'2))
~ (5 == 5) && (5 == (11 'div'2))
~ (5 == 5) && (5 == 5)
~ True && (5 == 5)
~ True && True
~ True

mystery (2+4) 5 (11 'div' 2)
~ not (((2+4) == 5) && ( 5 == (11 `div` 2))
~ not ((6 == 5) && (5 == (11 `div` 2))
~ not ((6 == 5) && (5 == 5))
~ not (False && (5 == 5))
~ not (False && True)
~ not False
~ True

threeDifferent (2+4) 5 (11 'div' 2)
~ ((2+4) /= 5) && (5 /= (11 `div` 2) && ((2+4) /= (11 `div` 2))
~ (6 /= 5) && (5 /= (11 `div` 2) && ((2+4) /= (11 `div` 2))
~ (6 /= 5) && (5 /= 5) && ((2+4) /= (11 `div` 2))
~ (6 /= 5) && (5 /= 5) && (6 /= (11 `div` 2))
~ (6 /= 5) && (5 /= 5) && (6 /= 5)
~ True && (5 /= 5) && (6 /= 5)
~ True && False && (6 /= 5)
~ True && False && True
~ False && True
~ False

fourEqual (2+3) 5 (11 'div' 2) (21 'mod' 11)
~ ((2+3) == 5) && (5 == (11 'div' 2)) && ((11 'div' 2) == (21 'mod' 11))
~ (5 == 5) && (5 == (11 'div' 2)) && ((11 'div' 2) == (21 'mod' 11))
~ (5 == 5) && (5 == 5) && ((11 'div' 2) == (21 'mod' 11))
~ (5 == 5) && (5 == 5) && ((5 == (21 'mod' 11))
~ (5 == 5) && (5 == 5) && (5 == 10)
~ True && (5 == 5) && (5 == 10)
~ True && True && (5 == 10)
~ True && True && False
~ True && False
~ False

3.10 Give calculations of
max (3-2) (3*8)
maxThree (4+5) (2*6) (100 'div' 7)

~ max (3-2) (3*8)
~   (3-2) >= (3*8)
~   1 >= (3*8)
~   1 >= 24
~   False
~   (3*8)
~   24

~ maxThree (4+5) (2*6) (100 `div` 7)
~   ((4+5) >= (2*6)) && ((4+5) >= (100 `div` 7))
~   (9 >= (2*6)) && ((4+5) >= (100 `div` 7))
~   (9 >= 12) && ((4+5) >= (100 `div` 7))
~   (9 >= 12) && (9 >= (100 `div` 7))
~   (9 >= 12) && (9 >= 14)
~   False && (9 >= 14)
~   False && False
~   False
~   ((2*6) >= (100 `div` 7))
~   (12 >= (100 `div` 7))
~   (12 >= 14)
~   False
~   (100 `div` 7)
~   14


3.11 Give definitions of the functions
min :: Int -> Int -> Int
minThree : : Int -> Int -> Int -> Int
which calculate the minimurn of two and three integers, respectively.

> min :: Int -> Int -> Int
> min a b
>   | (a <= b) = a
>   | otherwise = b

> minThree :: Int -> Int -> Int -> Int
> minThree a b c
>   | (a <= b) && (a <= c) = a
>   | (b <= c) = b
>   | otherwise = c
