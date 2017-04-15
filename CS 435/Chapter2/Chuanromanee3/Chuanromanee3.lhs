*********       Tya Chuanromanee        **********
*********       Week 2 Programs         **********
*********       2.1 to 2.5              **********

> module Week3Programs where

2.1 Define a module UsePictures which imports Pictures and contain? definitions
of blackHorse, rotate and rotateHorse which can use the detinitions
imported from Pictures.

In the remaining questions you are expected to add other definitions to your
module UsePictures.

> module UsePictures where
> import Pictures hiding (rotate)

> blackHorse :: Picture
> blackHorse = invertColour horse

> rotate :: Picture -> Picture
> rotate = flipH . flipV

> rotateHorse :: Picture
> rotateHorse = rotate horse


2.2 How would you make a definition of a black rectangle? How could you do
this without using white, but assuming that you have a function superimpose
defined as discussed on page 5?

By superimposing inverted horse on top of horse

> blackRect :: Picture
> blackRect = superimpose horse (invertColour horse)

2.3 How could you make the picture (shown in the text)?
Try to find two different ways of getting the result. It may help to work with
pieces of white and black paper.
Using your answer to the first part of this question, how would you define a chess
(or checkers) board, which is an 8 x 8 board of alternating squares?

Method 1:
sideBySide of white and inverted white, then
sideBySide of inverted white and white, then put the first one above

> topPart :: Picture
> topPart = sideBySide white (invertColour white)
> bottomPart :: Picture
> bottomPart = sideBySide (invertColour white) white
> method1 :: Picture
> method1 = above topPart bottomPart

Method 2:
Put white above invertColour white, then
Put invertColour white above white, then
Above the first over the second

> leftPart :: Picture
> leftPart = above white (invertColour white)
> rightPart :: Picture
> rightPart = above (invertColour white) white
> method2 :: Picture
> method2 = sideBySide leftPart rightPart

Defining a chessboard:
One can use either method mentioned above and generate a 2x2 square of black and white squares.
Then you can use sideBySide to join 4 of these together 4x, and use "above" to join the 4 parts.
Or, you can use above to join 2 of these together 4 times, then use sideBySide 4x to join the parts.


2.4 Three variants of the last picture which involve the 'horse' pictures are shown below.
How would you produce these three?

Variant 1:

> leftPart1 :: Picture
> leftPart1 = above horse blackHorse
> rightPart1 :: Picture
> rightPart1 = above blackHorse horse
> variant1 :: Picture
> variant1 = sideBySide leftPart1 rightPart1

Variant 2:

> topPart2 :: Picture
> topPart2 = sideBySide horse blackHorse
> bottomPart2 :: Picture
> bottomPart2 = sideBySide (flipV blackHorse) (flipV horse)
> variant2 :: Picture
> variant2 = above topPart2 bottomPart2

Variant 3:

> topPart3 :: Picture
> topPart3 = sideBySide horse blackHorse
> bottomPart3 :: Picture
> bottomPart3 = sideBySide (rotate blackHorse) rotateHorse
> variant3 :: Picture
> variant3 = above topPart3 bottomPart3


2.5 Give another variant of the 'horse' pictures in the previous question, and show
how it could be created. Note: a nice variant is shown below.

For the given variant above:

> variant4 :: Picture
> variant4 = sideBySide (above horse (rotate blackHorse)) (above blackHorse rotateHorse)

Another probable variant:

> variant5 :: Picture
> variant5 = above (sideBySide blackHorse horse) (sideBySide (flipV horse) (flipV blackHorse))
