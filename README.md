Defining Parker's Concatenation
===============================

Inspired by [Numberphile], I defined a concatenation operator in
Haskell. Note: I'm not very good at Haskell. Regardless, I gave it the
ol' Parker Square of a try.

```haskell
*Main> :l parker
*Main> 1 * 2 ^-^ 3 + ((4 * 5 * 6) ^-^ 7 + 8) * 9
10958
```

 - [View the source][source]
 - [Read the write-up][doc]

[Numberphile]: https://www.youtube.com/watch?v=LgnoYsbI7Uc
[source]: https://github.com/eddieantonio/parker-concatenation/blob/master/parker.lhs
[doc]: https://github.com/eddieantonio/parker-concatenation/blob/master/parker.pdf
