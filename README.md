Defining Parker's Concatenation
===============================

Inspired by [Numberphile], I defined a concatenation operator in
Haskell. Note: I'm not very good at Haskell. Regardless, I gave it the
ol' Parker Square of a try. Consequently, instead of defining the
operator as `||`, I defined it as the Parker Square: ■.

```haskell
Prelude> :l parker
[1 of 1] Compiling Main             ( parker.lhs, interpreted )
Ok, modules loaded: Main.
*Main>  1 * 2 ■ 3 + ((4 * 5 * 6) ■ 7 + 8) * 9
10958
```

 - [View the source][source]
 - [Read the write-up][doc]

[Numberphile]: https://www.youtube.com/watch?v=LgnoYsbI7Uc
[source]: https://github.com/eddieantonio/parker-concatenation/blob/master/parker.lhs
[doc]: https://github.com/eddieantonio/parker-concatenation/blob/master/parker.pdf
