"Elixir tries to be declarative not imperative".

<!-- nvr quite understood exactly what that means. -->

most control flow is handled by pattern matching and guard clauses.

Advantage of using pattern matching over if and case:

*   Tend toward shorter functions that are more focused
*   Easier to read, test, reuse


`if` and `unless`:

two params, condition and keyword list
Only used for max of 2 branch conditionals; more nds `cond`
value of if and unless is the value of the expression evaluated


`cond`:

allows for multiple conditionals
the "default" case in an elixir `cond` uses `true -> # expression`. In other
words, if none of the previous clauses eval to truthy, this one does.

`case`:


