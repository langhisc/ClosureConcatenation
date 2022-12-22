//
//  ClosureConcatenation.swift
//  Desti
//
//  Created by Sean Langhi on 12/13/22.
//

// MARK: - Operators

precedencegroup ClosureConcatenationPrecedence {
    higherThan: AssignmentPrecedence
    associativity: left
}

infix operator |> : ClosureConcatenationPrecedence

// MARK: - Functions

/// Combines two closures into one.  The arguments will be run in the order given.
func |> (
    first: @escaping () -> Void,
    second: @escaping () -> Void
)
->
() -> Void {
    return {
        first()
        second()
    }
}

/// Combines two closures into one.  The arguments will be run in the order given.  The output of `first` will be used as the input of `second`.  This is similar to the "pipe" operator from shell environments.
func |> <A> (
    first: @escaping () -> A,
    second: @escaping (A) -> Void
)
->
() -> Void {
    return {
        let result = first()
        second(result)
    }
}
