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
> nAnd1 True True
~ not (True && True)
~ not True
~ False
> nAnd1 True False
~ not (True && False)
~ not False
~ True
> nAnd2 True True
~ (not True) || (not True)
~ False || (not True)
~ False || False
~ False
> nAnd2 True False
~ (not True) || (not False)
~ False || (not False)
~ False || True
~ True


3.6 Explain the effect of the function defined here:
mystery :: Int -> Int -> Int -> Bool
mystery m n p = not ((m==n) && (n==p))
Hint: if you find it difficult to answer this question directly, try to see what the
function does on some example inputs.

The function determines if the number contains no more than 2 equal numbers
For example:
> mystery 1 3 1
~ not ((1==3) && (3==1))
~ not (False && (3==1))
~ not (False && False)
~ not False
~ True

> mystery 1 2 3
~ not ((1==2) && (2==3))
~ not (False && False))
~ not False
~ True

> mystery 3 3 3
~ not ((3==3) && (3==3))
~ not (True && (3==3))
~ not (True && True)
~ not True
~ False
