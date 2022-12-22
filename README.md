# ClosureConcatenation

This tiny Swift package extends the Swift language with an operator that combines two closures into one.

The operator is a pipe bar followed by a right-pointing angle bracket: `|>`

It's left-associative.

The closure concatenation operator has multiple overloads.

The first form takes two closures that accept no arguments and return no values.  It yields a new closure that simply runs the LHS and then runs the RHS.

All other forms attempt to match an LHS's return type with an RHS's argument type, producing a new closure that runs the LHS and "pipes" the LHS's output as input to the RHS, returning whatever the RHS returns.

This is similar in concept to the "pipe" operator from shell environments.
